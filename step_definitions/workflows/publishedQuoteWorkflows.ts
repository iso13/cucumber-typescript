import { Given, When } from 'cucumber';
import { createAGroup } from './groupWorkflows';
import { createACensus } from './censusWorkflows';
import { createClasses } from './classesWorkflows';
import { CarriersAndPackagesPage } from '../../pages/carriersAndPackagesPage';
import { BenefitFilterPage } from '../../pages/benefitFilterPage';
import { addPlansToQuote } from '../planListingSteps';
import { selectCarriers } from '../carriersAndPackagesSteps';
import { PlanListingPage } from '../../pages/planListingPage';
import { saveQuote } from '../modeling/modelingSteps';
import { GroupHomePage } from '../../pages/groupHomePage';
import { QuotesHomePage } from '../../pages/quotesHomePage';
import { SelectProductToQuoteDialog } from '../../pages/dialogs/selectProductToQuoteDialog';
import { SelectQuoteTypeDialog } from '../../pages/dialogs/selectQuoteTypeDialog';
import { CensusWorkflow } from './workflowObjects/censusWorkflow';
import { SelectExchangeToQuoteDialog } from '../../pages/dialogs/selectExchangeToQuoteDialog';
import { AdditionalPlanNeededDialog } from '../../pages/dialogs/additionalPlanNeededDialog';
import { click, slow } from 'blue-harvest';

const carriersAndPackagesPageObject: CarriersAndPackagesPage = new CarriersAndPackagesPage();
const benefitFilterPageObject: BenefitFilterPage = new BenefitFilterPage();
const planListingPageObject: PlanListingPage = new PlanListingPage();
const groupHomePage: GroupHomePage = new GroupHomePage();
const quotesHomePage: QuotesHomePage = new QuotesHomePage();
const selectProductToQuoteDialog: SelectProductToQuoteDialog = new SelectProductToQuoteDialog();
const selectQuoteTypeDialog: SelectQuoteTypeDialog = new SelectQuoteTypeDialog();
const selectExchangeTypeDialog: SelectExchangeToQuoteDialog = new SelectExchangeToQuoteDialog();
const additionalPlanNeededDialog: AdditionalPlanNeededDialog = new AdditionalPlanNeededDialog();

Given('I have a published {string} quote', async function(quoteLine: string) {
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
  await createAGroup(this, groupJson);
  await createACensus(this, censusData);
  if (groupJson.classes) {
    await createClasses(groupJson);
  }
  quote.quoteType = 'Standard Modeling';
  await createAQuoteFromGroupHome(quote);
});

When('I create a published standard modeling quote with {string}', async function(quoteFileName: string) {
  let quote = await this.testData.getQuoteJson(this, quoteFileName);
  quote.quoteType = 'Standard Modeling';
  await createAQuoteFromGroupHome(quote);
});

When('I create a published market snapshot quote with {string}', async function(quoteFileName: string) {
  let quote = await this.testData.getQuoteJson(this, quoteFileName);
  quote.quoteType = 'Market Snapshot';
  await createAQuoteFromGroupHome(quote);
});

When('I create a published {string} Market Snapshot quote with {string}', async function(
  quoteReport: string,
  quoteFileName: string
) {
  let quote = await this.testData.getQuoteJson(this, quoteFileName);
  quote.quoteType = 'Market Snapshot';
  quote.quoteReport = quoteReport;
  if (this.implementation === 'trinet') {
    await createTrinetQuoteFromGroupHome(quote);
  } else {
    await createAQuoteFromGroupHome(quote);
  }
});

When('I create a published {string} Market Snapshot quote with {string} from Quotes Home', async function(
  quoteReport: string,
  quoteFileName: string
) {
  let quote = await this.testData.getQuoteJson(this, quoteFileName);
  quote.quoteType = 'Market Snapshot';
  quote.quoteReport = quoteReport;
  if (this.implementation === 'trinet') {
    await createTrinetQuoteFromQuotesHome(quote);
  } else {
  }
});

When('I create a published {string} standard modeling quote with {string}', async function(
  quoteReport: string,
  quoteFileName: string
) {
  let quote = await this.testData.getQuoteJson(this, quoteFileName);
  quote.quoteType = 'Standard Modeling';
  quote.quoteReport = quoteReport;
  if (this.implementation === 'trinet') {
    await createTrinetQuoteFromGroupHome(quote);
  } else {
    await createAQuoteFromGroupHome(quote);
  }
});

When('I create a published {string} standard modeling quote with {string} from Quotes Home', async function(
  quoteReport: string,
  quoteFileName: string
) {
  let quote = await this.testData.getQuoteJson(this, quoteFileName);
  quote.quoteType = 'Standard Modeling';
  quote.quoteReport = quoteReport;
  if (this.implementation === 'trinet') {
    await createTrinetQuoteFromQuotesHome(quote);
  } else {
  }
});

export async function createAPublishedQuote(quote) {
  if (quote.quoteType) {
  }
  await selectCarriers(quote.carriers);
  await carriersAndPackagesPageObject.clickElement(carriersAndPackagesPageObject.nextButton);
  if (quote.package) {
    //await benefitFilterPageObject.set package
  }
  if (quote.benefitFilters) {
    //await set benefit filters
    await benefitFilterPageObject.clickElement(benefitFilterPageObject.nextButton);
  }
  if (quote.plans) {
    await addPlansToQuote(quote.plans);
    await planListingPageObject.clickElement(planListingPageObject.nextButton);
  }
  await saveQuote(quote);
}

/**
 *
 * @param quote Specific to Trinet
 * Steps Related to Published Quote Creation
 */
export async function createAPublishedTrinetQuote(quote) {
  if (quote.package) {
    await carriersAndPackagesPageObject.clickPackageCard(quote.package);
    await carriersAndPackagesPageObject.clickElement(carriersAndPackagesPageObject.nextButton);
  }
  if (quote.quoteType === 'Standard Modeling') {
    if (quote.benefitFilters) {
      //Logic to filter benefits
    }
    if (!quote.isBenefitFiltersSkipped) {
      await benefitFilterPageObject.waitForElementToBeClickableLong(benefitFilterPageObject.nextButton);
      await benefitFilterPageObject.clickElement(benefitFilterPageObject.nextButton);
    }
    if (quote.plans) {
      await addPlansToQuote(quote.plans);
    } else {
      await slow.see('Add All Plans');
      await planListingPageObject.clickElement(planListingPageObject.addAllPlanButton);
    }
    await planListingPageObject.waitForElementPresenceLocator(planListingPageObject.nextButton);
    await planListingPageObject.clickElement(planListingPageObject.nextButton);
  }
  await carriersAndPackagesPageObject.waitForElementNotPresentLocator(benefitFilterPageObject.loadingDialog);
  await saveQuote(quote);
}

export async function createAQuoteFromGroupHome(quote) {
  await slow.see('Recent Quotes');
  await groupHomePage.clickElement(groupHomePage.newQuoteBtnLocator);
  await selectProductToQuoteDialog.clickProductToQuote(quote.productLine);
  await selectProductToQuoteDialog.clickElement(selectProductToQuoteDialog.nextButton);
  await selectQuoteTypeDialog.clickQuoteType(quote.quoteType);
  await selectQuoteTypeDialog.clickElement(selectQuoteTypeDialog.nextButton);
  await createAPublishedQuote(quote);
}

export async function createTrinetQuoteFromGroupHome(quote) {
  if (quote.quoteReport === 'BCR') {
    await groupHomePage.closeWalkMe();
    await groupHomePage.clickElement(groupHomePage.bcrQuoteBtnLocator);
  } else {
    await groupHomePage.closeWalkMe();
    await groupHomePage.clickElement(groupHomePage.newQuoteBtnLocator);
  }
  await selectProductToQuoteDialog.clickProductToQuote(quote.productLine);
  await selectProductToQuoteDialog.clickElement(selectProductToQuoteDialog.nextButton);
  await selectExchangeTypeDialog.clickExchangeToQuote(quote.exchange);
  await selectExchangeTypeDialog.clickElement(selectExchangeTypeDialog.nextButtonModal);
  await selectQuoteTypeDialog.clickQuoteType(quote.quoteType);
  await selectQuoteTypeDialog.clickElement(selectQuoteTypeDialog.nextButton);
  await benefitFilterPageObject.waitForElementNotPresentLocator(benefitFilterPageObject.loadingDialog);
  await createAPublishedTrinetQuote(quote);
}

export async function createTrinetQuoteFromQuotesHome(quote) {
  if (quote.quoteReport === 'BCR') {
    await quotesHomePage.clickElement(quotesHomePage.bcrQuoteBtnLocator);
  } else {
    await quotesHomePage.clickElement(quotesHomePage.pcrQuoteBtnLocator);
  }
  await selectProductToQuoteDialog.clickProductToQuote(quote.productLine);
  await selectProductToQuoteDialog.clickElement(selectProductToQuoteDialog.nextButton);
  await selectExchangeTypeDialog.clickExchangeToQuote(quote.exchange);
  await selectExchangeTypeDialog.clickElement(selectExchangeTypeDialog.nextButtonModal);
  await selectQuoteTypeDialog.clickQuoteType(quote.quoteType);
  await selectQuoteTypeDialog.clickElement(selectQuoteTypeDialog.nextButton);
  await createAPublishedTrinetQuote(quote);
}
