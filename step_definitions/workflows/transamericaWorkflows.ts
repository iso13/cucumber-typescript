import { Given, Then, When } from 'cucumber';
import { HomePage } from '../../pages/homePage';
import { GroupProfilePage } from '../../pages/groupProfilePage';
import { createAGroupWithOwner } from './groupWorkflows';
import { selectBroker } from '../brokerSelectionSteps';
import { fillGroupData } from '../groupProfileSteps';
import { slow } from 'blue-harvest';
import { UploadCensusPage } from '../../pages/uploadCensusPage';
import { createCustomPlans } from './planDesignWorkflows';
import {
  startGeneratingQuotes,
  CustomPlansData,
  assertViewRatesBtnIsEnabled,
  assertViewRatesBtnIsDisabled
} from '../planDesignerSteps';
import { selectPlanToQuote, clickContinueBtn } from '../selectPlansSteps';
import { ViewRatesDialog } from '../../pages/dialogs/viewRatesDialog';
import { browser, ElementFinder } from 'protractor';
import { SideBySidePage } from '../../pages/sideBySidePage';
import { SaveQuoteDialog } from '../../pages/dialogs/saveQuoteDialog';

const groupProfilePage: GroupProfilePage = new GroupProfilePage();
const uploadCensusPage: UploadCensusPage = new UploadCensusPage();
const homePage: HomePage = new HomePage();
const viewRatesDialog: ViewRatesDialog = new ViewRatesDialog();
const sideBySidePage: SideBySidePage = new SideBySidePage();
const saveQuoteDialog: SaveQuoteDialog = new SaveQuoteDialog();

Given('I fill out group profile fields with an agent', async function() {
  const groupJson = await this.testData.getGroupJson(this, 'i_have_a_group_with_agent');
  await fillGroupWithAgent(this, groupJson);
});

Given('I have a group without census and owner {string}', async function(ownerName: string) {
  const implementation: string = this.testData.getCurrentImplementation(this);
  const groupJson = await this.testData.getGroupJson(this, 'i_have_a_group');
  await slow.see('CREATE GROUP');
  await createAGroupWithOwner(this, groupJson, ownerName);
});

When(/^I create (?:a|new) transamerica quotes? based on the custom plans?$/, async function() {
  await browser.waitForAngularEnabled(false);
  await startGeneratingQuotes();
  await browser.waitForAngularEnabled(true);
  for (let plan of this.customPlans.values()) {
    await selectPlanToQuote(plan.plan_name);
  }
  await clickContinueBtn();
  await nameQuoteAndSaveQuote();
});

Then('I view rates', async function() {
  await verifyRates(this);
});

Then(/^I verify view rates is (enabled|disabled)$/, async function(option) {
  if (option == 'enabled') {
    await assertViewRatesBtnIsEnabled(this);
  } else {
    await assertViewRatesBtnIsDisabled(this);
  }
});

export async function fillGroupWithAgent(worldContext, group) {
  await fillGroupData(worldContext, group);
  await groupProfilePage.selectAgent();
  await groupProfilePage.setPresenterAddress(group.presenterAddress);
}

export async function nameQuoteAndSaveQuote() {
  await sideBySidePage.clickElement(sideBySidePage.actionSaveButton);
  await saveQuoteDialog.clickElement(saveQuoteDialog.saveQuoteButton);
}

export async function verifyRates(worldContext) {
  await viewRatesDialog.openRatesModal();
  worldContext.assert.isTrue(
    await viewRatesDialog.isVisible(viewRatesDialog.viewRatesModal),
    `View rates modal is displayed`
  );
  await viewRatesDialog.closeRatesModal();
  worldContext.assert.isFalse(
    await viewRatesDialog.isVisible(viewRatesDialog.viewRatesModal),
    `View rates modal is displayed`
  );
}

async function startCreationOfQuote(customPlans) {
  await browser.waitForAngularEnabled(false);
  await startGeneratingQuotes();
  await browser.waitForAngularEnabled(true);
  for (const plan of customPlans.values()) {
    await selectPlanToQuote(plan.plan_name);
  }
  await clickContinueBtn();
}
