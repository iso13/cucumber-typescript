import { Locator, by, element, ElementFinder, ElementArrayFinder, browser } from 'protractor';
import BasePage from './basePage';

export class RatingBandsPage extends BasePage {
  public readonly primaryQuarterDropDown: Locator = by.id('primary-effective-quarter-select');
  public readonly alternateQuarterDropDown: Locator = by.id('alternate-effective-quarter-select');
  public readonly currentQuarterDropDown: Locator = by.id('current-effective-quarter-select');
  public readonly defaultBandsBtn: Locator = by.id('default-bands-button');
  public readonly carrierRowWebElementLocator: Locator = by.xpath(
    ".//span[@ng-if='carrier[vm.selectedProductLineId]']"
  );
  public readonly carrierWebElementLocator: Locator = by.xpath("./h5[contains(@class,'carrier-name')]");
  public readonly carrierPrimaryBandDropDownLocator: Locator = by.xpath(
    ".//md-select[contains(@id,'primary-carrier-band-select-')]"
  );
  public readonly carrierBandDivLocator: Locator = by.xpath('md-select-value/span/div[string-length() > 0 ]');
  public readonly carrierBandDivTxt: string = "md-select-value/span/div[contains(text(),'XXXXX')]";
  public readonly benefitTypeTabLocator: Locator = by.xpath('.//md-tabs-canvas/md-pagination-wrapper/md-tab-item');
  public readonly saveCarrierBandLocator: Locator = by.xpath(".//button[@id='save-button']");
  public readonly exchangeDropdownLocator: Locator = by.xpath("//md-select[contains(@id,'exchange-select')]");
  public readonly clearAllBandValuesButton: Locator = by.id('clear-bands-button');
  public readonly exchangeOption = 'md-option[value*=\'"XXXXX"\']';

  public async setPrimaryEffectiveDate(effectiveDate: string) {
    await this.clickElement(this.primaryQuarterDropDown);
    await this.clickDropdownOption(effectiveDate);
  }

  public async setAlternateEffectiveDate(effectiveDate: string) {
    await this.clickElement(this.alternateQuarterDropDown);
    await this.clickDropdownOption(effectiveDate);
  }

  public async setCurrentffectiveDate(effectiveDate: string) {
    await this.clickElement(this.currentQuarterDropDown);
    await this.clickDropdownOption(effectiveDate);
  }

  public async clickOnDefaultRatingBandBtn() {
    await this.clickElement(this.defaultBandsBtn);
  }

  public async clickOnBenefitTypeTab(benefitTypeTabName: string) {
    let benefitTypeTabList: ElementFinder[] = await element.all(this.benefitTypeTabLocator);

    for (let index = 0; index < benefitTypeTabList.length; index++) {
      let tabSpan = benefitTypeTabList[index].element(by.xpath('./span'));
      let tabText = await tabSpan.getText();
      if (tabText === benefitTypeTabName) {
        await benefitTypeTabList[index].click();
        return;
      }
    }
    throw new Error('Tab with name ' + benefitTypeTabName + ' not present on UI');
  }

  public async clickOnSaveCarrierBands() {
    await this.clickElement(this.saveCarrierBandLocator);
  }

  public async getPrimaryQuarter() {
    return await element(this.primaryQuarterDropDown).getText();
  }

  public async getAlternateQuarter() {
    return await element(this.alternateQuarterDropDown).getText();
  }

  public async getCurrentQuarter() {
    return await element(this.currentQuarterDropDown).getText();
  }

  public async getCarrierPrimaryBand(carrierName: string) {
    let carrierBandRow: ElementFinder = await this.getElementContainerForCarrier(carrierName);

    return this.getPrimaryBandSetForCarrier(carrierBandRow);
  }

  public async selectExchange(exchange: string) {
    await this.clickElement(this.exchangeDropdownLocator);
    await this.clickElement(by.css(this.exchangeOption.replace('XXXXX', exchange)));
  }

  public async clearAllRatingBands() {
    await this.clickElement(this.clearAllBandValuesButton);
  }

  public async isAnyPrimaryBandForCarrierSelected(carriersName: string[]): Promise<boolean> {
    for (let index = 0; index < carriersName.length; index++) {
      let carrierBandRow: ElementFinder = await this.getElementContainerForCarrier(carriersName[index]);

      let primaryBandElement: ElementFinder = await carrierBandRow.element(this.carrierPrimaryBandDropDownLocator);
      if (await primaryBandElement.element(this.carrierBandDivLocator).isPresent()) {
        return true;
      }
    }
    return false;
  }

  public async findPrimaryBandForCarrier(carrierName: string, band: string) {
    let carrierBandRow: ElementFinder = await this.getElementContainerForCarrier(carrierName);
    return this.findPrimaryBandSetForCarrier(carrierBandRow, band);
  }

  public async getAllCarriersPrimaryBand(carriersName: string[]) {
    let carrierBandList: string[] = new Array<string>();

    for (let index = 0; index < carriersName.length; index++) {
      const primaryBand: string = await this.getCarrierPrimaryBand(carriersName[index]);
      carrierBandList.push(primaryBand);
    }
    return carrierBandList;
  }

  private async getElementContainerForCarrier(carrierName: string) {
    let carrierList: ElementFinder[] = await element.all(this.carrierRowWebElementLocator);

    for (let index = 0; index < carrierList.length; index++) {
      let carrierElement = await carrierList[index].element(this.carrierWebElementLocator);
      let elemIdAttributeValue: string = await carrierElement.getAttribute('id');
      if (elemIdAttributeValue.includes(carrierName)) {
        return carrierList[index];
      }
    }
    throw new Error('Element container for the carrier: ' + carrierName + 'was not found');
  }

  public async getPrimaryBandSetForCarrier(carrierBandRow: ElementFinder) {
    let primaryBandElement = await carrierBandRow.element(this.carrierPrimaryBandDropDownLocator);
    let carrierElement = await primaryBandElement.element(this.carrierBandDivLocator);
    let primaryBandSelectedName: string = await carrierElement.getText();
    return await primaryBandSelectedName;
  }

  public async findPrimaryBandSetForCarrier(carrierBandRow: ElementFinder, band: string) {
    let primaryBandElement = await carrierBandRow.element(this.carrierPrimaryBandDropDownLocator);
    let dynamicXpath: string = this.carrierBandDivTxt.replace('XXXXX', band);
    let carrierBandDivLocator = by.xpath(dynamicXpath);
    let bandElement: ElementFinder = await primaryBandElement.element(carrierBandDivLocator);

    return await bandElement.isPresent();
  }

  public async setPrimaryBandByCarrier(carrierData) {
    for (let carrier of carrierData) {
      const primaryBandLocatorStr =
        "//h5[contains(text(),'{column_name}')]/following-sibling::md-input-container/md-select[contains(@id,'primary-carrier')]";
      const primaryBandDropDownLocator = by.xpath(primaryBandLocatorStr.replace(`{column_name}`, carrier.carrierName));
      await browser.executeScript(
        'arguments[0].scrollIntoView(true);',
        element
          .all(primaryBandDropDownLocator)
          .first()
          .getWebElement()
      );
      await this.clickElement(primaryBandDropDownLocator);
      await this.clickPrimaryDropdownOption(carrier.bandValues.primaryBand);
    }
  }

  public async clickPrimaryDropdownOption(option: string) {
    const dropdownOptionsLocatorText =
      "div[class='md-select-menu-container md-active md-clickable'] md-content > md-option[value='{bandValue}']";
    let dynamicCss: string = dropdownOptionsLocatorText.replace('{bandValue}', option);
    let optionLocator = by.css(dynamicCss);
    await this.clickElement(optionLocator);
  }
}
