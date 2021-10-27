import { Then, When } from 'cucumber';
import { CensusPage } from '../pages/censusPage';
import { InvalidOrMissingDataDialog } from '../pages/dialogs/invalidOrMissingDataDialog';
import { minimumLivesCensusDialog } from '../pages/dialogs/otherCensusDialogs/minimumLivesCensusDialog';
import { overwriteACensusUsingTemplate } from './workflows/censusWorkflows';
import { element } from 'protractor';
import { Employee } from '../applicationObjects/employee';
import { GroupHomePage } from '../pages/groupHomePage';
import jsonHelper from '../helpers/json.helper';
import { SmallGroupQuestionDialog } from '../pages/dialogs/smallGroupQuestionDialog';
import { DeleteEmployeeDialog } from '../pages/dialogs/deleteEmployeeDialog';
import { click, inside, see, below } from 'blue-harvest';
import { navigateInsideGroupIfNeeded } from './navigationSteps';

const editCensus: CensusPage = new CensusPage();
const invalidDataDlg: InvalidOrMissingDataDialog = new InvalidOrMissingDataDialog();
const censusPage: CensusPage = new CensusPage();
const minimumLivesCensusDlg: minimumLivesCensusDialog = new minimumLivesCensusDialog();
const groupHomePageObject: GroupHomePage = new GroupHomePage();
const smallGroupQuestionDialog: SmallGroupQuestionDialog = new SmallGroupQuestionDialog();
const deleteEmployeeDialog: DeleteEmployeeDialog = new DeleteEmployeeDialog();

let employees: Employee[];

When('I add an employee with {string} {string}', async function(firstName: string, lastName: string) {
  await addEmployeeWithFirstAndLastName(firstName, lastName);
});

When('I start adding a new employee', async function() {
  await navigateInsideGroupIfNeeded(`Census`);
  await censusPage.clickElement(censusPage.addAnEmployeeBtn);
});

When(/^I update the class to "(.+)" for the Employee "(.+)"$/, async function(classId: string, employeeNumber: number) {
  await navigateInsideGroupIfNeeded(`Census`);
  await censusPage.setClassAt(employeeNumber, classId);
});

When(/^I update all data for the Employee "(.+)"$/, async function(employeeNumber: number) {
  await navigateInsideGroupIfNeeded(`Census`);
  await censusPage.setFirtsNameAt(employeeNumber, 'New First Name');
  await censusPage.setLastNameAt(employeeNumber, 'New Last Name');
  await censusPage.setDOBAt(employeeNumber, '01/04/1976');
  await censusPage.setSalaryAt(employeeNumber, '50000');
  await censusPage.setSalaryTypeAt(employeeNumber, 'Weekly');
  await censusPage.setGenderAt(employeeNumber, 'F');
});

Then('Employee should add successfully', async function() {
  this.assert.strictEqual(
    await element(censusPage.savedCensusBtn).getText(),
    'Saved',
    'Employee was not successfully added'
  );
});

Then('No census error dialogs should appear', async function() {
  await invalidDataDlg.checkTheDialogIsNotDisplaying();
});

Then(/^the eligible employees should re-appear as "(.+)" eligible employees$/, async function(employees: number) {
  let TolatNumOFEE: number = await censusPage.getNumberOfEEs();
  this.assert.equal(TolatNumOFEE, employees, `Error the number of employees is not the expected`);
});

Then(/^the last deleted employee should re-appear so there are "(.+)" employees$/, async function(employees: number) {
  let TolatNumOFEE: number = await censusPage.getTotalNumberOfEEs();
  this.assert.equal(TolatNumOFEE, employees, `Error the number of employees is not the expected`);
});

When('I try to save the census', async function() {
  await censusPage.clickElement(censusPage.savedCensusBtn);
});

When(/^I populate census "(.+)" field with "(.+)" value for "(\d+)" employees$/, async function(
  typeOfCoverage: string,
  coverage: string,
  targetQty: number
) {
  await navigateInsideGroupIfNeeded(`Census`);
  let TolatNumOFEE: number = await censusPage.getTotalNumberOfEEs();
  let eeCurrent: number = TolatNumOFEE;
  let eeIndex: number = 1;
  if (TolatNumOFEE > targetQty) {
    do {
      await censusPage.selectCoverageAt(eeIndex, coverage, typeOfCoverage);
      eeCurrent = await censusPage.getNumberOfEEs();
      eeIndex++;
    } while (eeCurrent > TolatNumOFEE - targetQty);
  } else {
    throw new Error(
      `Census contains less number of EEs [` +
        eeCurrent +
        `] than expected [` +
        targetQty +
        `].` +
        `\nUpdate your census or test (step parameter) or create new bug :)`
    );
  }
});

When('I overwrite a census with {string} selecting {string} as template type', async function(
  censusName: string,
  templateName: string
) {
  await navigateInsideGroupIfNeeded(`Census`);
  const censusLocation: string = await this.testData.getCensusPath(this, censusName + '.xlsx');
  await overwriteFullCensus();
  this.employees = await overwriteACensusUsingTemplate(this, templateName, censusLocation);
});

When(/^I delete employees from census, so there are only "(\d+)" employees left$/, async function(targetQty: number) {
  await navigateInsideGroupIfNeeded(`Census`);
  let eeCurrent: number = await censusPage.getTotalNumberOfEEs();
  if (eeCurrent > targetQty) {
    do {
      if (eeCurrent === 4) {
        await minimumLivesCensusDlg.waitForDialogtoDisplay();
        await minimumLivesCensusDlg.acceptError();
      }
      await censusPage.clickElement(censusPage.deleteTopEmployeeBtn);
      await deleteEmployeeDialog.clickElement(deleteEmployeeDialog.yesButton);
      eeCurrent = await censusPage.getTotalNumberOfEEs();
    } while (eeCurrent > targetQty);
  } else {
    throw new Error(
      `Census contains less number of EEs [` +
        eeCurrent +
        `] than expected [` +
        targetQty +
        `].` +
        `\nUpdate your census or test (step parameter) or create new bug :)`
    );
  }
});

Then('My census should be successfully overwritten and match {string}', async function(fileName: string) {
  const expectedEmployees = await JSON.stringify(
    await jsonHelper.getJsonFromFile('census/expectedResults/' + fileName, this.implementation)
  );
  const actualEmployees = await JSON.stringify(this.employees);
  this.assert.strictEqual(actualEmployees, expectedEmployees, 'Overwritten census does not match expected');
  this.assert.strictEqual(
    await element(groupHomePageObject.headerLocator).getText(),
    'Recent Quotes',
    'A census was not successfully created'
  );
});

Then('the small group question modal should be displayed', async function() {
  const isActuallyVisible: boolean = await smallGroupQuestionDialog.isVisible(smallGroupQuestionDialog.dialogLocator);
  this.assert.isTrue(isActuallyVisible);
});

Then(/^Following required fields should show the "(.+)" message underneath them:$/, async function(
  expectedMessage: string,
  fieldNames: any
) {
  for (let fieldName of fieldNames.raw()) {
    const errorMessageLocator = censusPage.getErrorMessageLocator(fieldName);

    const isMessageDisplayed: boolean = await censusPage.isVisible(errorMessageLocator);
    this.assert.isTrue(isMessageDisplayed, `Error message for the [` + fieldName + `] field is not displayed`);

    const actualMessage: string = await censusPage.getElementText(errorMessageLocator);
    this.assert.strictEqual(actualMessage, expectedMessage);
  }
});

Then(/^Election fields for Dental and Vision products should be hidden on census$/, async function() {
  await navigateInsideGroupIfNeeded(`Census`);
  const areDentalTierFieldsDisplayed = await censusPage.isElementExist(censusPage.employeeDentalTier);
  const areVisionTierFieldsDisplayed = await censusPage.isElementExist(censusPage.employeeVisionTier);
  this.assert.isFalse(areDentalTierFieldsDisplayed, `Dental Election fields are displayed`);
  this.assert.isFalse(areVisionTierFieldsDisplayed, `Vision Election fields are displayed`);
});

export async function saveCensusAfterUploading() {
  await editCensus.clickElement(editCensus.continueBtn);
}

export async function addEmployeeWithFirstAndLastName(firstName: string, lastName: string) {
  censusPage.enterFirstName(firstName);
  censusPage.enterLastName(lastName);
  censusPage.saveCensus();
}

export async function overwriteFullCensus() {
  await editCensus.waitForElementPresenceLocator(editCensus.uploadCensusBtnLocator);
  await editCensus.clickElement(editCensus.uploadCensusBtnLocator);
  await editCensus.waitForElementPresenceLocator(editCensus.overwriteFullCensusBtnLocator);
  await editCensus.clickElement(editCensus.overwriteFullCensusBtnLocator);
}

export async function getEmployeeData(): Promise<Employee[]> {
  return await editCensus.getEmployeeData();
}

export async function selectCensusPage(censusPageOption: string) {
  switch (censusPageOption) {
    case 'Basic': {
      await censusPage.waitForElementPresenceLocator(censusPage.basicButton);
      await censusPage.clickElement(censusPage.basicButton);
      break;
    }
    case 'Benefit Program': {
      await censusPage.waitForElementPresenceLocator(censusPage.benefitProgramButton);
      await censusPage.clickElement(censusPage.benefitProgramButton);
      break;
    }
    case 'Job': {
      await censusPage.waitForElementPresenceLocator(censusPage.jobButton);
      await censusPage.clickElement(censusPage.jobButton);
      break;
    }
    case 'Other': {
      await censusPage.waitForElementPresenceLocator(censusPage.otherButton);
      await censusPage.clickElement(censusPage.otherButton);
      break;
    }
    case 'Contact Info': {
      await censusPage.waitForElementPresenceLocator(censusPage.contactInfoButton);
      await censusPage.clickElement(censusPage.contactInfoButton);
      break;
    }
  }
}

Then(/^I click on input census manually and add click on add one member$/, async function() {
  await click('or input census manually');
  await see('Your Census is empty!');
  await below('Your Census is empty!').click('Add An Employee');
});

When(/^I verify the required census fields$/, async function() {
  await inside(censusPage.employeeRow)
    .under('Age')
    .see('Required');
  await inside(censusPage.employeeRow)
    .under('Zip')
    .see(censusPage.zipCodeRequiredLabelLocator);
  await inside(censusPage.employeeRow)
    .under('Medical Tier')
    .see(censusPage.metalTierRequiredLabelLocator);
  await inside(censusPage.employeeRow)
    .under('Salary')
    .see('Required');
  await click('Job');
  await inside(censusPage.employeeRow)
    .under('Employment Status')
    .see('Required');
});
