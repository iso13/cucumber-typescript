import { Locator, by, element, ElementFinder, Key } from 'protractor';
import BasePage from './basePage';

export class PlanDesignerPage extends BasePage {
  public readonly planDesignerPageTitle: Locator = by.css('div.group-heading h2');
  private readonly loadingDialog: Locator = by.css(`#md-dialog-2`);
  public importFupPlanString: string = 'XXXXX Plan-import-freq-plan';
  private readonly selectCustomPlanBtnStr: string = "//button[span[text()='{{custom_plan_name}}']]";
  public readonly ratesTab: Locator = by.xpath("//md-tab-item//span[text()='Rates']/..");
  public readonly benefitsTab: Locator = by.xpath("//md-tab-item//span[text()='Benefits']/..");
  public readonly planSummaryTab: Locator = by.xpath(`//md-tab-item[span[text()='Summary']]`);
  public readonly planCarrierLogo: Locator = by.css(`img.carrier-logo`);
  public readonly planNameField: Locator = by.id('plan-name');
  public readonly planNameCopy: Locator = by.id('duplicate-plan');
  public readonly planViewField: Locator = by.xpath("//md-select//div[contains(text(),'Contract Version 1')]");
  public readonly presetDropdownMenu: Locator = by.id('preset');
  //This is temporary. A better solution for filling in benefits is needed(more than likely reading from a json)
  public readonly networkNameField: Locator = by.id('input-network_name');
  public readonly carrierNameDropdownMenu: Locator = by.id('carrier-dropdown');
  public readonly rateStructureDropdownMenu: Locator = by.id('rate-select-structure');
  public readonly fourTierRateField: Locator = by.model('vm.selectedCustomPlan.rates[rate]');
  public readonly assignClassesWarning: Locator = by.css(`#class-description-container > .warning`);
  public readonly checkedClasses: Locator = by.css('#class-description-container md-checkbox.md-checked');
  public readonly savePlanButton: Locator = by.xpath("//span[contains(text(),'Save')]");
  public readonly savePlanButtonContainer: Locator = by.css('.pd-bottom-toolbar > button.md-button.flex-15');
  public readonly savedPlanButton: Locator = by.xpath("//span[contains(text(),'Saved')]");
  public readonly errorOnSave: Locator = by.xpath(
    "//*/h3[contains(text(),'Group is past effective date cannot be quoted')]"
  );
  public readonly savePlanDisabledButton: Locator = by.css(`button[ng-click^='vm.confirm'][disabled='disabled']`);
  public readonly viewRatesDisabledButton: Locator = by.css(`view-rates-button button[disabled='disabled']`);
  public readonly viewRatesEnabledButton: Locator = by.css(`view-rates-button button`);
  public readonly generateQuoteButton: Locator = by.id('action-generate-quotes');
  public readonly addFUPBtnLocator: Locator = by.css('#add-to-freq-used-plans');
  public readonly importFupPlanBtnLocator: Locator = by.css('.icon-import-plans');
  public readonly deleteCustomPlanBtnLocator: Locator = by.css(`button[ng-click^='vm.deletePlan']`);

  public readonly groupStatusOnPlanDesigner: Locator = by.xpath("//*[@id='group-status']");
  public readonly actionsDropdownMenuOnPlanDesigner: Locator = by.xpath("//*[@id='group-actions-dropdown']");
  public readonly actionStringLocator: string = "//md-option[@value='action']";
  public readonly okStatusUpdatedLocator: Locator = by.xpath("//button//span[text()='OK']");
  public readonly continueSoftStopWarning: Locator = by.xpath('//md-dialog-actions/button[1]');
  public readonly closeSoftStopWarning: Locator = by.xpath('//md-dialog-actions/button[0]');
  public readonly softStopWarningMessage: Locator = by.xpath('//md-dialog-content/div/ul/li');

  private reviewSavedPlan(planName: string): Locator {
    return by.xpath(`//div[@id='${planName}-plan']`);
  }

  public async clickActionsDropdown(actionsStructure: string) {
    await this.clickElement(this.actionsDropdownMenuOnPlanDesigner);
    const actionLocator = this.actionStringLocator.replace('action', actionsStructure);
    await this.clickElement(by.xpath(actionLocator));
  }

  public async clickRateStructureDropdown(rateStructure: string) {
    await this.clickElement(this.rateStructureDropdownMenu);
    await this.clickDropdownOption(rateStructure);
  }

  public async clickCarrierDropdown(carrierName: string) {
    await this.clickElement(this.carrierNameDropdownMenu);
    await this.clickDropdownOption(carrierName);
  }

  public async clickPlanViewDropdown(planViewName: string) {
    await this.clickElement(this.planViewField);
    await this.clickDropdownOption(planViewName);
  }

  public async clickPresetDropdown(presetName: string) {
    await this.clickElement(this.presetDropdownMenu);
    await this.clickDropdownOptionExactMatch(presetName);
  }

  public async clickAddPlanForProduct(productLine: string) {
    const locator: Locator = by.id(productLine + ` Plan-add-plan`);
    await this.clickElement(locator);
  }

  public async viewSavedPlans(planName: string) {
    const savedPlanLocator: Locator = this.reviewSavedPlan(planName);
    await this.clickElement(savedPlanLocator);
  }

  /**
   * Finds the plan with the given planName and the clicks the copy button
   * @param {string}
   */
  public async copyPlan(planName: string) {
    const savedPlanLocator: Locator = this.reviewSavedPlan(planName);
    const planItem: ElementFinder = await element(savedPlanLocator);
    const copyElement: ElementFinder = await planItem.element(this.planNameCopy);
    await this.clickElementFinder(copyElement);
  }

  public async verifyRadioButtonCheckedOrNot(benefitSlug: string, value: string): Promise<string> {
    const radioGroupLocator: Locator = by.id('benefit-radio-' + benefitSlug);
    const radioGroupElement: ElementFinder = await element(radioGroupLocator);
    await this.scrollElementFinderIntoView(radioGroupElement, `start`);
    const radioOptionLocator: Locator = by.css(`md-radio-button[aria-label^='` + value + `']`);
    const radioOptionElement: ElementFinder = await radioGroupElement.element(radioOptionLocator);
    return await radioOptionElement.getAttribute('aria-checked');
  }

  public async verifySelectOption(benefitSlug: string, label: string, value: string): Promise<string> {
    const selectBenefitLocator: Locator = by.id('benefit-select-' + benefitSlug);
    const selectBenefitElement: ElementFinder = await element(selectBenefitLocator);
    await this.scrollElementIntoView(selectBenefitLocator, `start`);
    const benefitValueLocator: Locator = by.xpath(`//md-select[contains(@aria-label,'` + label + `')]`);
    const benefitValueElement: ElementFinder = await selectBenefitElement.element(benefitValueLocator);
    return await benefitValueElement.getAttribute('aria-label');
  }

  public async selectCustomPlanFromList(planName: string): Promise<void> {
    const selectCustomPlanBtn: Locator = by.xpath(
      this.selectCustomPlanBtnStr.replace(`{{custom_plan_name}}`, planName)
    );
    await this.clickElement(selectCustomPlanBtn);
  }

  public async isCustomPlanVisible(planName: string): Promise<boolean> {
    const selectCustomPlanBtn: Locator = by.xpath(
      this.selectCustomPlanBtnStr.replace(`{{custom_plan_name}}`, planName)
    );
    return await this.isVisible(selectCustomPlanBtn);
  }

  public async isCustomPlanLocked(planName: string): Promise<boolean> {
    const lockPlanIcon: Locator = by.css(`div[id='` + planName + `-plan'] > md-icon[ng-if*="lock_outline"]`);
    return await this.isVisible(lockPlanIcon);
  }

  public async isSavedPlanIconVisible(planName: string): Promise<boolean> {
    const savedPlanIcon: Locator = by.css(`div[id='` + planName + `-plan'] > md-icon[ng-if*="save"]`);
    return await this.isVisible(savedPlanIcon);
  }

  public async clickImportFupPlanBtnForProduct(productLine: string) {
    let locator: Locator = by.id(this.importFupPlanString.replace('XXXXX', productLine));
    await this.clickElement(locator);
  }

  public async setRates(rates) {
    switch (rates.type) {
      case 'ageBanded': {
        await this.clickRateStructureDropdown('Age Banded');
        await this.setFourTierRates(rates.ageBanded);
        break;
      }
      case 'fourTier': {
        await this.clickRateStructureDropdown('4 Tier');
        await this.setFourTierRates(rates.fourTier);
        break;
      }
      case 'threeTier': {
        await this.clickRateStructureDropdown('3 Tier');
        await this.setThreeTierRates(rates.threeTier);
        break;
      }
    }
  }

  public async setFourTierRates(rates) {
    /*Todo Tech-Debt : these should be a rates object on a plan design workflow object so we can keep
    the structure static and consistent*/
    let inputFields: ElementFinder[] = await element.all(this.fourTierRateField);
    for (let i: number = 0; i < inputFields.length; i++) {
      this.sendKeysWithElementFinder(inputFields[i], rates[i]);
    }
  }

  public async setThreeTierRates(rates) {
    let inputFields: ElementFinder[] = await element.all(this.fourTierRateField);
    for (let i: number = 0; i < inputFields.length; i++) {
      this.sendKeysWithElementFinder(inputFields[i], rates[i]);
    }
  }

  public async setAgeBandedRates(rates) {
    //Todo add logic for setting an age banded custom plan
  }

  public async clickAddFupPlanBtn() {
    await this.clickElement(this.addFUPBtnLocator);
  }

  public async clickRadioOption(benefitSlug: string, value: string) {
    const radioGroupLocator: Locator = this.getBenefitTypeRadio(benefitSlug);
    const radioGroupElement: ElementFinder = await element(radioGroupLocator);
    await this.scrollElementFinderIntoView(radioGroupElement, `start`);
    const radioOptionLocator: Locator = by.css(`md-radio-button[aria-label^='` + value + `']`);
    const radioOptionElement: ElementFinder = await radioGroupElement.element(radioOptionLocator);
    await this.clickElementFinder(radioOptionElement);
    await this.checkElementFinderAttributeEqualsTo(radioOptionElement, `aria-checked`, `true`);
  }

  public async setSelectOption(benefitSlug: string, value: string) {
    const selectBenefitLocator: Locator = this.getBenefitTypeSelect(benefitSlug);
    await this.scrollElementIntoView(selectBenefitLocator, `start`);
    await this.clickElement(selectBenefitLocator);
    const benefitValueLocator: Locator = by.xpath(
      "//div[contains(@class,'md-active')]//md-option/div[text()='" + value + "']"
    );
    await this.clickElement(benefitValueLocator);
  }

  public async setSliderValue(benefitSlug: string, value: string) {
    const sliderBenefitInputLocator: Locator = this.getBenefitTypeRange(benefitSlug);
    const sliderBenefitInput: ElementFinder = await element(sliderBenefitInputLocator);
    await this.scrollElementFinderIntoView(sliderBenefitInput, `start`);
    await this.waitForElementToBeClickableShort(sliderBenefitInputLocator);

    /* vsuvorov: the method of BasePage class doesn't work here as it clears
    the slider input field first and fills it in a separate method
    on PDv2 we should clear and populate the slider input fields in one action,
    that's why we add few backspace characters before putting the actual value in */
    let clearField: string = Key.BACK_SPACE;
    for (let i = 0; i < 6; i++) {
      clearField = clearField.concat(Key.BACK_SPACE);
    }
    await this.sendKeys(sliderBenefitInputLocator, clearField + value + Key.TAB);
    await this.checkElementFinderAttributeEqualsTo(sliderBenefitInput, `value`, value);
  }

  public async clickClassNumberChbx(classNumber: string) {
    const classNumberChbx: Locator = by.css(`h4#class-number-${classNumber} + md-checkbox`);
    await this.scrollElementIntoView(classNumberChbx, `start`);
    await this.clickElement(classNumberChbx);
    await this.waitForElementNotPresentLocator(this.loadingDialog);
  }

  public async clickSoftStopWarning(continueButton: string) {
    if (continueButton === 'continue') {
      await this.clickElement(this.continueSoftStopWarning);
    } else if (continueButton === 'cancel') {
      await this.clickElement(this.closeSoftStopWarning);
    } else throw new Error('Not a valid option: continue or cancel');
  }

  public async getSoftStopWarning() {
    return await this.getElementText(this.softStopWarningMessage);
  }

  /**
   * Click all the checked classes to uncheck them or remove them from plan
   */
  public async uncheckClasses() {
    const elementsFound: ElementFinder[] = await this.getElements(this.checkedClasses);
    for (const classElement of elementsFound) {
      await this.clickElements(classElement);
      await this.waitForElementNotPresentLocator(this.loadingDialog);
    }
  }

  /**
   * Forms the locator using the type and benefitSlug
   * @param  {string}
   * @param  {string}
   * @return {Locator}
   */
  public benefitLocator(benefitSlug: string, type: string): Locator {
    switch (type) {
      case 'radio':
        return this.getBenefitTypeRadio(benefitSlug);
      case 'range':
        return this.getBenefitTypeRange(benefitSlug);
      case 'select':
        return this.getBenefitTypeSelect(benefitSlug);
      default:
        throw new Error(`Unsupported benefit type '${type}'. Check your custom plan json`);
    }
  }

  /**
   * Forms the range type locators with the benefitSlug
   * @param  {String}
   * @return {Locator}
   */
  public getBenefitTypeRange(benefitSlug): Locator {
    return by.css(`#benefit-slider-input-${benefitSlug} input`);
  }

  /**
   * Forms the radio type locators with the benefitSlug
   * @param  {String}
   * @return {Locator}
   */
  public getBenefitTypeRadio(benefitSlug): Locator {
    return by.id(`benefit-radio-${benefitSlug}`);
  }

  /**
   * Forms the select type locators with the benefitSlug
   * @param  {String}
   * @return {Locator}
   */
  public getBenefitTypeSelect(benefitSlug): Locator {
    return by.id(`benefit-select-${benefitSlug}`);
  }
}
