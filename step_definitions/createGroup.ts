import { Given } from 'cucumber';
import { GroupProfilePage } from '../pages/groupProfilePage';
import { HomePage } from '../pages/homePage';
import { createAGroup } from './workflows/groupWorkflows';

const groupProfilePage: GroupProfilePage = new GroupProfilePage();
const homePage: HomePage = new HomePage();

Given('I create a new group with minimum group data', async function() {
  const groupJson = await this.testData.getGroupJson(this, 'minimum_group_data');
  await createAGroup(this, groupJson);
});
