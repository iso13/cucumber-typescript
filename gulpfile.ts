import { series, watch } from 'gulp';
import * as fs from 'fs';
import * as fsExtra from 'fs-extra';
import { exec } from 'child_process';

const reportFolder: string = 'reports';
const jsonReportsFolder: string = 'reports/cucumber-json-reports';
const archivedFolder: string = 'reports/archived';

/**
 * Create folders for the tests to send their reports to
 * If the directory structure does not exist, it is created
 */
async function createFolders() {
  console.log('Creating file structure ...');
  await fsExtra.mkdirp(reportFolder);
  await fsExtra.mkdirp(jsonReportsFolder);
  await fsExtra.mkdirp(archivedFolder);
}

/**
 * Copy old json reports into new archived directory
 */
async function archiveJsonReport() {
  if (await fsExtra.pathExists(jsonReportsFolder)) {
    if ((await isReportingComplete()) === true) {
      console.log('Archiving old json report ...');
      await fsExtra.copy(jsonReportsFolder, archivedFolder);
      await fsExtra.emptyDir(jsonReportsFolder);
    }
  }
}

/**
 * Build a report using https://github.com/damianszczepanik/cucumber-sandwich
 */
async function buildCucumberSandwichReport() {
  if (await isReportingComplete()) {
    console.log('Building cucumber sandwich report ...');
    await executeShellCommand(
      'java -jar support/cucumber-sandwich.jar -n -f reports/cucumber-json-reports -o reports/'
    );
  }
}

/**
 * Build a report using cluecumber https://github.com/trivago/cluecumber-report-plugin
 */
async function buildCluecumberReport() {
  if (await isReportingComplete()) {
    console.log('Building cluecumber report ...');
    await executeShellCommand('mvn -f support/pom.xml cluecumber-report:reporting');
  }
}

async function isReportingComplete(): Promise<boolean> {
  let jsonsNotEmpty: string[] = [];
  let listOfFiles: string[] = fs.readdirSync(jsonReportsFolder);
  let reportsFilesReady: boolean = true;
  if (listOfFiles === undefined || listOfFiles.length === 0) {
    console.log('There is no json report available');
    return false;
  } else {
    //Check if the json files have data for reports
    listOfFiles.forEach(function(file) {
      file = jsonReportsFolder + '/' + file;
      let stat = fs.statSync(file);
      if (stat.isFile()) {
        let jsonFile = fs.readFileSync(file);
        if (jsonFile == undefined || Object.keys(jsonFile).length == 0) {
          reportsFilesReady = false;
        }
      }
    });
    if (reportsFilesReady.valueOf() === false) {
      console.log('JSON reporting was not complete ...');
      return false;
    }
    //Reporting is finished
    console.log('JSON reporting complete ...');
    return true;
  }
}

/**
 * Typescript compile the project
 */
async function tsCompile() {
  console.log('Compiling ...');
  await executeShellCommand('tsc');
}

/**
 * Execute any shell command (note there are buffer issues if there is large output from commands)
 * @param commandToRun
 */
async function executeShellCommand(commandToRun: string) {
  // Await a new promise:
  await new Promise((resolve, reject) => {
    exec(commandToRun, function(error, stdout, stderr) {
      console.log('Running Command ' + commandToRun + ' ...');
      console.log('stdout: ' + stdout);
      console.log('stderr: ' + stderr);
      if (error !== null) {
        console.log('exec error: ' + error);
        // Reject if there is an error:
        return reject(error);
      }
      console.log('Resolved: ' + commandToRun);
      // Otherwise resolve the promise:
      resolve();
    });
  });
}

exports.default = async function() {
  await createFolders(),
    watch(
      jsonReportsFolder,
      series(
        await createFolders,
        await buildCluecumberReport,
        await buildCucumberSandwichReport,
        await archiveJsonReport
      )
    );
};

exports.buildReport = async function() {
  await createFolders(), await buildCucumberSandwichReport(), await archiveJsonReport();
};

exports.tsc = async function() {
  watch(
    ['./helpers/*', './config/*', './applicationObjects/*', './pages/*', './step_definitions/*', './support/*'],
    series(tsCompile)
  );
};

/**
 * This tasks clean jsonReportsFolder
 * without consider if report is/was generated
 */
exports.cleanJsonReport = async function cleanReportFolder() {
  console.log('Archiving old json report ...');
  await fsExtra.copy(jsonReportsFolder, archivedFolder);
  await fsExtra.emptyDir(jsonReportsFolder);
};
