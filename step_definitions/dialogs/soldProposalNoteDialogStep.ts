import { When, Then } from 'cucumber';
import { SavedProposalsPage } from '../../pages/savedProposalsPage';
import { soldProposalNoteDialog } from '../../pages/dialogs/soldProposalNoteDialogPage';
import { selectSoldProposal } from '../workflows/principalWorkflows';
import { selectQuoteToSell } from '../workflows/principalWorkflows';
import { ReviewQuotesForProposalPage } from '../../pages/reviewQuotesForProposalPage';

const savedProposalsPage: SavedProposalsPage = new SavedProposalsPage();
const soldproposalNoteDialog: soldProposalNoteDialog = new soldProposalNoteDialog();
const reviewQuotesForProposalPage: ReviewQuotesForProposalPage = new ReviewQuotesForProposalPage();

When('I mark a proposal as sold with following additional note {string}', async function(additionalNote: string) {
  await savedProposalsPage.clickElement(savedProposalsPage.proposalActionsDropdown);
  await savedProposalsPage.clickProposalAction('Select Sold Proposal');
  await soldproposalNoteDialog.fillOptionalNote(additionalNote);
});

Then(/^"(.+)", error tool-tip popsup with the message$/, async function(expectedMessage: string) {
  const actualMessage: string = await selectSoldProposal();
  this.assert.include(actualMessage, expectedMessage);
});

When(/^I select quotes to sell:$/, quoteToSell);
async function quoteToSell(dataTable: any) {
  await selectQuoteToSell(this, dataTable);
  await reviewQuotesForProposalPage.clickElement(reviewQuotesForProposalPage.nextButtonLocator);
}

Then('the proposal will be successfully created in Sold status', async function() {
  await reviewQuotesForProposalPage.clickElement(reviewQuotesForProposalPage.saveButtonLocator);
});

Then('I will be navigated to the proposals view', async function() {
  await savedProposalsPage.waitForElementPresenceLocator(savedProposalsPage.createProposalBtn);
  const isActuallyVisible: boolean = await savedProposalsPage.isVisible(savedProposalsPage.createProposalBtn);
  this.assert.isTrue(isActuallyVisible);
});

Then(/^"(.+)", error dialog with the message pops up$/, async function(expectedMessage: string) {
  const actualErrorMessage = await reviewQuotesForProposalPage.getElementText(
    reviewQuotesForProposalPage.errorDialogLocator
  );
  this.assert.include(actualErrorMessage, expectedMessage);
});
