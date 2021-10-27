import { Locator, by, element, ElementFinder, browser } from 'protractor';
import BasePage from './basePage';
import { Employee } from '../applicationObjects/employee';

export class CensusPage extends BasePage {
  public readonly headerLocator: Locator = by.css("div[ng-include='vm.templates.censusHeader']");
  public readonly saveCensusBtn: Locator = by.xpath("//span[contains(text(),'Continue')]");
  public readonly continueBtnLocator = by.id('action-Continue');
  public readonly uploadCensusBtnLocator = by.id('automation-upload-census-btn');
  public readonly overwriteFullCensusBtnLocator = by.id('automation-upload-census-overwrite-btn');
  public readonly savedCensusBtn: Locator = by.xpath("//button[contains(@id, 'action-save-census-edit')]");
  public readonly continueBtn: Locator = by.id('action-Continue');
  public readonly finishBtn: Locator = by.id('action-finish');
  public readonly addAnEmployeeBtn: Locator = by.id('action-add-Employee');
  public readonly deleteTopEmployeeBtn: Locator = by.css(
    `.census-row:first-of-type  button[id^='action-delete-employee']`
  );
  public readonly eliggibleEField: Locator = by.xpath("//span[contains(@ng-if,'eligible_ees')]");
  public readonly totalEEField: Locator = by.xpath("//span[contains(@ng-if,'total_ees')]");
  public readonly employeeOneFirstNameInput: Locator = by.css('input#input-first-name');
  public readonly employeeOneLastNameInput: Locator = by.css('input#input-last-name');
  public readonly employeeAgeInput: Locator = by.css('input#input-age');
  public readonly employeeGender: Locator = by.id('action-select-gender');
  private readonly employeeFirstName: Locator = by.id('input-first-name');
  private readonly employeeLastName: Locator = by.id('input-last-name');
  private readonly employeeDateOfBirth: Locator = by.id('input-dob');
  private readonly employeeAge: Locator = by.id('input-age');
  private readonly employeeZip: Locator = by.id('input-home-zip-code');
  private readonly employeeMedicalTier: Locator = by.id('action-select-coverage-medical');
  public readonly employeeDentalTier: Locator = by.id('action-select-coverage-code-dental');
  public readonly employeeVisionTier: Locator = by.id('action-select-coverage-code-vision-2');
  private readonly employeeSalary: Locator = by.id('input-salary');
  private readonly belowFieldErrorLocatorString: string = `//label[contains(text(), "{{fieldName}}")]/following-sibling::ng-messages/ng-message`;
  public readonly zipCodeRequiredLabelLocator = by.xpath("(//ng-message[@aria-label='Required'])[2]");
  public readonly metalTierRequiredLabelLocator = by.xpath("(//ng-message[@aria-label='Required'])[3]");
  public readonly basicButton: Locator = by.id('Basic-page-change');
  public readonly benefitProgramButton: Locator = by.id('class-page-change');
  public readonly jobButton: Locator = by.id('job-page-change');
  public readonly otherButton: Locator = by.id('other-page-change');
  public readonly contactInfoButton: Locator = by.id('crm-page-change');
  private readonly employeeBenefitProgram: Locator = by.css(
    'md-input-container >md-select > md-select-value > span:nth-child(1) > div'
  );
  private readonly employeeTable: Locator = by.className('md-virtual-repeat-offsetter');
  public readonly employeeRow: Locator = by.css("*[class^='census-member-row']");

  public async enterFirstName(firstName: string) {
    await this.sendKeys(this.employeeOneFirstNameInput, firstName);
  }
  public async enterLastName(lastName: string) {
    await this.sendKeys(this.employeeOneFirstNameInput, lastName);
  }
  public async saveCensus() {
    await this.clickElement(this.saveCensusBtn);
  }

  public async setFirtsNameAt(index: number, firstName: string) {
    let firstNamePath = "(//*//input[@id='input-first-name'])[" + index + ']';
    let firstNameLocator: Locator = by.xpath(firstNamePath);
    await this.sendKeys(firstNameLocator, firstName);
  }

  public async setDOBAt(index: number, dob: string) {
    let dobPath = "(//*//input[@id='input-dob'])[" + index + ']';
    let dobLocator: Locator = by.xpath(dobPath);
    await this.sendKeys(dobLocator, dob);
  }

  public async setSalaryAt(index: number, salary: string) {
    let salaryPath = "(//*//input[@id='input-salary'])[" + index + ']';
    let salaryLocator: Locator = by.xpath(salaryPath);
    await this.sendKeys(salaryLocator, salary);
  }

  public async setClassAt(index: number, classType: string) {
    let classPath = "(//*[@id='action-select-class'])[" + index + ']';
    let classTypePath =
      "(//div[@class='md-select-menu-container md-active md-clickable']//div[contains(@class,'md-text')][text()='" +
      classType +
      "'])[" +
      index +
      ']';
    let classLocator: Locator = by.xpath(classPath);
    let classTypeLocator: Locator = by.xpath(classTypePath);
    await this.clickElement(classLocator);
    await this.clickElement(classTypeLocator);
  }

  public async setGenderAt(index: number, genderType: string) {
    let genderPath = "(//*[@id='action-select-gender'])[" + index + ']';
    let genderTypePath =
      "(//div[@class='md-select-menu-container md-active md-clickable']//div[contains(@class,'md-text')][text()='" +
      genderType +
      "'])[" +
      index +
      ']';
    let genderLocator: Locator = by.xpath(genderPath);
    let genderTypeLocator: Locator = by.xpath(genderTypePath);
    await this.clickElement(genderLocator);
    await this.clickElement(genderTypeLocator);
  }

  public async setSalaryTypeAt(index: number, salaryType: string) {
    let salaryPath = "(//*[@id='action-select-salary-type'])[" + index + ']';
    let salaryTypePath =
      "(//div[@class='md-select-menu-container md-active md-clickable']//div[contains(@class,'md-text')][text()='" +
      salaryType +
      "'])[" +
      index +
      ']';
    let salaryLocator: Locator = by.xpath(salaryPath);
    let salaryTypeLocator: Locator = by.xpath(salaryTypePath);
    await this.clickElement(salaryLocator);
    await this.clickElement(salaryTypeLocator);
  }

  public async setLastNameAt(index: number, lastname: string) {
    let lastNamePath = "(//*//input[@id='input-last-name'])[" + index + ']';
    let lastNameLocator: Locator = by.xpath(lastNamePath);
    await this.sendKeys(lastNameLocator, lastname);
  }

  public async selectCoverageAt(index: number, coverage: string, typeOfCoverage: string) {
    if (typeOfCoverage.match('Vision Election')) {
      typeOfCoverage = 'vision-2';
    }
    if (typeOfCoverage.match('Dental Election')) {
      typeOfCoverage = 'dental';
    }
    let coveragePath = "(//*[@id='action-select-coverage-code-" + typeOfCoverage + "'])[" + index + ']';
    let typeOfCoveragePath =
      "(//md-select-menu[@class='_md md-overflow']//div[@class='md-text ng-binding'][text()='" +
      coverage +
      "'])[" +
      index +
      ']';
    let coverageLocator: Locator = by.xpath(coveragePath);
    let typeOfCoverageLocator: Locator = by.xpath(typeOfCoveragePath);
    await this.clickElement(coverageLocator);
    await this.clickElement(typeOfCoverageLocator);
  }

  private async getEmployeeTable(): Promise<ElementFinder> {
    return await element.all(this.employeeTable).first();
  }

  public async getEmployeeData(): Promise<Employee[]> {
    let employeeTable: ElementFinder = await this.getEmployeeTable();
    let employeeRows: ElementFinder[] = await employeeTable.all(this.employeeRow);
    let employees: Employee[] = [];

    for (let index = 0; index < employeeRows.length; index++) {
      const employeeRow = employeeRows[index];
      let employee: Employee = new Employee();
      employee.firstName = await employeeRow.element(this.employeeFirstName).getAttribute('value');
      employee.lastName = await employeeRow.element(this.employeeLastName).getAttribute('value');
      employee.gender = await employeeRow.element(this.employeeGender).getText();
      employee.dateOfBirth = await employeeRow.element(this.employeeDateOfBirth).getAttribute('value');
      if (await this.isElementExist(this.employeeZip)) {
        // Zip and Medical tiers do not exist on Principal
        employee.zip = await employeeRow.element(this.employeeZip).getAttribute('value');
      }
      if (await this.isElementExist(this.employeeMedicalTier)) {
        employee.medicalTier = await employeeRow.element(this.employeeMedicalTier).getText();
      }
      if (await this.isElementExist(this.employeeDentalTier)) {
        employee.dentalTier = await employeeRow.element(this.employeeDentalTier).getText();
      }
      if (await this.isElementExist(this.employeeVisionTier)) {
        employee.visionTier = await employeeRow.element(this.employeeVisionTier).getText();
      }
      employee.salary = parseFloat(await employeeRow.element(this.employeeSalary).getAttribute('value'));
      employees.push(employee);
    }

    return employees.sort((a, b) => a.firstName.localeCompare(b.firstName));
  }

  public async getEmployeeCensusData(): Promise<Employee[]> {
    let employeeTable: ElementFinder = await this.getEmployeeTable();
    let employeeRows: ElementFinder[] = await employeeTable.all(this.employeeRow);
    let employees: Employee[] = [];

    for (let index = 0; index < employeeRows.length; index++) {
      const employeeRow = employeeRows[index];
      let employee: Employee = new Employee();
      employee.firstName = await employeeRow.element(this.employeeFirstName).getAttribute('value');
      employee.lastName = await employeeRow.element(this.employeeLastName).getAttribute('value');
      employee.benefitProgram = parseInt(
        await browser.executeScript('return arguments[0].innerHTML;', employeeRow.element(this.employeeBenefitProgram))
      );
      employees.push(employee);
    }

    return employees.sort((a, b) => a.firstName.localeCompare(b.firstName));
  }

  public async clickContinueBtn() {
    await this.waitForElementPresenceLocator(this.continueBtn);
    if (!element(this.continueBtn).isEnabled) {
      await this.waitForElementPresenceLocator(this.continueBtn);
    }
    await this.clickElement(this.continueBtn);
  }

  public getErrorMessageLocator(fieldName: string): Locator {
    const locatorString: string = this.belowFieldErrorLocatorString.replace(`{{fieldName}}`, fieldName);
    return by.xpath(locatorString);
  }

  public async getTotalNumberOfEEs(): Promise<number> {
    const totalEEText: string = await this.getElementText(this.totalEEField);
    const eeNumText: string = totalEEText.split(`:`)[1].trim();
    return Number(eeNumText);
  }

  public async getNumberOfEEs(): Promise<number> {
    const eliggibleEText: string = await this.getElementText(this.eliggibleEField);
    const eeNumText: string = eliggibleEText.split(`:`)[1].trim();
    return Number(eeNumText);
  }
}
