import { Given, When, Then } from 'cucumber';
import { createAGroup } from './groupWorkflows';
import { createACensus } from './censusWorkflows';
import { createClasses } from './classesWorkflows';
import { createAQuoteFromGroupHome } from './publishedQuoteWorkflows';
import { GroupHomePage } from '../../pages/groupHomePage';
import { ReviewQuotesForProposalPage } from '../../pages/reviewQuotesForProposalPage';
import { SelectRecommendedQuoteDialog } from '../../pages/dialogs/selectReccomendedQuotesDialog';
import { PreviewProposalPage } from '../../pages/previewProposalPage';
import { SavedProposalsPage } from '../../pages/savedProposalsPage';
import { CensusWorkflow } from './workflowObjects/censusWorkflow';
import { ElementFinder } from 'protractor';

const groupHomePage: GroupHomePage = new GroupHomePage();
const reviewQuotesForProposalPage: ReviewQuotesForProposalPage = new ReviewQuotesForProposalPage();
const selectRecommendedQuoteDialog: SelectRecommendedQuoteDialog = new SelectRecommendedQuoteDialog();
const previewProposalPage: PreviewProposalPage = new PreviewProposalPage();
const savedProposalsPage: SavedProposalsPage = new SavedProposalsPage();

Given('I have a {string} proposal', async function(quoteLine) {
  const groupJson = await this.testData.getGroupJson(this, 'i_have_a_group');
  const censusJsonData = await this.testData.getOtherCensusDataJson(this, 'I_have_a_census');
  let censusData: CensusWorkflow = new CensusWorkflow(this, {
    template_type: censusJsonData.templateType,
    census_location: censusJsonData.fileName,
    header_row: censusJsonData.headerRow,
    column_data: censusJsonData.columnData,
    columns_to_skip: censusJsonData.columnsToSkip
  });
  const quote = await this.testData.getQuoteJson(this, 'i_have_a_published_' + quoteLine + '_quote');
  const proposal = await this.testData.getProposalJson(this, 'i_have_a_published_' + quoteLine + '_proposal');
  await createAGroup(this, groupJson);
  await createACensus(this, censusData);
  if (groupJson.classes) {
    await createClasses(groupJson);
  }
  quote.quoteType = 'Standard Modeling';
  await createAQuoteFromGroupHome(quote);
  await createAProposalFromGroupHome(proposal);
});

Given('I create a proposal with a published medical quote', async function() {
  await createAProposalFromGroupHome(null);
});

When('I requote my proposal', async function() {
  await savedProposalsPage.clickElement(savedProposalsPage.proposalActionsDropdown);
  await savedProposalsPage.clickProposalAction('Requote');
  await createAProposal(null);
});

When(/^I start creating a proposal$/, async function() {
  await startAProposal(this);
});

Then(/^none of the quotes should be selectable on proposal$/, async function() {
  const quoteCards = await reviewQuotesForProposalPage.isElementExist(
    reviewQuotesForProposalPage.selectQuoteCardLocator
  );
  this.assert.isFalse(quoteCards, `The number of quotes is not 0`);
});

export async function createAProposalFromGroupHome(proposal) {
  await groupHomePage.clickElement(groupHomePage.createProposalLocator);
  await createAProposal(proposal);
}

export async function startAProposal(worldContext) {
  await groupHomePage.clickGroupNavigation('Proposals');
  await savedProposalsPage.waitForElementPresenceLocator(savedProposalsPage.createProposalBtn);
  await savedProposalsPage.clickElement(savedProposalsPage.createProposalBtn);
}

export async function createAProposal(proposal) {
  if (proposal && proposal.quotes) {
    //Todo Tech-Debt :  logic to select multiple quotes
  }
  await reviewQuotesForProposalPage.clickElement(reviewQuotesForProposalPage.selectQuoteCardLocator);
  await reviewQuotesForProposalPage.clickElement(reviewQuotesForProposalPage.nextButton);
  await reviewQuotesForProposalPage.clickElement(reviewQuotesForProposalPage.nextOnCartButton);
  if (proposal && proposal.recommended_quote) {
    //select recommended quotes
  }
  await selectRecommendedQuoteDialog.clickElement(selectRecommendedQuoteDialog.nextButton);
  await reviewQuotesForProposalPage.clickElement(reviewQuotesForProposalPage.nextButton);
  await previewProposalPage.clickElement(previewProposalPage.saveProposalButton);
}
