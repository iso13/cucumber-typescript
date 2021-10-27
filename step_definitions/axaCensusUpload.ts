import { Given } from 'cucumber';
import { GroupProfilePage } from '../pages/groupProfilePage';
import { HomePage } from '../pages/homePage';
import { fillGroupData } from '../step_definitions/groupProfileSteps';
import { createACensus } from './workflows/censusWorkflows';
import { CensusWorkflow } from './workflows/workflowObjects/censusWorkflow';

const groupProfilePage: GroupProfilePage = new GroupProfilePage();
const homePage: HomePage = new HomePage();

Given('I upload AXA Census template', async function(table) {
  let tableData = table.hashes()[0];
  const groupJson = await this.testData.getGroupJson(this, 'minimum_group_data');
  const censusLocation: string = await this.testData.getCensusPath(this, 'i_have_a_census.xlsx');

  let censusData: CensusWorkflow = new CensusWorkflow(this, {
    template_type: tableData['template_type'],
    census_location: 'i_have_a_census.xlsx'
  });
  await createACensus(this, censusData);
});
