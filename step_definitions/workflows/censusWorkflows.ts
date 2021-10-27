import { Given } from 'cucumber';
import { mapOtherCensus, uploadCensusFile } from '../uploadCensusSteps';
import { CensusPage } from '../../pages/censusPage';
import { ClassesPage } from '../../pages/classesPage';
import { createAGroup } from './groupWorkflows';
import { Employee } from '../../applicationObjects/employee';
import { CensusWorkflow } from './workflowObjects/censusWorkflow';
import { saveClasses } from '../classesSteps';
import { saveCensusAfterUploading } from '../censusSteps';

const editCensus: CensusPage = new CensusPage();
const classesPage: ClassesPage = new ClassesPage();

/**
 * Enters: App home page
 * Exits: Group home page or classes page
 */
Given('I have a census', async function(table) {
  const groupJson = await this.testData.getGroupJson(this, 'i_have_a_group');
  let censusDetails: CensusWorkflow = new CensusWorkflow(this, table.hashes()[0]);
  await createAGroup(this, groupJson);
  await createACensus(this, censusDetails);
});

export async function createACensus(worldContext, censusData: CensusWorkflow) {
  const implementation: string = worldContext.testData.getCurrentImplementation(worldContext);
  await uploadCensusFile(censusData.templateType, censusData.censusLocation);
  if (censusData.templateType.toLocaleLowerCase().includes('other census')) {
    await mapOtherCensus(censusData);
    if (await editCensus.isElementExist(editCensus.saveCensusBtn)) {
      await editCensus.clickElement(editCensus.saveCensusBtn);
    }
  }
  if (implementation === 'principal') {
    await saveClasses();
    await saveCensusAfterUploading();
  }
}

export async function createACensusUsingTemplate(
  worldContext,
  templateName: string,
  census: string
): Promise<Employee[]> {
  await uploadCensusFile(templateName, census);
  const implementation: string = worldContext.testData.getCurrentImplementation(worldContext);
  let employees: Employee[];
  if (implementation === 'trinet' || implementation === 'principal') {
    //TriNet displays classes page after a census is uploaded
    await classesPage.clickElement(classesPage.finishBtnLocator);
    employees = await editCensus.getEmployeeData();
    await editCensus.clickElement(editCensus.continueBtnLocator);
  } else {
    employees = await editCensus.getEmployeeData();
    await editCensus.clickElement(editCensus.saveCensusBtn);
  }
  //sometimes we might get a walk me popup after uploading a census
  await editCensus.closeWalkMe();
  return await employees;
}

export async function createACensusUsingTemplateAndStopAfterSaveIt(worldContext, templateName: string, census: string) {
  await uploadCensusFile(templateName, census);
  const implementation: string = worldContext.testData.getCurrentImplementation(worldContext);
  if (implementation === 'trinet') {
    //TriNet displays classes page after a census is uploaded
    await classesPage.waitForElementPresenceLocator(classesPage.finishBtnLocator);
  }
}

export async function overwriteACensusUsingTemplate(
  worldContext,
  templateName: string,
  census: string
): Promise<Employee[]> {
  return await createACensusUsingTemplate(worldContext, templateName, census);
}
