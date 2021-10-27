/**
 * Cucumber hooks used to manage Before/After Features and Scenarios
 */

import { After, AfterAll, Before, BeforeAll, Status } from 'cucumber';
import { browser } from 'protractor';
import { FileDetector } from 'selenium-webdriver/remote';

BeforeAll({}, async function() {
  await browser.driver
    .manage()
    .window()
    .maximize();
  await browser.setFileDetector(new FileDetector());
});

Before({ tags: '@wip' }, async function() {
  return 'pending';
});

Before({ tags: '@core' }, async function() {
  this.implementation = 'core';
});

Before({ tags: '@principal' }, async function() {
  this.implementation = 'principal';
});

Before({ tags: '@adp' }, async function() {
  this.implementation = 'adp';
});

Before({ tags: '@axa' }, async function() {
  this.implementation = 'axa';
});

Before({ tags: '@trinet' }, async function() {
  this.implementation = 'trinet';
});

Before({ tags: '@transamerica' }, async function() {
  this.implementation = 'transamerica';
});

Before({ tags: '@cami' }, async function() {
  this.implementation = 'cami';
});

Before(async function(scenario) {
  await browser.manage().deleteAllCookies();
  await browser.waitForAngularEnabled(true);
  this.logger.info(`Starting Scenario: ${scenario.pickle.name}`);
});

After({}, async function(scenario) {
  this.logger.info(`Ending Scenario: ${scenario.pickle.name}`);
  if (scenario.result.status === Status.FAILED) {
    const screenShot = await browser.takeScreenshot();
    await this.attach(screenShot, 'image/png');
  }
});

After({ tags: '@screenshot' }, async function(scenario) {
  const screenShot = await browser.takeScreenshot();
  await this.attach(screenShot, 'image/png');
});

AfterAll({ timeout: 100 * 1000 }, async function() {
  await browser.quit();
});
