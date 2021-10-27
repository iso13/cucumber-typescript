import { Given } from 'cucumber';
import { createAGroup } from './groupWorkflows';
import { createACensus } from './censusWorkflows';
import { CensusPage } from '../../pages/censusPage';
import { createClasses } from './classesWorkflows';
import { CensusWorkflow } from './workflowObjects/censusWorkflow';
import { populateAllCustomPlanFields, savePlanPDv2, CustomPlansData } from '../planDesignerSteps';

const editCensus: CensusPage = new CensusPage();

//Why was this added?? There is workflow for custom quotes?
Given('I am on plan design', async function(table) {
  let tableData = table.hashes()[0];
  const groupJson = await this.testData.getGroupJson(this, 'i_have_a_group');
  let censusData: CensusWorkflow = new CensusWorkflow(this, {
    template_type: tableData['template_type'],
    census_location: 'i_have_a_census.xlsx',
    header_row: 2
  });
  await createAGroup(this, groupJson);
  await createACensus(this, censusData);
  await createClasses(groupJson);
  await navigateToPlanDesign();
});

export async function navigateToPlanDesign() {
  await editCensus.clickElement(editCensus.continueBtn);
}

export async function createCustomPlans(worldContext, dataTable: any) {
  const customPlans: CustomPlansData = new CustomPlansData(dataTable);

  for (let i = 0; i < customPlans.allCustomPlans.length; i++) {
    const customPlan = await customPlans.getCustomPlan(worldContext, i);
    await populateAllCustomPlanFields(worldContext, customPlan);
    await savePlanPDv2();
  }
}
