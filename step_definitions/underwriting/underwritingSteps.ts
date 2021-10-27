import { Then, When } from 'cucumber';
import { below, click, leftOf, not, see, slow } from 'blue-harvest';
import { UnderwritingPage } from '../../pages/underwritingPage';
import { groupNavigationSelectPages } from '../navigationSteps';
import { AllQuotesPage } from '../../pages/allQuotesPage';
import { SavedProposalsPage } from '../../pages/savedProposalsPage';
import { CommentsDialog, ICommentsData } from '../../pages/dialogs/commentsDialog';
import { ReviewQuotesForProposalPage } from '../../pages/reviewQuotesForProposalPage';
import { DeclineToQuoteDialog } from '../../pages/dialogs/declineToQuoteDialog';

const underwritingPage: UnderwritingPage = new UnderwritingPage();
const commentsDialog: CommentsDialog = new CommentsDialog();
const allQuotePage: AllQuotesPage = new AllQuotesPage();
const reviwQuoteForProposalPage: ReviewQuotesForProposalPage = new ReviewQuotesForProposalPage();
const declineToQuoteDialog: DeclineToQuoteDialog = new DeclineToQuoteDialog();
const proposalsPage: SavedProposalsPage = new SavedProposalsPage();

Then('I should be able to see basic group profile info in the underwriting tab', async function() {
  await groupNavigationSelectPages('underwriting');
  await slow.see('underwriting');
  const stateCode: string = await underwritingPage.getElementText(underwritingPage.stateField);
  const sicCode: string = await underwritingPage.getElementText(underwritingPage.sicField);
  const numberOfEEs: string = await underwritingPage.getElementText(underwritingPage.numberOfEligibleEmployeesField);
  this.assert.strictEqual(sicCode, this.groupJsonData.sic, 'profile does not have the expected sic code');
  this.assert.strictEqual(stateCode, this.stateCode, 'profile does not have the expected state code ');
  this.assert.strictEqual(
    numberOfEEs,
    this.groupJsonData.number_of_eligible_ees,
    'profile does not have the expected number of elegible employees'
  );
});

Then('I should be able to duplicate the quote in underwriting tab', async function() {
  await groupNavigationSelectPages('underwriting');
  await slow.see('underwriting');
  await underwritingPage.duplicateQuote();
  this.assert.strictEqual(this.customPlan.plan_name, await underwritingPage.getDuplicateQuoteName());
});

When(/^I decline (?:a|few|all) product lines?:$/, async function(dataTable: any) {
  const dtqProductList = await this.testData.getUnderwritingJson(this, dataTable.raw()[0]);
  await groupNavigationSelectPages('underwriting');
  for (const dtqDecision of dtqProductList) {
    await underwritingPage.clickElement(underwritingPage.dtqBtn);
    for (const productLine of dtqDecision.productLines) {
      await declineToQuoteDialog.selectProductToDecline(productLine);
    }
    await declineToQuoteDialog.submitDeclineToCodeReason(dtqDecision.reason, dtqDecision.note);
  }
  this.dtqJsonData = dtqProductList;
});

Then(/^I should see comments? and reason codes? for declined product lines?$/, async function() {
  const dtqProductList = this.dtqJsonData;
  await underwritingPage.clickCommentsButton();
  const actualCommentsData: Array<ICommentsData> = await commentsDialog.getAllCommentsData();
  const expectedCommentsData: Array<ICommentsData> = new Array();
  for (const commentData of dtqProductList) {
    expectedCommentsData.push({
      title: `Decline to Quote: ${commentData.note}`,
      declinedProductLines: `Lines: ${
        commentData.allProducts ? commentData.allProducts.join(', ') : commentData.productLines.join(', ')
      }`,
      reasonCode: `Codes: ${commentData.code}`
    });
  }
  this.expect(actualCommentsData).to.deep.equalInAnyOrder(expectedCommentsData);
});

Then(/^the quote tile should not be actionable$/, async function() {
  this.assert.isFalse(
    await underwritingPage.isQuoteTileActionable(),
    'Quote tile is actionable when the product is declined'
  );
});

Then(/^decline to quote should be disabled$/, async function() {
  await groupNavigationSelectPages('underwriting');
  this.assert.isTrue(await underwritingPage.isQuoteTileDeclined(), 'Error, quote tile is not declined');
  this.assert.isFalse(await underwritingPage.isQuoteTileActionable(), 'Error, quote tile is actionable');
});

Then(/^only the following quotes should be able to be added to the proposal$/, async function(dataTable) {
  const quoteNames = await this.testData.convertStringToArray(String(dataTable.raw()[0]));
  const actualQuoteNames = await reviwQuoteForProposalPage.getQuoteCardNames();
  this.expect(actualQuoteNames).to.deep.equalInAnyOrder(quoteNames);
});

Then(/^non declined product lines should be able to be declined$/, async function() {
  const dtqProductList = this.dtqJsonData;
  await underwritingPage.clickElement(underwritingPage.dtqBtn);
  for (const dtqDecision of dtqProductList) {
    for (const productLine of dtqDecision.nonDeclinedProducts) {
      this.assert.isFalse(await declineToQuoteDialog.isProductLineDeclined(productLine));
    }
  }
});

Then(/^declined product lines should not be able to be declined$/, async function() {
  const dtqProductList = this.dtqJsonData;
  await underwritingPage.clickElement(underwritingPage.dtqBtn);
  for (const dtqDecision of dtqProductList) {
    for (const productLine of dtqDecision.productLines) {
      this.assert.isTrue(await declineToQuoteDialog.isProductLineDeclined(productLine));
    }
  }
});

Then(/^I should not be able to create a proposal$/, async function() {
  await groupNavigationSelectPages('proposals');
  this.assert.isTrue(
    await proposalsPage.isCreateProposalDisabled(),
    'Create A Proposal button at the proposals page should be disabled'
  );
  await groupNavigationSelectPages('quotes');
  this.assert.isTrue(
    await allQuotePage.isCreateProposalDisabled(),
    'Create Proposal button at the quotes page should be disabled'
  );
  await groupNavigationSelectPages('underwriting');
  this.assert.isTrue(
    await underwritingPage.isCreateProposalDisabled(),
    'Create Proposal button at the underwriting page should be disabled'
  );
});
