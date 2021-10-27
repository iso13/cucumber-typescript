import { Given, When } from 'cucumber';
import { RatingBandsPage } from '../../pages/ratingBandsPage';
import { DefaultRatingBandsModalDialog } from '../../pages/dialogs/defaultRatingBandsModalDialog';
import { Navigation } from '../../pages/navigation';
import { HomePage } from '../../pages/homePage';
import RateBands = require('../workflows/workflowObjects/rateBandsWorkflow');

const ratingBand: RatingBandsPage = new RatingBandsPage();
const navigation: Navigation = new Navigation();
const homePage: HomePage = new HomePage();
const defaultRatingBand: DefaultRatingBandsModalDialog = new DefaultRatingBandsModalDialog();

Given('I set the rate bands for my group using the following data {string}', async function(
  this,
  rateBandsFileName: string
) {
  let rateBand: RateBands = await this.testData.getRateBandsJson(this, rateBandsFileName);
  let exchangeItems = rateBand.exchanges;
  let defaultRatingBands = null;
  let isDefaultForMedicalEnabled = null;
  let isDefaultForLifeEnabled = null;
  let isDefaultForDisabilityEnabled = null;
  let medicalBand = null;
  let lifeBand = null;
  let disabilityBand = null;

  for (let exchange of exchangeItems) {
    defaultRatingBands = exchange.defaultRatingBands;
    await navigation.groupNavigationSelectPages('rate-bands');
    await homePage.clickWalkMeCloseBtn();
    await ratingBand.setPrimaryEffectiveDate(rateBand.setQuarters.primaryEffectiveQuarter);
    isDefaultForMedicalEnabled = await getDefaultValueByProductLine(defaultRatingBands, 'Medical');
    isDefaultForLifeEnabled = await getDefaultValueByProductLine(defaultRatingBands, 'Life');
    isDefaultForDisabilityEnabled = await getDefaultValueByProductLine(defaultRatingBands, 'Disability');
    if (isDefaultForMedicalEnabled || isDefaultForLifeEnabled || isDefaultForDisabilityEnabled) {
      await ratingBand.selectExchange('TriNet ' + exchange.exchangeName);
      await ratingBand.clickOnDefaultRatingBandBtn();
      medicalBand = await getBandValueByProductLine(defaultRatingBands, 'Medical', 'Primary Band');
      lifeBand = await getBandValueByProductLine(defaultRatingBands, 'Life', 'Primary Band');
      disabilityBand = await getBandValueByProductLine(defaultRatingBands, 'Disability', 'Primary Band');
      await defaultRatingBand.rateDefaultPrimaryBandsWithDisability(medicalBand, lifeBand, disabilityBand);
      if (isDefaultForMedicalEnabled === false && exchange.medicalCarrierData) {
        await ratingBand.setPrimaryBandByCarrier(exchange.medicalCarrierData);
      } else if (isDefaultForLifeEnabled === false && exchange.lifeCarrierData) {
        await ratingBand.setPrimaryBandByCarrier(exchange.lifeCarrierData);
      }
    }
    await ratingBand.clickOnSaveCarrierBands();
  }
});

export async function getDefaultValueByProductLine(defaultBandsItems, productLine) {
  let valueToReturn = null;
  for (let item of defaultBandsItems) {
    if (item.productLine === productLine) {
      valueToReturn = item.default;
    }
  }
  return valueToReturn;
}

export async function getBandValueByProductLine(defaultBandsItems, productLine, bandName) {
  let valueToReturn = null;
  for (let item of defaultBandsItems) {
    if (item.productLine === productLine) {
      if (bandName.toLowerCase() === 'primary band') {
        valueToReturn = item.bands.primaryBand;
      }
      if (bandName.toLowerCase() === 'alternate band') {
        valueToReturn = item.bands.alternateBand;
      }
      if (bandName.toLowerCase() === 'current coverage band') {
        valueToReturn = item.bands.currentCoverageBand;
      }
    }
  }
  return valueToReturn;
}
