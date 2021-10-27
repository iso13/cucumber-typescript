import { ModelingContributionPage } from '../../pages/modeling/modelingContributionPage';
import { SaveQuoteDialog } from '../../pages/dialogs/saveQuoteDialog';
import { AutoMappingPlanSelectionDialog } from '../../pages/dialogs/autoMappingPlanSelectionDialog';

const modelingContributionPageObject: ModelingContributionPage = new ModelingContributionPage();
const saveQuoteDialog: SaveQuoteDialog = new SaveQuoteDialog();
const autoMappingPlanSelectionDialog: AutoMappingPlanSelectionDialog = new AutoMappingPlanSelectionDialog();

export async function modalAutomappingOK() {
  await modelingContributionPageObject.clickElement(autoMappingPlanSelectionDialog.okButton);
}

export async function saveQuote(quote) {
  await modelingContributionPageObject.clickElement(modelingContributionPageObject.saveQuoteButton);
  await saveQuoteDialog.sendKeys(saveQuoteDialog.quoteNameInputLocator, quote.name);
  await saveQuoteDialog.clickElement(saveQuoteDialog.saveQuoteButton);
}
