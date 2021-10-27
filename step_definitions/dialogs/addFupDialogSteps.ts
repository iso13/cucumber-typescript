import { When, Then } from 'cucumber';
import { AddFUPDialog } from '../../pages/dialogs/addFupDialog';
import { SavedFupPlansListDialog } from '../../pages/dialogs/savedFupPlansListDialog';
import { PlanDesignerPage } from '../../pages/planDesignerPage';
import { element, ElementFinder, browser } from 'protractor';
import { async } from 'q';
import { assertProposalValues } from '../proposalPdf/proposalPdfSteps';

const addFupDialog: AddFUPDialog = new AddFUPDialog();
const planDesignerPage: PlanDesignerPage = new PlanDesignerPage();
const savedFupPlansListDialog: SavedFupPlansListDialog = new SavedFupPlansListDialog();

When('I add FUP plan for', async function(productNames) {
  for (let product of productNames.raw()) {
    let quote = await this.testData.getQuoteJson(this, product);
    for (let plan of quote.plans) {
      await addAndSaveFupPlan(quote, plan);
    }
  }
});

Then('FUP should added successfully', async function(productNames) {
  for (let product of productNames.raw()) {
    let quote = await this.testData.getQuoteJson(this, product);
    await planDesignerPage.clickImportFupPlanBtnForProduct(quote.productLine);
    await savedFupPlansListDialog.waitForElementPresenceLocator(savedFupPlansListDialog.allSavedFupPlansLocator);

    for (let plan of quote.plans) {
      this.assert.strictEqual(
        await element(savedFupPlansListDialog.savedFUPPlanLocator).getText(),
        plan.name,
        'Saved FUP plan not found'
      );
    }
    await savedFupPlansListDialog.clickElement(savedFupPlansListDialog.savedFUPDialogCancelBtnLocator);
  }
});

export async function addAndSaveFupPlan(quote, plan) {
  await planDesignerPage.clickAddPlanForProduct(quote.productLine);
  await planDesignerPage.clickElement(planDesignerPage.addFUPBtnLocator);
  await addFupDialog.pause(1000);
  await addFupDialog.sendKeys(addFupDialog.planNameInputLocator, plan.name);
  await addFupDialog.clickElement(addFupDialog.addFUPButtonLocator);
  await addFupDialog.isVisible(addFupDialog.okBtnOnFupPopupLocator);
  await addFupDialog.clickElement(addFupDialog.okBtnOnFupPopupLocator);
  await addFupDialog.waitForElementNotPresentLocator(addFupDialog.okBtnOnFupPopupLocator);
  await addFupDialog.pause(8000);
}
