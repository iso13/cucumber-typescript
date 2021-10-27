import { When, Then } from 'cucumber';
import { ClassesPage } from '../pages/classesPage';
import { Employee } from '../applicationObjects/employee';
import { BenefitProgram } from '../applicationObjects/benefitProgram';
import { CensusPage } from '../pages/censusPage';
import { createACensusUsingTemplateAndStopAfterSaveIt } from './workflows/censusWorkflows';
import { selectCensusPage } from './censusSteps';

const classesPage: ClassesPage = new ClassesPage();
const editCensus: CensusPage = new CensusPage();

let employees: Employee[];
let benefitPrograms: BenefitProgram[];
let defaultBenefitProgram: BenefitProgram = null;

When('I upload a census {string} selecting {string} as template type and save and continue', async function(
  censusName: string,
  templateType: string
) {
  const censusLocation: string = await this.testData.getCensusPath(
    this,
    censusName.endsWith('.xlsx') ? censusName : censusName + '.xlsx'
  );
  await createACensusUsingTemplateAndStopAfterSaveIt(this, templateType, censusLocation);
});

When(/^I save classes$/, async function() {
  await saveClasses();
});

When('I accept default benefit program', { timeout: 30 * 1000 }, async function() {
  await classesPage.waitForElementPresenceLocator(classesPage.allBenefitTypesTitle);
  await classesPage.waitForElementPresenceLocator(classesPage.allBenefitTypesExpandButton);
  await classesPage.clickElement(classesPage.allBenefitTypesExpandButton);

  // Retrieve default Benefit Program
  benefitPrograms = await classesPage.getBenefitProgramData();
  defaultBenefitProgram = benefitPrograms[0];
  await classesPage.clickElement(classesPage.finishBtnLocator);
});

When('I click {string} on Census', async function(censusPage: string) {
  await selectCensusPage(censusPage);
});

Then('Default benefit program number should be {string}', async function(benefitProgramNumber: string) {
  await classesPage.waitForElementPresenceLocator(classesPage.allBenefitTypesTitle);
  await classesPage.waitForElementPresenceLocator(classesPage.allBenefitTypesExpandButton);
  await classesPage.clickElement(classesPage.allBenefitTypesExpandButton);

  benefitPrograms = await classesPage.getBenefitProgramData();

  // Validate default Benefit Programs should be 1
  this.assert.strictEqual(1, benefitPrograms.length, 'It should be 1 Benefit Program by default');
  // Validate default Benefit Program number
  defaultBenefitProgram = benefitPrograms[0];
  this.assert.strictEqual(
    defaultBenefitProgram.number.toString(),
    benefitProgramNumber,
    'Default Benefit Program is not correct'
  );
});

Then('By default all members on census should be assigned to the default benefit program', async function() {
  // Retrieve employees
  employees = await editCensus.getEmployeeCensusData();

  for (let employee of employees) {
    this.assert.strictEqual(
      defaultBenefitProgram.number,
      employee.benefitProgram,
      'Default Benefit Program for employee is not correct'
    );
  }
});

Then(/^the class should be created for product lines:$/, async function(dataTable: any) {
  for (let tableRow of dataTable.hashes()) {
    const productLine: string = tableRow[`product_line`];
    const classNum: string = tableRow[`class_number`];
    const classDesc: string = tableRow[`class_description`];

    await classesPage.expandProductClasses(productLine);
    const isClassDisplayed: boolean = await classesPage.isClassDisplayed(productLine, classNum, classDesc);
    this.assert.isTrue(isClassDisplayed, `Class [${productLine}, ${classNum}, ${classDesc}] was not found`);
  }
});

Then(/^the class "([^"]+)" should contain "([^"]+)" employees$/, async function(classNum: string, livesCount: string) {
  const actualLivesCount: string = await classesPage.getClassEmpCount(classNum);
  this.assert.strictEqual(livesCount, actualLivesCount);
});

export async function saveClasses() {
  await classesPage.clickElement(classesPage.finishBtnLocator);
}
