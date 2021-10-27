import { Given, When, Then } from 'cucumber';
import { not, see, type, click } from 'blue-harvest';
import { browser, by, element } from 'protractor';
import { LoginPage } from '../pages/loginPage';
import * as chai from 'chai';
import * as chaiAsPromised from 'chai-as-promised';
import * as environments from '../config/environments.json';
import * as loginDetails from '../config/users.json';

chai.use(chaiAsPromised);

export const expect = chai.expect;
const login: LoginPage = new LoginPage();

Given('I launch the application', async function() {
  await launchApplication(this);
});

Given('I login as a(n) {string}', async function(userRole: string) {
  await launchApplication(this);

  userRole = userRole
    .toLocaleLowerCase()
    .split(' ')
    .join('_');
  const user = loginDetails[this.implementation][userRole];
  await attemptTologin(user.username, user.password);
});

/**
 * @deprecated Created for image comparison tool demo, do NOT use it for real scenario
 */
When('I login using {string} as username and {string} as password', async function(email: string, pass: string) {
  await attemptTologin(email, pass);
});

When('I login with invalid credentials using POM', async function() {
  await attemptTologin('foobar@foobar.com', 'HelloWorld');
});

When('I login with invalid credentials', async function() {
  await attemptToinvalidlogin('foobar@foobar.com', 'HelloWorld');
});

When('I login with invalid credentials using blue-harvest', async function() {
  await type('foorbar@foobar.com');
  await click(by.css('#loginPassword'));
  await type('HelloWorld');
  await click('Login');
});

Then('I should not be able to access QuotePad using POM', async function() {
  let el = element(by.css("div[class='form-error ng-binding ng-scope']"));
  await el.getText().then(function(text) {
    expect(text).contain('Invalid username/password');
  });
});

Then('I should not be able to access QuotePad', async function() {
  let el = element(by.css("div[class='form-error ng-binding ng-scope']"));
  await el.getText().then(function(text) {
    expect(text).contain(
      'Login has failed. For additional help, please contact Customer Success at 877.755.7723 or customersuccess@limelighthealth.com'
    );
  });
});

Then('I should not be able to access QuotePad using blue-harvest', async function() {
  await see('Invalid username/password');
  await not.see('GROUPS');
  await not.see('CREATE GROUP');
  await not.see('PROPOSALS');
  await not.see('TOOLS');
});

Then('For Admin user I should be able to access create groups groups proposals and tools', async function() {
  await see('CREATE GROUP');
  await see('GROUPS');
  await see('PROPOSALS');
  await see('TOOLS');
});

Then('For Broker user I should be able to access create groups groups proposals and video tutorial', async function() {
  await see('CREATE GROUP');
  await see('GROUPS');
  await see('PROPOSALS');
  await see('VIDEO TUTORIALS');
});

Then('For Support user I should be able to access groups proposals and tools', async function() {
  await see('GROUPS');
  await see('PROPOSALS');
  await see('TOOLS');
});

Then('For Service Team Producer I should be able to access create group groups and proposals', async function() {
  await see('CREATE GROUP');
  await see('GROUPS');
  await see('PROPOSALS');
});

Then('For Bussiness Team I should be able to access groups and proposals', async function() {
  await see('GROUPS');
  await see('PROPOSALS');
});

/**
 * @deprecated Created for image comparison tool demo, do NOT use it for real scenario
 */
Then('Full login page should look like expected for the precise credentials', async function() {
  const newLocal = browser.imageComparison.checkScreen('login-full-page');
  await chai.expect(newLocal).to.eventually.below(0.01);
});

/**
 * @deprecated Created for image comparison tool demo, do NOT use it for real scenario
 */
Then("The login field should be populated with user's email - precise cut", async function() {
  const errorMessageComparison = browser.imageComparison.checkElement(login.emailField, 'login-field');
  await chai.expect(errorMessageComparison).to.eventually.equal(0.0);
});

/**
 * @deprecated Created for image comparison tool demo, do NOT use it for real scenario
 */
Then("The login field should be populated with user's email - resized cut", async function() {
  const errorMessageComparisonResized = browser.imageComparison.checkElement(login.emailField, 'login-field-resized', {
    resizeDimensions: 20
  });
  await chai.expect(errorMessageComparisonResized).to.eventually.equal(0.0);
});

/**
 * @deprecated Created for image comparison tool demo, do NOT use it for real scenario
 */
Then('Login page should look like expected for any invalid credentials', async function() {
  const comparisonResult = browser.imageComparison.checkScreen('login-shaded-page', {
    // Blockout a given region || multiple regions
    blockOut: [
      { name: 'credentials', x: 465, y: 255, width: 280, height: 140 },
      { name: 'topleftcorner', x: 0, y: 0, width: 200, height: 100 }
    ]
  });
  await chai.expect(comparisonResult).to.eventually.equal(0.0);
});

Then(/^the (?:[^"]+) logo should display on login page$/, async function() {
  const baselineFileName: string = this.testData.setImageComparisonPath(this, `login_logo`);
  const compResult: boolean = await login.imageComparison.compareElement(login.companyLogo, baselineFileName);
  this.assert.isTrue(compResult, `Element [${login.companyLogo}] doesn't match the image in [${baselineFileName}]`);
});

async function launchApplication(context) {
  const env = browser.params.env;
  const environmentUrl = environments[context.implementation][env];
  await browser.get(environmentUrl);
}

async function attemptTologin(email: string, pass: string) {
  await login.waitForElementVisibility(login.emailField);
  if (await login.unsupportedBrowserDialog.isDialogDisplayed()) {
    await login.unsupportedBrowserDialog.clickOkBtn();
  }
  await login.sendKeysWithElementFinder(login.emailField, email);
  await login.sendKeysWithElementFinder(login.passwordField, pass);
  await login.clickElementFinder(login.loginButton);
  await login.waitForRedirection(`home`);
}

async function attemptToinvalidlogin(email: string, pass: string) {
  await login.waitForElementVisibility(login.emailField);
  if (await login.unsupportedBrowserDialog.isDialogDisplayed()) {
    await login.unsupportedBrowserDialog.clickOkBtn();
  }
  await login.sendKeysWithElementFinder(login.emailField, email);
  await login.sendKeysWithElementFinder(login.passwordField, pass);
  await login.clickElementFinder(login.loginButton);
}
