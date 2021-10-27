import { by, Locator, element, ElementArrayFinder } from 'protractor';
import { RatingBandsPage } from '../ratingBandsPage';

export class DefaultRatingBandsModalDialog extends RatingBandsPage {
  public readonly primaryBandDropdown: Locator = by.xpath(
    ".//md-dialog//md-select[@id='primary-carrier-band-select-']"
  );
  public readonly alternateBandDropdown: Locator = by.xpath("//md-select[@id='alternate-carrier-band-select-']");
  public readonly currentBandDropdown: Locator = by.xpath("//md-select[@id='current-carrier-band-select-']");
  public readonly defaultModalTab: Locator = by.xpath(
    ".//md-dialog[@aria-label='Default Rating Bands ...']/..//md-tabs-canvas/md-pagination-wrapper/md-tab-item"
  );
  public readonly applyBtnOnDefaultRatingBandModal: Locator = by.xpath(
    "//div[@class='bottom-options']/button[@ng-click='vm.ok()']"
  );

  public async rateDefaultPrimaryBandsWithDisability(medicalBand: string, lifeBand: string, disabilityBand: string) {
    if (medicalBand) {
      await this.selectPrimaryCarrier(medicalBand);
    }
    if (lifeBand) {
      await this.clickOnLifeTab();
      await this.selectPrimaryCarrier(lifeBand);
    }
    if (disabilityBand) {
      await this.clickOnDisabilityTab();
      await this.selectPrimaryCarrier(disabilityBand);
    }
    await this.applyDefaultRatingBands();
  }

  public async rateDefaultPrimaryBands(medicalBand: string, lifeBand: string) {
    if (medicalBand) {
      await this.selectPrimaryCarrier(medicalBand);
    }
    if (lifeBand) {
      await this.clickOnLifeTab();
      await this.selectPrimaryCarrier(lifeBand);
    }
    await this.applyDefaultRatingBands();
  }

  public async rateDefaultAllBands(medicalBand: string, lifeBand: string) {
    await this.selectAllCarrier(medicalBand);
    await this.clickOnLifeTab();
    await this.selectAllCarrier(lifeBand);
    await this.applyDefaultRatingBands();
  }

  public async rateDefaultAllBandsWithDisability(medicalBand: string, lifeBand: string, disabilityBand: string) {
    await this.selectAllCarrier(medicalBand);
    await this.clickOnLifeTab();
    await this.selectAllCarrier(lifeBand);
    await this.clickOnDisabilityTab();
    await this.selectAllCarrier(disabilityBand);
    await this.applyDefaultRatingBands();
  }

  public async selectAllCarrier(bandName: string) {
    await this.clickElement(this.primaryBandDropdown);
    await this.clickDropdownOption(bandName);
    await this.clickElement(this.alternateBandDropdown);
    await this.clickDropdownOption(bandName);
    await this.clickElement(this.currentBandDropdown);
    await this.clickDropdownOption(bandName);
  }

  public async selectPrimaryCarrier(bandName: string) {
    await this.clickElement(this.primaryBandDropdown);
    await this.clickPrimaryDropdownOption(bandName);
  }

  public async clickOnLifeTab() {
    await this.clickOnDefaultBandsModalTabs('LIFE');
  }

  public async clickOnDisabilityTab() {
    await this.clickOnDefaultBandsModalTabs('DISABILITY');
  }

  public async clickOnDefaultBandsModalTabs(tabName: string) {
    let dialogTabElem: ElementArrayFinder = element.all(this.defaultModalTab);

    await dialogTabElem.each(async function(elem, index) {
      let elemString: string = await elem.getText();
      if (elemString === tabName) {
        await elem.click();
        return;
      }
    });
  }

  public async applyDefaultRatingBands() {
    await this.clickElement(this.applyBtnOnDefaultRatingBandModal);
  }
}
