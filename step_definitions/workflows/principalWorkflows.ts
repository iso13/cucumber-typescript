import { When, Given, Then } from 'cucumber';
import { uploadCensusFile, closeCensusUploadErrorsDialog, mapOtherCensus, getCensusData } from '../uploadCensusSteps';
import { createAGroup } from './groupWorkflows';
import { createCustomPlans } from './planDesignWorkflows';
import { GroupHomePage } from '../../pages/groupHomePage';
import { saveClasses } from '../classesSteps';
import { saveCensusAfterUploading } from '../censusSteps';
import { startGeneratingQuotes } from '../planDesignerSteps';
import { verifyQuoteCreated } from '../cards/quoteCardSteps';
import { ReviewQuotesForProposalPage } from '../../pages/reviewQuotesForProposalPage';
import { PreviewProposalPage } from '../../pages/previewProposalPage';
import { selectPlanToQuote, clickContinueBtn } from '../selectPlansSteps';
import { CensusWorkflow } from './workflowObjects/censusWorkflow';
import { browser, ElementFinder } from 'protractor';
import { SavedProposalsPage } from '../../pages/savedProposalsPage';
import { Navigation } from '../../pages/navigation';
import { NavigateToOption } from '../navigationSteps';
import { RFPSuccessfullyCreatedDialog } from '../../pages/dialogs/rfpSuccessfullyCreatedDialog';
import { slow } from 'blue-harvest';

const groupHomePage: GroupHomePage = new GroupHomePage();
const reviewQuotesForProposalPage: ReviewQuotesForProposalPage = new ReviewQuotesForProposalPage();
const previewProposalPage: PreviewProposalPage = new PreviewProposalPage();
const savedProposalsPage: SavedProposalsPage = new SavedProposalsPage();
const navigation: Navigation = new Navigation();
const rfpSuccessfullyCreatedDialog: RFPSuccessfullyCreatedDialog = new RFPSuccessfullyCreatedDialog();

Given(/^I have a group with census$/, async function() {
  await createPrincipalGroup(this);
  await uploadPrincipalValidCensusFile(this);
});

Given(/^I have a group with census created with$/, async function(table: any) {
  const groupDataPath: string = table.hashes()[0]['group_data'];
  const groupJson = await this.testData.getGroupJson(this, groupDataPath);
  await createAGroup(this, groupJson);

  const censusDataPath: string = table.hashes()[0]['census_data'];
  const censusLocation: string = await this.testData.getCensusPath(this, censusDataPath);
  await uploadPrincipalCensusFile(censusLocation);
});

When(/^I upload Principal census file$/, async function() {
  await uploadPrincipalValidCensusFile(this);
});

When(/^I upload an Other Census on Principal using "(.+)"$/, async function(jsonFile: any) {
  let censusData: CensusWorkflow = await getCensusData(this, jsonFile);
  await uploadCensusFile(censusData.templateType, censusData.censusLocation);
  await mapOtherCensus(censusData);
  await saveClasses();
  await saveCensusAfterUploading();
});

When(/^I have a custom plan created$/, async function(dataTable: any) {
  await createPrincipalGroup(this);
  await uploadPrincipalValidCensusFile(this);
  await createCustomPlans(this, dataTable);
});

When(/^I create (?:new|few) custom plans?:$/, async function(dataTable: any) {
  await createCustomPlans(this, dataTable);
});

When(/^I create (?:a|new) quotes? based on the custom plans?$/, async function() {
  await createCustomQuoteForAPlan(this);
});

When(/^I have (?:a|few) quotes? created based on plans?$/, async function(dataTable: any) {
  await createPrincipalGroup(this);
  await uploadPrincipalValidCensusFile(this);
  await createCustomPlans(this, dataTable);
  await createCustomQuoteForAPlan(this);
});

When(/^I create a proposal for the quote$/, async function() {
  await createAProposal(this);
});

When(/^I start creating a proposal for the quote$/, async function() {
  await startAProposal(this);
});

Then(/^I should not be allow to save the proposal$/, async function() {
  await previewProposalPage.clickElement(previewProposalPage.savePrincipalProposal);
  await slow.see('Unable to Generate Proposal');
});

When(/^I have a proposal$/, haveAProposal);
async function haveAProposal(dataTable: any) {
  await createPrincipalGroup(this);
  await uploadPrincipalValidCensusFile(this);
  await createCustomPlans(this, dataTable);
  await createCustomQuoteForAPlan(this);
  await verifyQuoteCreated(this);
  await createAProposal(this);
}

When(/^I create a proposal based on plan:$/, async function haveAProposalforagroup(dataTable: any) {
  await createCustomPlans(this, dataTable);
  await createCustomQuoteForAPlan(this);
  await verifyQuoteCreated(this);
  await createAProposal(this);
});

When(/^I create an rfp$/, async function() {
  await createAnRFP();
});

When(/^I create few rfps$/, async function(table: any) {
  for (let entry of table.hashes()) {
    const groupDataPath: string = entry['group_data'];
    const groupJson = await this.testData.getGroupJson(this, groupDataPath);
    await createAGroup(this, groupJson);
    const censusDataPath: string = entry['census_data'];
    const censusLocation: string = await this.testData.getCensusPath(this, censusDataPath);
    await uploadPrincipalCensusFile(censusLocation);
    await createAnRFP();
    await NavigateToOption('home');
  }
});

async function createPrincipalGroup(context) {
  const groupJson = await context.testData.getGroupJson(context, 'i_have_a_group');
  await createAGroup(context, groupJson);
}

export async function uploadPrincipalValidCensusFile(context) {
  const censusLocation: string = await context.testData.getCensusPath(context, 'Template_10EEs_1cl.xlsx');
  await uploadPrincipalCensusFile(censusLocation);
}

async function uploadPrincipalCensusFile(fileLocation: string) {
  await uploadCensusFile('Principal Census Template', fileLocation);
  await closeCensusUploadErrorsDialog();
  await saveClasses();
  await saveCensusAfterUploading();
}

export async function createCustomQuoteForAPlan(worldContext) {
  await browser.waitForAngularEnabled(false);
  await startGeneratingQuotes();
  await browser.waitForAngularEnabled(true);
  for (let plan of worldContext.customPlans.values()) {
    await selectPlanToQuote(plan.plan_name);
  }
  await clickContinueBtn();
}

export async function selectSoldProposal(): Promise<string> {
  const allQuoteCards: ElementFinder[] = await reviewQuotesForProposalPage.getElements(
    reviewQuotesForProposalPage.selectQuoteCardLocator
  );
  for (const elem of allQuoteCards) {
    await reviewQuotesForProposalPage.clickElements(elem);
  }
  await reviewQuotesForProposalPage.hoverOverElement(reviewQuotesForProposalPage.unSoldQuoteCardLocator);
  const verifyErrorMessage = await reviewQuotesForProposalPage.getElementText(
    reviewQuotesForProposalPage.tooltipLocator
  );
  return verifyErrorMessage;
}

export async function selectQuoteToSell(worldContext, dataTable: any) {
  const allQuoteCards: ElementFinder[] = await reviewQuotesForProposalPage.getElements(
    reviewQuotesForProposalPage.selectQuoteCardLocator
  );
  for (const elem of allQuoteCards) {
    await reviewQuotesForProposalPage.clickElements(elem);
  }
}

export async function createAProposal(worldContext) {
  await groupHomePage.clickElement(groupHomePage.createProposalLocator);
  const allQuoteCards: ElementFinder[] = await reviewQuotesForProposalPage.getElements(
    reviewQuotesForProposalPage.selectQuoteCardLocator
  );
  for (const elem of allQuoteCards) {
    await reviewQuotesForProposalPage.clickElements(elem);
  }
  await previewProposalPage.clickElement(previewProposalPage.savePrincipalProposal);
  await previewProposalPage.clickElement(previewProposalPage.savePrincipalProposal);
  await savedProposalsPage.closeLoadingDialog();
}

export async function startAProposal(worldContext) {
  await groupHomePage.clickElement(groupHomePage.createProposalLocator);
  const allQuoteCards: ElementFinder[] = await reviewQuotesForProposalPage.getElements(
    reviewQuotesForProposalPage.selectQuoteCardLocator
  );
  for (const elem of allQuoteCards) {
    await reviewQuotesForProposalPage.clickElements(elem);
  }
  await previewProposalPage.clickElement(previewProposalPage.savePrincipalProposal);
}

export async function createAnRFP() {
  await navigation.groupNavigationSelectPages('Proposals');
  await savedProposalsPage.clickCreateRFP();
  await rfpSuccessfullyCreatedDialog.clickElement(rfpSuccessfullyCreatedDialog.okBtn);
}
