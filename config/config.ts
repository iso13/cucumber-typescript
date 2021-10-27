/*
 * Protractor's config
 */

import { Config } from 'protractor';
import * as _ from 'lodash';
import * as path from 'path';
import { EventEmitter } from 'events';
import glob = require('glob');
const retry = require('protractor-retry').retry;
const { PickleFilter, getTestCasesFromFilesystem } = require('cucumber');
const eventBroadcaster = new EventEmitter();

export const config: Config = {
  //seleniumAddress: 'http://localhost:4444/wd/hub', //Use for selenium grid
  seleniumAddress: 'http://127.0.0.1:4444/wd/hub',

  /**
   * Set to true to support non Angular application
   */
  ignoreSynchronization: false,

  /**
   * Set to true if you are not using async/await
   */
  SELENIUM_PROMISE_MANAGER: false,
  seleniumArgs: ['-Dwebdriver.ie.driver=node_modules/protractor/selenium/IEDriverServer.exe'],

  baseUrl: '',

  allScriptsTimeout: 20000,

  /***
   * In this capabilities object you can set any details you want for
   * a particular browser from the command line (The ones set here are defaults)
   * Example: protractor dist/config/config.js --capabilities.chrome.platform='MAC'
   */
  capabilities: {
    chrome: {
      browserName: 'chrome',
      maxInstances: 1,
      count: 1,
      acceptInsecureCerts: true,
      'goog:chromeOptions': {
        excludeSwitches: ['enable-automation'],
        prefs: {
          download: {
            prompt_for_download: false,
            directory_upgrade: true,
            default_directory: path.join(process.cwd(), 'testData', 'downloads')
          }
        },
        w3c: false
      }
    },
    firefox: {
      browserName: 'firefox',
      shardTestFiles: true,
      maxInstances: 1,
      count: 1,
      acceptInsecureCerts: true
    },
    ie: {
      browserName: 'internet explorer',
      shardTestFiles: true,
      maxInstances: 1,
      count: 1,
      version: '11'
    },
    edge: {
      browserName: 'MicrosoftEdge',
      shardTestFiles: true,
      maxInstances: 1,
      count: 1
    },
    chromeHeadless: {
      browserName: 'chrome',
      maxInstances: 1,
      count: 1,
      chromeOptions: {
        args: ['--headless', '--disable-gpu'],
        prefs: {
          download: {
            prompt_for_download: false,
            directory_upgrade: true,
            default_directory: path.join(process.cwd(), 'testData', 'downloads')
          }
        }
      }
    },
    firefoxHeadless: {
      browserName: 'firefox',
      shardTestFiles: true,
      maxInstances: 1,
      count: 1,
      acceptInsecureCerts: true,
      'moz:firefoxOptions': {
        args: ['--headless']
      }
    }
  },

  /**
   * Max sessions refers to the number of browers allowed across a grid
   */
  maxSessions: 1,

  /**
   * Tests can be run by feature file or by scenario. This may be very useful when
   * we get to running tests by lambda, as in that case all scenarios can be run at once.
   * Note1: Running by scenario will cause visual duplication of features in reports
   * as each scenario will have it's own feature section
   * Note2: Each shard creates it's own report so if you scale up to thousands of scenarios
   * running in parallel you will have thousands of reports to be combined
   */
  isParallelByFeature: true,
  isParallelByScenario: false,

  specs: ['../../features/'],
  /*
   * Returns all feature file paths
   */
  getFeatures: function(): string[] {
    let files = glob.sync('features/**/*.feature');
    return _.sortedUniq(files);
  },

  /*
   * Use cucumber built in methods to return the list of tests to be run
   * (by scenario or feature file)
   * For more info see https://github.com/cucumber/cucumber-js/blob/master/src/cli/helpers.js
   */
  getFeaturesByTagExpression: async function(): Promise<any[]> {
    const cucumberTags = this.getCucumberCliTags();
    const cucumberFeatures = this.getFeatures();
    let self = this;
    let parallelLog = 'Parallel by: ';
    let testCases = await getTestCasesFromFilesystem({
      cwd: '',
      eventBroadcaster: eventBroadcaster,
      featurePaths: cucumberFeatures,
      order: 'defined',
      pickleFilter: new PickleFilter({
        tagExpression: cucumberTags
      })
    });
    let tests = [];
    if (self.isParallelByFeature && !self.isParallelByScenario) {
      console.log(parallelLog + 'Feature');
    } else {
      console.log(parallelLog + 'Scenario');
    }
    _.forEach(testCases, function(result) {
      if (self.isParallelByFeature && !self.isParallelByScenario) {
        tests.push(result.uri);
      } else {
        let lineNumber = result.pickle.locations[0].line;
        let uri = result.uri;
        let scenario = `${uri}:${lineNumber}`;
        tests.push(scenario);
      }
    });
    return _.sortedUniq(tests);
  },

  /**
   * Return the list of tags that cucumber is using for this run
   * Example Response: @demo and not @wip
   */
  getCucumberCliTags: function(): any {
    return _.get(config.cucumberOpts, 'tags') || '';
  },

  /**
   * Configures the browser
   * Assigns out a set of tests for a browser to run by instance
   */

  getMultiCapabilities: async function(): Promise<any> {
    let caps = [];
    let browsers = this.browsers.split(',');
    caps = await Promise.all(browsers.map(browserName => this.getBrowserCapabilities(browserName)));
    if (this.maxSessions === 1) {
      return this.doNotRunTestsInParallel(caps);
    } else {
      config.specs = [];
      this.specs = [];
      return await this.runTestsinParallel(caps);
    }
  },

  getBrowserCapabilities(browserName: string) {
    switch (browserName) {
      case 'chrome':
        console.log('Configuring capabilities, adding Chrome');
        return this.capabilities.chrome;
      case 'chromeHeadless':
        console.log('Configuring capabilities, adding Chrome in headless mode');
        return this.capabilities.chromeHeadless;
      case 'firefox':
        console.log('Configuring capabilities, adding Firefox');
        return this.capabilities.firefox;
      case 'firefoxHeadless':
        console.log('Configuring capabilities, adding Firefox in headless mode');
        return this.capabilities.firefoxHeadless;
      case 'edge':
        console.log('Configuring capabilities, adding Edge');
        return this.capabilities.edge;
      case 'ie':
        console.log('Configuring capabilities, adding IE');
        return this.capabilities.ie;
    }
  },

  doNotRunTestsInParallel(capabilities: any) {
    console.log('Not running tests in parallel');
    return capabilities;
  },

  runTestsinParallel: async function(capabilities: any[]) {
    console.log('Running tests in parallel');
    let files = await this.getFeaturesByTagExpression();
    let configs = [];
    _.map(files, file => {
      _.map(capabilities, function(capability) {
        let browserConfig = {
          specs: ['../../' + file],
          shardTestFiles: false,
          maxInstances: 1
        };
        configs.push(_.merge(browserConfig, capability));
      });
    });
    return configs;
  },

  framework: 'custom',

  frameworkPath: require.resolve('protractor-cucumber-framework'),

  beforeLaunch: () => {},

  plugins: [
    {
      package: 'protractor-image-comparison',
      options: {
        baselineFolder: 'testImages/baseline/',
        screenshotPath: 'testImages/',
        autoSaveBaseline: false,
        ignoreColors: false,
        saveAboveTolerance: 0.0,
        formatImageName: '{tag}-{browserName}-dpr-{dpr}'
      }
    }
  ],

  /**
   * Specify Cucumber options, reports formats, location of step definitions
   * 'dry-run': true will allows print out of the report without running Scenarios
   * tags: '@wip" Cucumber will ignore these files during execution
   */
  cucumberOpts: {
    compiler: 'ts:ts-node/register',
    format: ['node_modules/cucumber-pretty', 'json:reports/cucumber-json-reports/cucumber.json'],
    require: [
      '../../dist/step_definitions/**/*.js',
      '../../dist/step_definitions/*.js',
      '../../dist/support/*.js',
      '../../dist/helpers/*.js',
      '../../dist/pages/**/*.js'
    ],
    'dry-run': false,
    strict: true,
    tags: 'not @wip'
  },
  browsers: 'chrome',
  params: {
    env: 'master'
  },
  onCleanUp: results => {
    retry.onCleanUp(results);
  },
  onPrepare: function() {
    retry.onPrepare();
  },
  afterLaunch: function() {
    return retry.afterLaunch(-1);
  }
};
