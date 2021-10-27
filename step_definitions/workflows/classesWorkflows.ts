import { Given, When } from 'cucumber';
import { createAGroup } from './groupWorkflows';
import { createACensus } from './censusWorkflows';
import { ClassesPage } from '../../pages/classesPage';
import { AddClassDialog } from '../../pages/dialogs/addClassDialog';
import { CensusWorkflow } from './workflowObjects/censusWorkflow';
import { navigateInsideGroupIfNeeded } from '../navigationSteps';

const classesPage: ClassesPage = new ClassesPage();
const addClassDialog: AddClassDialog = new AddClassDialog();

Given('I have classes', async function() {
  const groupJson = await this.testData.getGroupJson(this, 'i_have_a_group');
  let censusData: CensusWorkflow = new CensusWorkflow(this, {
    template_type: 'other census',
    census_location: 'i_have_a_census.xlsx',
    header_row: 2
  });
  await createAGroup(this, groupJson);
  await createACensus(this, censusData);
  await createClasses(groupJson);
});

When(/^I create new class:$/, async function(dataTable: any) {
  await navigateInsideGroupIfNeeded(`Classes`);
  const areAllProductClassesExpanded: boolean = await classesPage.areProductClassesExpanded(`All Products`);
  if (!areAllProductClassesExpanded) {
    await classesPage.clickElement(classesPage.allBenefitTypesExpandButton);
  }

  for (let entry of dataTable.hashes()) {
    await classesPage.clickElement(classesPage.addClassBtn);
    await addClassDialog.sendKeys(addClassDialog.classNumberFld, entry[`number`]);
    await addClassDialog.sendKeys(addClassDialog.classDescriptionFld, entry[`description`]);
    await addClassDialog.clickElement(addClassDialog.saveBtn);
  }
});

export async function createClasses(group) {
  await classesPage.clickElement(classesPage.finishBtnLocator);
}
