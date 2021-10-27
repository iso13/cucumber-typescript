import { When, Then } from 'cucumber';
import { element, ElementFinder, Locator, browser, by } from 'protractor';
import { BaseProposalPage } from '../../pages/proposalPdf/baseProposalPage';
import * as chai from 'chai';
import * as chaiAsPromised from 'chai-as-promised';

chai.use(chaiAsPromised);

const baseProposalPage: BaseProposalPage = new BaseProposalPage();

Then('Benefit values should display the same values as those on the {string}', async function(data: string) {
  let jsonValue = await this.json.getJsonFromFile('proposalpdf' + '/' + data, 'core');
  let locatorsAndValues: Map<string, string> = new Map<string, string>();
  locatorsAndValues = await baseProposalPage.getProposalLocatorsAndValues(locatorsAndValues, jsonValue);
  await browser.waitForAngularEnabled(false);
  await assertProposalValues(this, locatorsAndValues);
});

export async function assertProposalValues(context, locatorsAndValues: Map<string, string>) {
  for (let key of locatorsAndValues.keys()) {
    const locator: Locator = by.id(key);
    const locatorElement: ElementFinder = await element(locator);
    await context.assert.strictEqual(
      await locatorElement.getText(),
      locatorsAndValues.get(key),
      'Invalid proposal value for ' + key
    );
  }
}

/**
 * @deprecated Created for image comparison tool demo, do NOT use it for real scenario
 */
When('I open to view previously saved proposal {string} in HTML', async function(proposalId: string) {
  browser.get('https://qpe-uat.limelighthealth.com/api/proposal/' + proposalId + '/preview?html=true');
  await function() {};
});

/**
 * @deprecated Created for image comparison tool demo, do NOT use it for real scenario
 */
Then('All the proposal data should look like expected', async function() {
  const proposalFullComp = browser.imageComparison.checkFullPageScreen('proposal-full-page');
  await chai.expect(proposalFullComp).to.eventually.below(0.02);
});
