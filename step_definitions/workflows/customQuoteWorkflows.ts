import { Given, When, Then } from 'cucumber';
import { createAGroup } from './groupWorkflows';
import { createACensus } from './censusWorkflows';
import { createClasses } from './classesWorkflows';
import { configurePlan, savePlan } from '../planDesignerSteps';
import { addPlansToCustomQuote } from '../selectPlansSteps';
import { HomePage } from '../../pages/homePage';
import { PlanDesignerPage } from '../../pages/planDesignerPage';
import { CensusWorkflow } from './workflowObjects/censusWorkflow';
import { AllQuotesPage } from '../../pages/allQuotesPage';
import { BenefitTypeDialog } from '../../pages/dialogs/benefitTypeDialog';
import { QuoteTypeDialog } from '../../pages/dialogs/quoteTypeDialog';
import { BenefitFilterPage } from '../../pages/benefitFilterPage';
import { ModelingContributionPage } from '../../pages/modeling/modelingContributionPage';
import { SaveQuoteDialog } from '../../pages/dialogs/saveQuoteDialog';
import { ExchangeTypeModalDialog } from '../../pages/dialogs/exchangeTypeModalDialog';
import { browser, element } from 'protractor';
import { QuoteWorkflow } from './workflowObjects/quoteWorkflow';
import { RecentQuotePage } from '../../pages/recentQuotePage';
import * as chai from 'chai';
import { click, slow } from 'blue-harvest';

const homePage: HomePage = new HomePage();
const planDesignerPage: PlanDesignerPage = new PlanDesignerPage();
const allQuotesPage: AllQuotesPage = new AllQuotesPage();
const benefitTypeDialog: BenefitTypeDialog = new BenefitTypeDialog();
const exchangeTypeModalDialog: ExchangeTypeModalDialog = new ExchangeTypeModalDialog();
const quoteTypeDialog: QuoteTypeDialog = new QuoteTypeDialog();
const benefitFilterPage: BenefitFilterPage = new BenefitFilterPage();
const modelingContributionPage: ModelingContributionPage = new ModelingContributionPage();
const saveQuoteDialog: SaveQuoteDialog = new SaveQuoteDialog();
const recentQuotePage: RecentQuotePage = new RecentQuotePage();

Given('I have a custom {string} quote', async function(quoteLine: string) {
  let groupJson = await this.testData.getGroupJson(this, 'i_have_a_group');
  let quote = await this.testData.getQuoteJson(this, 'i_have_a_custom_' + quoteLine + '_quote');
  let censusData: CensusWorkflow = new CensusWorkflow(this, {
    template_type: 'other census',
    census_location: 'i_have_a_census.xlsx',
    header_row: 2
  });
  await createAGroup(this, groupJson);
  await createACensus(this, censusData);
  if (groupJson.classes) {
    await createClasses(groupJson);
  }
  await createACustomPlan(quote.plans);
  await createACustomQuote(quote);
});

When('I create a custom medical quote with {string}', async function(quoteFileName: string) {
  let quote = await this.testData.getQuoteJson(this, quoteFileName);
  await planDesignerPage.clickGroupNavigation('plans');
  await createACustomQuote(quote);
  await saveQuote(quote);
});

When('I create a quote with the following data files', async function(this, dataTable) {
  let rows = await dataTable.hashes();
  await homePage.closeWalkMe();
  for (let row of rows) {
    let quote: QuoteWorkflow = await this.testData.getQuoteJson(this, row.dataFileName);
    await planDesignerPage.clickGroupNavigation('Quotes');
    await selectComparisonType(quote.quoteType);
    await setBenefitType(quote.benefitType);
    await enableFilters(quote.setFilters);
    await benefitTypeDialog.clickElement(benefitTypeDialog.nextButton);
    await setExchange(quote.exchange);
    await exchangeTypeModalDialog.clickElement(exchangeTypeModalDialog.nextButton);
    await selectQuoteType(quote.benefitType);
    await setFilters(quote.setFilters);
    await setContributionStrategy(quote);
    await saveQuote(quote);
  }
});

Then('A Life Market Snapshot quote card should be successfully displayed', async function() {
  for (let quoteName of saveQuoteDialog.quoteNames) {
    await chai.assert.isOk(
      await element("//span[contains(text(),'" + quoteName.toLowerCase() + "')]"),
      'Quote Card with name' + quoteName + ' was not found, please verify...'
    );
  }
});

export async function createACustomPlan(plans) {}

export async function createACustomQuote(quote: QuoteWorkflow) {
  for (let plan of quote.plans) {
    await configurePlan(quote, plan);
    await savePlan();
  }
  await planDesignerPage.clickElement(planDesignerPage.generateQuoteButton);
  if (await planDesignerPage.isVisible(planDesignerPage.continueButton)) {
    await planDesignerPage.clickElement(planDesignerPage.continueButton);
  }
  await addPlansToCustomQuote(quote);
}

export async function selectComparisonType(quoteType: string) {
  switch (quoteType) {
    case 'pcr': {
      await allQuotesPage.clickElement(allQuotesPage.pricingComparisonButton);
      break;
    }
    case 'bcr': {
      await allQuotesPage.clickElement(allQuotesPage.BenefitComparisonButton);
      break;
    }
    default: {
      console.log('quote type not found, please verify...');
      break;
    }
  }
}

export async function setBenefitType(benefitType: string) {
  switch (benefitType) {
    case 'Medical': {
      await benefitTypeDialog.clickElement(benefitTypeDialog.medicalButton);
      break;
    }
    case 'Dental': {
      await benefitTypeDialog.clickElement(benefitTypeDialog.dentalButton);
      break;
    }
    case 'Vision': {
      await benefitTypeDialog.clickElement(benefitTypeDialog.visionButton);
      break;
    }
    case 'Life': {
      await benefitTypeDialog.clickElement(benefitTypeDialog.lifeButton);
      break;
    }
    default: {
      await console.log('Benefit type not found, please verify...');
      break;
    }
  }
}

export async function setExchange(exchange: string) {
  switch (exchange) {
    case 'Exchange I': {
      await exchangeTypeModalDialog.clickElement(exchangeTypeModalDialog.exchangeIButton);
      break;
    }
    case 'Exchange II': {
      await exchangeTypeModalDialog.clickElement(exchangeTypeModalDialog.exchangeIIButton);
      break;
    }
    case 'Exchange III': {
      await exchangeTypeModalDialog.clickElement(exchangeTypeModalDialog.exchangeIIIButton);
      break;
    }
    case 'Exchange IV': {
      await exchangeTypeModalDialog.clickElement(exchangeTypeModalDialog.exchangeIVButton);
      break;
    }
    case 'Exchange XI': {
      await exchangeTypeModalDialog.clickElement(exchangeTypeModalDialog.exchangeXIButton);
      break;
    }
    default: {
      await console.log('Exchange type not found, please verify...');
      break;
    }
  }
}

export async function enableFilters(isFilterEnabled: boolean) {
  if (isFilterEnabled) {
    await benefitTypeDialog.clickElement(benefitTypeDialog.setQuoteFiltersChkbox);
  }
}

export async function selectQuoteType(benefitType: string) {
  if (benefitType !== 'Life') {
    await quoteTypeDialog.clickElement(quoteTypeDialog.standardModelingButton);
    await quoteTypeDialog.clickElement(quoteTypeDialog.nextButton);
  }
}

export async function setFilters(isfilterEnabled: boolean) {
  if (isfilterEnabled) {
    await slow.see('Next');
    await click('Next');
    await benefitFilterPage.waitForElementPresenceLocator(benefitFilterPage.nextButton);
    await slow.see('Add All Plans');
    //await benefitFilterPage.clickElement(benefitFilterPage.nextButton);
    await click('Add All Plans');
    await benefitFilterPage.clickElement(benefitFilterPage.nextButton);
  }
}

export async function setContributionStrategy(quote) {
  switch (quote.benefitType) {
    case 'Medical': {
      //tech debt, to be implemented...
      break;
    }
    case 'Dental': {
      //tech debt, to be implemented...
      break;
    }
    case 'Vision': {
      //tech debt, to be implemented...
      break;
    }
    case 'Life': {
      if (quote.planName) {
        await modelingContributionPage.clickDropdownOption();
        await modelingContributionPage.selectEnrolledPlan(quote.planName);
      }
      break;
    }
    default: {
      await console.log('Benefit type not found, please verify...');
      break;
    }
  }
}

export async function saveQuote(quote: QuoteWorkflow) {
  await modelingContributionPage.clickElement(modelingContributionPage.saveQuoteButton);
  await saveQuoteDialog.setQuoteName(quote.quoteType, quote.benefitType);
  await click('Save');
  await browser.waitForAngular();
}
