import { When, Then } from 'cucumber';
import { CurrentAndRenewalCoveragePage } from '../pages/currentAndRenewalCoveragePage';
import { CurrentAndRenewalMedicalPage } from '../pages/currentAndRenewalMedicalPage';
import { createACustomQuote } from './workflows/customQuoteWorkflows';
import { createAPublishedQuote } from './workflows/publishedQuoteWorkflows';
import { ElementFinder } from 'protractor';
import { saveQuote } from './modeling/modelingSteps';
import { modalAutomappingOK } from './modeling/modelingSteps';

const currentAndRenewalCoveragePageObject: CurrentAndRenewalCoveragePage = new CurrentAndRenewalCoveragePage();
const currentAndRenewalMedicalPageObject: CurrentAndRenewalMedicalPage = new CurrentAndRenewalMedicalPage();

When('I create a medical current published quote with {string}', async function(medicalQuoteLocation: string) {
  await currentAndRenewalCoveragePageObject.clickElement(currentAndRenewalCoveragePageObject.selectMedicalLocator);
  await currentAndRenewalMedicalPageObject.clickElement(currentAndRenewalMedicalPageObject.createPublishedButton);
  const currentQuoteJson = await this.json.getJsonFromFile('quoting/' + medicalQuoteLocation, this.implementation);
  await createAPublishedQuote(currentQuoteJson);
});

When('I create a medical current custom quote with {string}', async function(medicalQuoteLocation: string) {
  await currentAndRenewalCoveragePageObject.clickElement(currentAndRenewalCoveragePageObject.selectMedicalLocator);
  await currentAndRenewalMedicalPageObject.clickElement(currentAndRenewalMedicalPageObject.createCustomButton);
  const currentQuoteJson = await this.json.getJsonFromFile('quoting/' + medicalQuoteLocation, this.implementation);
  await createACustomQuote(currentQuoteJson);
  await saveQuote(currentQuoteJson);
});

When('I create a medical renewal custom quote with {string}', async function(medicalQuoteLocation: string) {
  await currentAndRenewalMedicalPageObject.clickElement(currentAndRenewalMedicalPageObject.createCustomButton);
  const renewalQuoteJson = await this.json.getJsonFromFile('quoting/' + medicalQuoteLocation, this.implementation);
  await createACustomQuote(renewalQuoteJson);
  await modalAutomappingOK();
  await saveQuote(renewalQuoteJson);
});

Then('Medical current and renewal should be successfully created', async function() {
  const savedCardElements: ElementFinder[] = await currentAndRenewalMedicalPageObject.getElements(
    currentAndRenewalMedicalPageObject.savedQuoteCardsButton
  );
  let actualNumberOfsavedCards: number = savedCardElements.length;
  this.assert.strictEqual(actualNumberOfsavedCards, 2, 'Current and Renewal were not successfully created');
});
