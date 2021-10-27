import { Locator, by, Key } from 'protractor';
import BasePage from './basePage';
import { getProductFullName, getProductLocator } from '../applicationObjects/productLine';

export class GroupProfilePage extends BasePage {
  public readonly currentCoverageButton = by.id('navigate-to-current/renewal');
  public readonly addressField: Locator = by.id('input-info-address');
  public readonly addressField2: Locator = by.id('input-info-address_2');
  public readonly zipCodeField: Locator = by.id('info-input-zip-code');
  public readonly cityField: Locator = by.id('input-info-city');
  public readonly stateField: Locator = by.id('input-info-state');
  public readonly countyField: Locator = by.id('input-county');
  public readonly countryDropdownMenu: Locator = by.id('action-select-country');
  public readonly sicField: Locator = by.css(
    "input[aria-label*='Search by type of business, a related word, or SIC code']"
  );
  public readonly sicClearButton: Locator = by.css("button[ng-click='$mdAutocompleteCtrl.clear($event)']");
  public readonly groupTypeDropdownMenu: Locator = by.id('group_type');
  public readonly numberOfEligibleEmployeesField: Locator = by.id('input-info-employee-count');
  public readonly payRollFrequencyDropdownMenu: Locator = by.css("md-select[aria-label^='Payroll Frequency *']");
  public readonly effectiveDateDropdownMenu: Locator = by.id('action-select-effective-date');
  public readonly effectiveDateValue: Locator = by.xpath(
    "//md-select[@id='action-select-effective-date']//md-select-value//span//div"
  );
  public readonly payrollFrequencyDropdownMenu: Locator = by.id('payroll_frequency');
  public readonly productRenewalDate: Locator = by.css("md-select[ng-model='vm.effectiveOn']");
  public readonly reassignButtonLocator: Locator = by.xpath("//button//span[contains(text(),'Change Broker')]");
  public readonly historyButtonLocator: Locator = by.xpath("//button//span[contains(text(),'View Broker History')]");
  public readonly historyUserLocatorString: string = "//md-list-item//div//div//span[contains(text(),'owner')]";
  public readonly productEnrollmentKnown: Locator = by.css("md-select[ng-model='vm.enrollmentKnown']");
  public readonly savedButton: Locator = by.id('action-Saved');
  public readonly saveAndContinueButton: Locator = by.xpath(
    `//button[@id='action-Save & Continue' or @qa-id='bottom-action-btn-save-&-continue' or parent::span[contains(@id,'action-Save')] or parent::span[@id='action-Updating SIC..']]`
  );
  public readonly companyNameField: Locator = by.css('#input-info-company-name input');
  public readonly sicOptions: Locator = by.xpath("//*[contains(@id, 'option-sic-')]");
  public readonly productCards: Locator = by.tagName('product-card-lg');
  public readonly productIcon: Locator = by.css("icon[icon-data='vm.qpData.icon']");
  public readonly selectedProductIcon: Locator = by.css("icon[icon-data='vm.qpData.icon'].icon-selected");
  public readonly productText: Locator = by.css("div[class='text-center ng-binding']");
  public readonly fieldErrorText: Locator = by.css("div[class='field-error ng-scope']");
  public readonly productCardWarningIcon: Locator = by.css("md-icon[class='warning-icon material-icons']");
  public readonly productCardWarningTooltip: Locator = by.css('div.product-card-warnings');
  public readonly currentlyOfferProductCheckbox: string = `//icon[@id='action-select-{productFullName}']/../following-sibling::div/md-checkbox`;
  public readonly enrollmentKnownDropDown: Locator = by.id('action-select-enrollment-known-Short-Term Disability');
  public readonly enrollmentKnownYesOption: Locator = by.id('enrollment-known-yes-Short-Term Disability');
  public readonly headerLocator: Locator = by.xpath('//md-content//h2'); //Todo remove use of xpaths
  private readonly firstAgentHierarchy: Locator = by.css('#DataTables_Table_1 > tbody > tr:nth-child(1)');
  private readonly presenterAddress: Locator = by.id('additional_fields.presenter_address');

  // Field error locators
  public readonly employeeCountErrorLocator: Locator = by.xpath(
    "//input[@id='input-info-employee-count']/following-sibling::div/div[@translate]"
  );
  public readonly zipErrorLocator: Locator = by.xpath(
    "//input[@id='info-input-zip-code']/following-sibling::div/div[@translate]"
  );
  public readonly companyNameErrorLocator: Locator = by.xpath(
    "//input[@name='description']/following-sibling::div/div/div[@translate]"
  );
  public readonly cityErrorLocator: Locator = by.xpath(
    "//input[@id='input-info-city']/following-sibling::div/div[@translate]"
  );
  public readonly dueDateLocator: Locator = by.xpath("//input[@class='md-datepicker-input']");

  public async selectAgent() {
    await this.clickElement(this.firstAgentHierarchy);
  }

  public async setPresenterAddress(presenterAddress: string) {
    await this.sendKeys(this.presenterAddress, presenterAddress);
  }

  public async setQuoteEffectiveDate(effectiveDate: string) {
    await this.clickElement(this.effectiveDateDropdownMenu);
    await this.clickDropdownOption(effectiveDate);
  }

  public async getQuoteEffectiveDate(): Promise<string> {
    return this.getElementText(this.effectiveDateValue);
  }

  public async setPayrollFrequency(payrollFrequency: string) {
    await this.clickElement(this.payrollFrequencyDropdownMenu);
    await this.clickDropdownOption(payrollFrequency);
  }

  public async setProductLines(product_lines: any) {
    const productIds: string[] = Object.keys(product_lines);
    for (let productId of productIds) {
      const product: any = product_lines[productId];
      await this.clickProductLineByFullName(product.name);
      if (product.has_current) {
        const offerChbxLocator: Locator = by.xpath(
          this.currentlyOfferProductCheckbox.replace(`{productFullName}`, product.name)
        );
        await this.clickElement(offerChbxLocator);
      }
      if (product.enrollment_known) {
        await this.clickElement(this.enrollmentKnownDropDown);
        await this.clickDropdownOption('Yes');
      }
    }
  }

  public async clickProductLineBtn(produtShortName: string) {
    const produtFullName: string = getProductFullName(produtShortName);
    await this.clickProductLineByFullName(produtFullName);
  }

  public async clickProductLineByFullName(produtFullName: string) {
    const poductBtnLocatorString: string = `//icon[@id='action-select-{productLine}']`;
    const productBtn: Locator = by.xpath(poductBtnLocatorString.replace(`{productLine}`, produtFullName));
    await this.scrollElementIntoView(productBtn, `start`);
    await this.clickElement(productBtn);
  }

  public async setSicCode(sicCode: string) {
    await this.sendKeys(this.sicField, sicCode);
    await this.waitForElementPresenceLocator(this.sicOptions);
    await this.clickElement(this.sicOptions);
  }

  public async setZipCode(zipCode: string) {
    await this.sendKeys(this.zipCodeField, zipCode);
  }

  public async setNumberOfEligibleEEs(numberOfEes: string) {
    await this.sendKeys(this.numberOfEligibleEmployeesField, numberOfEes + Key.TAB);
  }

  public async isProductSelected(productLineAbbr: string): Promise<boolean> {
    const productLineFullName: string = getProductFullName(productLineAbbr);
    const locatorString: string = `//icon[@id='action-select-{productLine}'][contains(@class,'icon-selected')]`;
    const locator: Locator = by.xpath(locatorString.replace(`{productLine}`, productLineFullName));
    return await this.isElementExist(locator);
  }

  public async isProductDisabled(productLineAbbr: string): Promise<boolean> {
    const productLineFullName: string = getProductFullName(productLineAbbr);
    const warningLocatorString: string = `//icon[@id='action-select-{productLine}']/..//md-icon[@aria-label='warning']`;
    const disabledProductLocString: string = `//icon[@id='action-select-{productLine}'][contains(@class,'excluded')]`;
    const warningLocator: Locator = by.xpath(warningLocatorString.replace(`{productLine}`, productLineFullName));
    const disabledProductLocator: Locator = by.xpath(
      disabledProductLocString.replace(`{productLine}`, productLineFullName)
    );
    return (await this.isElementExist(warningLocator)) && (await this.isElementExist(disabledProductLocator));
  }

  public async getProductValidationMessage(productLine: string): Promise<String> {
    const productLineFormatted: string = getProductLocator(productLine);
    const productButtonString: string = "//span[@class='pfg-icon-{productLine} circle-icon']";
    const productButtonLocator: Locator = by.xpath(productButtonString.replace(`{productLine}`, productLineFormatted));

    await this.scrollElementIntoView(productButtonLocator, `start`);

    //that hacky solution is needed because of the bug in Angular
    //tooltip message doesn't always display on hover mouse action, often there is more than one attempt is required
    let message: string = undefined;
    let tryToGetText: number = 0;
    const maxTrySetting: number = 4;
    do {
      let tryToLocate: number = 0;
      do {
        await this.hoverOverElement(this.saveAndContinueButton);
        await this.hoverOverElement(productButtonLocator);
        if (++tryToLocate > maxTrySetting) {
          throw new Error(`Too may tries made to check if product warning tooltip element exits: ${tryToLocate - 1}`);
        }
      } while (!(await this.isElementExist(this.productCardWarningTooltip)));
      try {
        message = await this.getElementText(this.productCardWarningTooltip);
      } catch {
        if (++tryToGetText > maxTrySetting) {
          throw new Error(`Too may tries made to get the warning tooltip element text: ${tryToGetText - 1}`);
        }
      }
    } while (!message);
    return message;
  }

  public getRequiredFieldByName(fieldName: string) {
    let elementLoc;
    switch (fieldName) {
      case 'Company Name':
        elementLoc = this.companyNameField;
        break;
      case 'Zip Code':
        elementLoc = this.zipCodeField;
        break;
      case 'City':
        elementLoc = this.cityField;
        break;
      case 'SIC Code':
        elementLoc = this.sicField;
        break;
      case 'Number of Eligible Employees':
        elementLoc = this.numberOfEligibleEmployeesField;
        break;
      default:
        throw new Error(`The field [` + fieldName + `] is not currently supported and cannot be cleared`);
    }
    return elementLoc;
  }
  public getErrorLocatorByName(fieldName: string) {
    let elementLoc;
    switch (fieldName) {
      case 'Company Name':
        elementLoc = this.companyNameErrorLocator;
        break;
      case 'Zip Code':
        elementLoc = this.zipErrorLocator;
        break;
      case 'City':
        elementLoc = this.cityErrorLocator;
        break;
      case 'Number of Eligible Employees':
        elementLoc = this.employeeCountErrorLocator;
        break;
      default:
        throw new Error(`The field [` + fieldName + `] is not currently supported and cannot be cleared`);
    }
    return elementLoc;
  }
}
