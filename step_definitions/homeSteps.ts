import { Given, Then } from 'cucumber';
import { see, click } from 'blue-harvest';
import { HomePage } from '../pages/homePage';

const homePage: HomePage = new HomePage();

Given(/^(?:I )?start creating new group$/, async function() {
  await homePage.clickCreateGroup();
});

Given(/^I click on groups icon to see created groups$/, async () => {
  await click('GROUPS');
  await see('All Groups');
});

Then(/^the (?:[^"]+) logo should display on home page$/, async function() {
  const baselineFileName: string = this.testData.setImageComparisonPath(this, `home_carrier_logo`);
  const compResult: boolean = await homePage.imageComparison.compareElement(homePage.carrierLogo, baselineFileName);
  this.assert.isTrue(compResult, `Element [${homePage.carrierLogo}] doesn't match the image in [${baselineFileName}]`);
});

Then(/^the (?:[^"]+) logo should display in the top left corner of the page$/, async function() {
  const baselineFileName: string = this.testData.setImageComparisonPath(this, `nav_bar_carrier_logo`);
  await homePage.waitForElementVisibilityWithLocator(homePage.navBarLogo);
  const compResult: boolean = await homePage.imageComparison.compareElement(homePage.navBarLogo, baselineFileName);
  this.assert.isTrue(compResult, `Element [${homePage.navBarLogo}] doesn't match the image in [${baselineFileName}]`);
});
