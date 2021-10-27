import { Then, When } from 'cucumber';
import { element } from 'protractor';
import { UploadCensusPage } from '../pages/uploadCensusPage';
import { SelectYourHeaderRowDialog } from '../pages/dialogs/otherCensusDialogs/selectYourHeaderRowDialog';
import { MatchYourCensusDataDialog } from '../pages/dialogs/otherCensusDialogs/matchYourCensusDataDialog';
import { SaveCustomTemplateDialog } from '../pages/dialogs/otherCensusDialogs/saveCustomTemplateDialog';
import { GroupHomePage } from '../pages/groupHomePage';
import { createACensus, createACensusUsingTemplate } from './workflows/censusWorkflows';
import { ClassesPage } from '../pages/classesPage';
import { CensusUploadDataErrorsDialog } from '../pages/dialogs/censusUploadDataErrorsDialog';
import { groupNavigationSelectPages } from './navigationSteps';
import { CensusWorkflow } from './workflows/workflowObjects/censusWorkflow';
import { TierMappingDialog } from '../pages/dialogs/censusTierMappingDialog';
import { slow } from 'blue-harvest';

const uploadCensus: UploadCensusPage = new UploadCensusPage();
const selectYourHeaderRowDialog: SelectYourHeaderRowDialog = new SelectYourHeaderRowDialog();
const matchYourCensusDataDialog: MatchYourCensusDataDialog = new MatchYourCensusDataDialog();
const saveCustomTemplateDialog: SaveCustomTemplateDialog = new SaveCustomTemplateDialog();
const groupHomePageObject: GroupHomePage = new GroupHomePage();
const classesPage: ClassesPage = new ClassesPage();
const censusUploadErrorsDlg: CensusUploadDataErrorsDialog = new CensusUploadDataErrorsDialog();
const tierMappingDialog: TierMappingDialog = new TierMappingDialog();

When('I upload an other census', async function(table) {
  let tableData = table.hashes()[0];
  let censusData: CensusWorkflow = new CensusWorkflow(this, {
    template_type: 'other census',
    census_location: tableData['census_location'],
    header_row: tableData['header_row']
  });
  await createACensus(this, censusData);
});

When('I upload a census {string} selecting {string} as template type', async function(
  censusName: string,
  templateType: string
) {
  const censusLocation: string = await this.testData.getCensusPath(
    this,
    censusName.match('.xlsx|.xls|.csv') ? censusName : censusName + '.xlsx'
  );
  await createACensusUsingTemplate(this, templateType, censusLocation);
});

When(/^I upload an Other Census using "(.+)" file$/, uploadOtherCensus);
export async function uploadOtherCensus(jsonFile: string) {
  const censusData: CensusWorkflow = await getCensusData(this, jsonFile);
  await createACensus(this, censusData);
}

When('I navigate to {string} page', async function(pageName: string) {
  await groupNavigationSelectPages(pageName);
});

Then('My census should be successfully created', async function() {
  await slow.see(groupHomePageObject.headerLocator);
});

Then('Census should be successfully uploaded', async function() {
  this.assert.strictEqual(
    await element(classesPage.finishBtnLocator).getText(),
    'Finish',
    'A census was not successfully uploaded'
  );
});

When(/^I select an Other Census "(.+)" file to upload$/, async function(jsonFile: string) {
  const censusData: CensusWorkflow = await getCensusData(this, jsonFile);
  await uploadCensusFile(censusData.templateType, censusData.censusLocation);
});

When(/^I match the census file data in the matching dialog$/, async function() {
  await setOtherCensusHeaderRow(this.censusWorkflowData);
  await matchOtherCensusColumns(this.censusWorkflowData);
});

Then(/^I should see the coverage codes from census file for Dental and Vision product lines$/, async function() {
  const columnData = this.censusWorkflowData.columnData;
  for (let column of columnData) {
    if (column.tierMappings) {
      const allDisplayedTierCodes: string[] = await tierMappingDialog.getAllDisplayedTierCodes();
      for (let tierMapping of column.tierMappings) {
        const expectedTierCode: string = tierMapping.tierCode;
        this.assert.include(
          allDisplayedTierCodes,
          expectedTierCode,
          `The list of displayed tier codes [` +
            allDisplayedTierCodes +
            `] doesn't contain the expected tier code [` +
            expectedTierCode +
            `]`
        );
      }
      await tierMappingDialog.clickElement(tierMappingDialog.skipButton);
    }
  }
});

Then(/^I should see a dialog for mapping of coverage tiers for "(.+)" product lines$/, async function(
  productLines: string
) {
  const products: string[] = this.testData.convertStringToArray(productLines);
  for (let product of products) {
    const actualDialogTitle: string = await element(tierMappingDialog.tierMappingTitle).getText();
    this.assert.strictEqual(actualDialogTitle, 'Map Your ' + product + ' Election');
    await tierMappingDialog.clickElement(tierMappingDialog.skipButton);
  }
});

export async function getCensusData(worldContext, jsonFile: string): Promise<CensusWorkflow> {
  const censusJsonData = await worldContext.testData.getOtherCensusDataJson(worldContext, jsonFile);
  worldContext.censusWorkflowData = new CensusWorkflow(worldContext, {
    template_type: censusJsonData.templateType,
    census_location: censusJsonData.fileName,
    header_row: censusJsonData.headerRow,
    column_data: censusJsonData.columnData,
    columns_to_skip: censusJsonData.columnsToSkip
  });
  return worldContext.censusWorkflowData;
}

export async function uploadCensusFile(censusType: string, censusFilePath: string) {
  await uploadCensus.setCensusType(censusType);
  await uploadCensus.setCensusFile(censusFilePath);
  await uploadCensus.clickElement(uploadCensus.continueLocator);
}

export async function mapOtherCensus(censusData: any) {
  await setOtherCensusHeaderRow(censusData);
  await matchOtherCensusColumns(censusData);
  await setTierMappings(censusData.columnData);
  if (await saveCustomTemplateDialog.isElementExist(saveCustomTemplateDialog.cancelButton)) {
    await saveCustomTemplateDialog.clickElement(saveCustomTemplateDialog.cancelButton);
  }
}

async function setOtherCensusHeaderRow(censusData: any) {
  await selectYourHeaderRowDialog.setHeaderRow(censusData.headerRow);
  await selectYourHeaderRowDialog.clickElement(selectYourHeaderRowDialog.nextButton);
}

async function matchOtherCensusColumns(censusData: any) {
  for (let columnDataObject of censusData.columnData) {
    if (columnDataObject['mappingKey']) {
      await matchYourCensusDataDialog.setColumnSelection(censusData.columnData);
    }
  }
  if (censusData.columnsToSkip) {
    await matchYourCensusDataDialog.skipColumns(censusData.columnsToSkip);
    await matchYourCensusDataDialog.clickElement(matchYourCensusDataDialog.nextButton);
  }
  await matchYourCensusDataDialog.clickElement(matchYourCensusDataDialog.nextButton);
}

export async function closeCensusUploadErrorsDialog() {
  if (await censusUploadErrorsDlg.isVisible(censusUploadErrorsDlg.dialogLocator)) {
    await censusUploadErrorsDlg.clickModalNavigationBtn('CLOSE');
  }
}

async function setTierMappings(columnData: any) {
  for (let column of columnData) {
    if (column.tierMappings) {
      for (let tierMapping of column.tierMappings) {
        await tierMappingDialog.setTierSelection(tierMapping.tierCode, tierMapping.mapToValue);
        await tierMappingDialog.clickElement(tierMappingDialog.finishButton);
      }
    }
  }
}
