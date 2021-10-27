import { Given } from 'cucumber';
import { GroupProfilePage } from '../../pages/groupProfilePage';
import { HomePage } from '../../pages/homePage';
import { fillGroupData } from '../groupProfileSteps';
import { selectBroker } from '../brokerSelectionSteps';
import { slow } from 'blue-harvest';
import { CensusWorkflow } from './workflowObjects/censusWorkflow';
import { createACensus } from './censusWorkflows';
import { createACensusUsingTemplate } from './censusWorkflows';
import { getCensusData } from '../uploadCensusSteps';
import { uploadPrincipalValidCensusFile } from '../workflows/principalWorkflows';

const groupProfilePage: GroupProfilePage = new GroupProfilePage();
const homePage: HomePage = new HomePage();
/**
 * Enters: App home page
 * Exits: Census upload page
 */
Given(/^I have (?:created )?a (?:new )?group$/, async function() {
  const groupJson = await this.testData.getGroupJson(this, 'i_have_a_group');
  await createAGroup(this, groupJson);
});

Given('I create a new group with {string} and owner as {string}', async function(groupFile: string, ownerName: string) {
  const groupJson = await this.testData.getGroupJson(this, groupFile);
  await slow.see('CREATE GROUP');
  await createAGroupWithOwner(this, groupJson, ownerName);
});

Given('I set {string} as owner of the group', async function(ownerName: string) {
  selectAGroupOwner(ownerName);
});

Given('I create a group with data {string} and owner {string}', async function(groupFile: string, ownerName: string) {
  const groupJson = await this.testData.getGroupJson(this, groupFile);
  await slow.see('CREATE GROUP');
  await createAGroupWithOwner(this, groupJson, ownerName);
});

Given('I upload census file {string} for template {string}', async function(censusFile: string, censusType: string) {
  const implementation: string = this.testData.getCurrentImplementation(this);
  const censusLocation: string = await this.testData.getCensusPath(
    this,
    censusFile.match('.xlsx|.xls|.csv') ? censusFile : censusFile + '.xlsx'
  );
  await createACensusUsingTemplate(this, censusType, censusLocation);
});

export async function createAGroup(worldContext, group) {
  await homePage.clickCreateGroup();
  await fillGroupData(worldContext, group);
  await groupProfilePage.clickElement(groupProfilePage.saveAndContinueButton);
  worldContext.groupJsonData = group;
}

export async function createAGroupWithOwner(worldContext, group, ownerName) {
  await homePage.clickWalkMeCloseBtn();
  await homePage.clickCreateGroup();
  await selectBroker(ownerName);
  await fillGroupData(worldContext, group);
  await groupProfilePage.clickElement(groupProfilePage.saveAndContinueButton);
  worldContext.groupJsonData = group;
}

export async function selectAGroupOwner(ownerName) {
  await selectBroker(ownerName);
}
