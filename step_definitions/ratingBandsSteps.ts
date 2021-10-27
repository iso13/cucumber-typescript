import { When, Then } from 'cucumber';
import { RatingBandsPage } from '../pages/ratingBandsPage';
import { DefaultRatingBandsModalDialog } from '../pages/dialogs/defaultRatingBandsModalDialog';
import { Navigation } from '../pages/navigation';
import { HomePage } from '../pages/homePage';

const ratingBand: RatingBandsPage = new RatingBandsPage();
const navigation: Navigation = new Navigation();
const homePage: HomePage = new HomePage();
const defaultRatingBand: DefaultRatingBandsModalDialog = new DefaultRatingBandsModalDialog();

When('I clear all rating bands for the exchange {string}', async function(exchange: string) {
  await homePage.closeWalkMe();
  await navigation.groupNavigationSelectPages('rate-bands');
  await ratingBand.selectExchange(exchange);
  await ratingBand.clearAllRatingBands();
  await ratingBand.clickOnSaveCarrierBands();
});

When('I set Primary Quarter {string}, Alternate Quarter {string} and Current Quarter {string}', async function(
  primaryQuarter: string,
  alternateQuarter: string,
  currentQuarter: string
) {
  await homePage.closeWalkMe();
  await navigation.groupNavigationSelectPages('rate-bands');
  await ratingBand.setPrimaryEffectiveDate(primaryQuarter);
  await ratingBand.setAlternateEffectiveDate(alternateQuarter);
  await ratingBand.setCurrentffectiveDate(currentQuarter);
});

When(
  'I set the band {string} for all Medical carriers and {string} for the Life carrier and {string} for the Disability carrier in the primary quarter {string} and Exchange {string}',
  async function(
    medicalBand: string,
    lifeBand: string,
    disabilityBand: string,
    primaryQuarter: string,
    exchange: string
  ) {
    await homePage.closeWalkMe();
    await navigation.groupNavigationSelectPages('rate-bands');
    await ratingBand.setPrimaryEffectiveDate(primaryQuarter);
    await ratingBand.selectExchange(exchange);
    await ratingBand.clickOnDefaultRatingBandBtn();
    await defaultRatingBand.rateDefaultPrimaryBandsWithDisability(medicalBand, lifeBand, disabilityBand);
    await ratingBand.clickOnSaveCarrierBands();
  }
);

When(
  'I set the band {string} for all Medical carriers and {string} for the Life carrier in the primary quarter {string} and Exchange {string}',
  async function(medicalBand: string, lifeBand: string, primaryQuarter: string, exchange: string) {
    await homePage.closeWalkMe();
    await navigation.groupNavigationSelectPages('rate-bands');
    await ratingBand.setPrimaryEffectiveDate(primaryQuarter);
    await ratingBand.selectExchange(exchange);
    await ratingBand.clickOnDefaultRatingBandBtn();
    await defaultRatingBand.rateDefaultPrimaryBands(medicalBand, lifeBand);
    await ratingBand.clickOnSaveCarrierBands();
  }
);

When(
  'I set the band {string} for all Medical carriers and {string} for the Life carrier and {string} for the Disability carrier and Exchange {string} in the current quarter',
  async function(medicalBand: string, lifeBand: string, disabilityBand: string, exchange: string) {
    await homePage.closeWalkMe();
    await navigation.groupNavigationSelectPages('rate-bands');
    await ratingBand.selectExchange(exchange);
    await ratingBand.clickOnDefaultRatingBandBtn();
    await defaultRatingBand.rateDefaultPrimaryBandsWithDisability(medicalBand, lifeBand, disabilityBand);
    await ratingBand.clickOnSaveCarrierBands();
  }
);

When(
  'I set the band {string} for all Medical carriers and {string} for the Life carrier and Exchange {string} in the current quarter',
  async function(medicalBand: string, lifeBand: string, exchange: string) {
    await homePage.closeWalkMe();
    await navigation.groupNavigationSelectPages('rate-bands');
    await ratingBand.selectExchange(exchange);
    await ratingBand.clickOnDefaultRatingBandBtn();
    await defaultRatingBand.rateDefaultPrimaryBands(medicalBand, lifeBand);
    await ratingBand.clickOnSaveCarrierBands();
  }
);

When(
  'I set carriers bands {string} for Medical and {string} for Life and {string} for Disability in quarters primary {string} altenate {string} current {string} on Exchange {string}',
  async function(
    medicalBand: string,
    lifeBand: string,
    disabilityBand: string,
    primaryQuarter: string,
    alternateQuarter: string,
    currentQuarter: string,
    exchange: string
  ) {
    await homePage.closeWalkMe();
    await navigation.groupNavigationSelectPages('rate-bands');
    await ratingBand.setPrimaryEffectiveDate(primaryQuarter);
    await ratingBand.setAlternateEffectiveDate(alternateQuarter);
    await ratingBand.setCurrentffectiveDate(currentQuarter);
    await ratingBand.selectExchange(exchange);
    await ratingBand.clickOnDefaultRatingBandBtn();
    await defaultRatingBand.rateDefaultAllBandsWithDisability(medicalBand, lifeBand, disabilityBand);
    await ratingBand.clickOnSaveCarrierBands();
  }
);

When(
  'I set carriers bands {string} for Medical and {string} for Life in quarters primary {string} altenate {string} current {string} on Exchange {string}',
  async function(
    medicalBand: string,
    lifeBand: string,
    primaryQuarter: string,
    alternateQuarter: string,
    currentQuarter: string,
    exchange: string
  ) {
    await homePage.closeWalkMe();
    await navigation.groupNavigationSelectPages('rate-bands');
    await ratingBand.setPrimaryEffectiveDate(primaryQuarter);
    await ratingBand.setAlternateEffectiveDate(alternateQuarter);
    await ratingBand.setCurrentffectiveDate(currentQuarter);
    await ratingBand.selectExchange(exchange);
    await ratingBand.clickOnDefaultRatingBandBtn();
    await defaultRatingBand.rateDefaultAllBands(medicalBand, lifeBand);
    await ratingBand.clickOnSaveCarrierBands();
  }
);

Then('I verify all rating Bands for the selected exchange have been cleared', async function(table) {
  let carriersList: string[] = new Array<string>();
  for (let index = 0; index < table.hashes().length; index++) {
    let carrier = table.hashes()[index]['Carrier'];
    carriersList.push(carrier);
  }

  this.assert.isFalse(
    await ratingBand.isAnyPrimaryBandForCarrierSelected(carriersList),
    'Not all the rating bands were cleared'
  );

  await ratingBand.clickOnBenefitTypeTab('LIFE');
  carriersList.length = 0;
  carriersList.push('MetLife');
  this.assert.isFalse(
    await ratingBand.isAnyPrimaryBandForCarrierSelected(carriersList),
    'Not all the rating bands were cleared'
  );
});

Then('Verify Primary Quarter {string}, Alternate Quarter {string} and Current Quarter {string} are set', async function(
  primaryQuarter: string,
  alternateQuarter: string,
  currentQuarter: string
) {
  let actualPrimaryQuarter = await ratingBand.getPrimaryQuarter();
  let actualAlternateQuarter = await ratingBand.getAlternateQuarter();
  let actualCurrentQuarter = await ratingBand.getCurrentQuarter();

  this.assert.strictEqual(actualPrimaryQuarter, primaryQuarter, 'Primary Quarter was not successfully set');
  this.assert.strictEqual(actualAlternateQuarter, alternateQuarter, 'Alternate Quarter was not successfully set');

  this.assert.strictEqual(actualCurrentQuarter, currentQuarter, 'Current Quarter was not successfully set');
});

Then('Verify the Medical band {string} and the Life band {string} has been set for carriers', async function(
  medicalBand: string,
  lifeBand: string
) {
  let actualMedicalBand = await ratingBand.findPrimaryBandForCarrier('Blue Shield of California', medicalBand);
  this.assert.strictEqual(actualMedicalBand, true, 'Rating Band for Blue Shield of California was not correctly set');

  await ratingBand.clickOnBenefitTypeTab('LIFE');
  let actualLfeBand = await ratingBand.findPrimaryBandForCarrier('MetLife', lifeBand);
  this.assert.strictEqual(actualLfeBand, true, 'Rating Band for MetLife was not correctly set');
});
