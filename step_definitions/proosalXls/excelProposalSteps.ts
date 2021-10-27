import { Then } from 'cucumber';
import * as path from 'path';
import { WorkBook } from 'xlsx/types';

Then(/^Basic group info should display on the (?:.+) proposal$/, async function() {
  const pathStr = path.join(process.cwd(), 'testData', 'downloads', this.proposalFileName);
  await this.fileSystem.waitForFileToExist(pathStr);
  const wb = await this.excelHelper.getExcelWorkbookFromFile(pathStr);

  const actualGroupNameParam: string = this.excelHelper.getFormattedValueByCellReference(wb, 0, 'A1');
  const actualGroupNameValue: string = this.excelHelper.getFormattedValueByCellReference(wb, 0, 'B1');
  this.assert.strictEqual(actualGroupNameParam, `Group Name`);
  this.assert.strictEqual(
    actualGroupNameValue,
    this.groupName,
    `The [` + actualGroupNameParam + `] param value is not as expected`
  );

  const actualEffDateParam: string = this.excelHelper.getFormattedValueByCellReference(wb, 0, 'A2');
  const actualEffDateValue: string = this.excelHelper.getFormattedValueByCellReference(wb, 0, 'B2');
  this.assert.strictEqual(actualEffDateParam, `Eff. Date`);
  const options = { month: 'numeric', day: 'numeric', year: 'numeric' };
  let expectedEffDateValue;
  if (this.groupEfectiveDate == null) {
    expectedEffDateValue = this.dateHelper.getNextQuoteEffectiveDateFormatted(options);
  } else {
    const msec = Date.parse(this.groupEfectiveDate);
    const current = new Date(msec);
    expectedEffDateValue = current.toLocaleDateString('en-US', options);
  }
  this.assert.strictEqual(
    actualEffDateValue,
    expectedEffDateValue,
    `The [` + actualEffDateParam + `] param value is not as expected`
  );

  const actualZipParam: string = this.excelHelper.getFormattedValueByCellReference(wb, 0, 'A3');
  const actualZipValue: string = this.excelHelper.getFormattedValueByCellReference(wb, 0, 'B3');
  this.assert.strictEqual(actualZipParam, `Zip`);
  this.assert.strictEqual(
    actualZipValue,
    this.groupJsonData.postal_code,
    `The [` + actualZipParam + `] param value is not as expected`
  );

  const actualCountyParam: string = this.excelHelper.getFormattedValueByCellReference(wb, 0, 'A4');
  const actualCountyValue: string = this.excelHelper.getFormattedValueByCellReference(wb, 0, 'B4');
  this.assert.strictEqual(actualCountyParam, `County`);
  this.assert.isNotEmpty(actualCountyValue, `The [` + actualCountyParam + `] param value is empty`);

  const actualSicParam: string = this.excelHelper.getFormattedValueByCellReference(wb, 0, 'A5');
  const actualSicValue: string = this.excelHelper.getFormattedValueByCellReference(wb, 0, 'B5');
  this.assert.strictEqual(actualSicParam, `SIC`);
  this.assert.strictEqual(
    actualSicValue,
    this.groupJsonData.sic,
    `The [` + actualSicParam + `] param value is not as expected`
  );
});

Then(/^Both basic and detailed benefits of "([^"]+)" should display on the "([^"]+)" proposal$/, verifyPlanBenefits);
async function verifyPlanBenefits(planFileName: string, productLine: string) {
  const proposalDataJson = await this.testData.getProposalJson(this, planFileName + ` proposal`);
  const actualProposalWorkbook = await getProposalWorkbook(this);
  const expectedBenefits = proposalDataJson[productLine][planFileName].plan_benefits;
  assertParameters(this, planFileName, actualProposalWorkbook, expectedBenefits);
}

Then(
  /^(?:Calculated|Determined) [^"]+ should display for the "([^"]+)" of "([^"]+)" proposal$/,
  verifyPlanCalculatedParams
);
async function verifyPlanCalculatedParams(planFileName: string, productLine: string) {
  const proposalDataJson = await this.testData.getProposalJson(this, planFileName + ` proposal`);
  const actualProposalWorkbook = await getProposalWorkbook(this);
  const expectedCalculatedParams = proposalDataJson[productLine][planFileName].calculated_params;
  assertParameters(this, planFileName, actualProposalWorkbook, expectedCalculatedParams);
}

function assertParameters(worldContext, planFileName: string, wb: WorkBook, paramObjects) {
  for (let paramObject of paramObjects) {
    const paramNameCellRef: string = paramObject.paramName.cellRef;
    const expectedParamName: string = paramObject.paramName.expectedValue;
    const paramValueCellRef: string = paramObject.paramValue.cellRef;
    const assertionType: string = paramObject.paramValue.assertionType;
    const expectedValue: string = paramObject.paramValue.expectedValue;
    const expectedPattern: string = paramObject.paramValue.expectedPattern;

    const actualParamName: string = worldContext.excelHelper.getFormattedValueByCellReference(wb, 0, paramNameCellRef);
    const actualValue: string = worldContext.excelHelper.getFormattedValueByCellReference(wb, 0, paramValueCellRef);

    worldContext.assert.strictEqual(actualParamName, expectedParamName);
    const assertionMessage: string = `The [` + actualParamName + `] param value is not as expected`;
    switch (assertionType) {
      case `strictEqual`:
        worldContext.assert.strictEqual(actualValue, expectedValue, assertionMessage);
        break;
      case `isNotEmpty`:
        worldContext.assert.isNotEmpty(actualValue, `The [` + actualParamName + `] param value is empty`);
        break;
      case `match`:
        const regex = new RegExp(expectedPattern);
        worldContext.assert.match(
          actualValue,
          regex,
          `The [` + actualParamName + `] param value does not match expected number format`
        );
        break;
      default: {
        const message: string =
          `Assertion type [` +
          assertionType +
          `] is not found/supported.` +
          `\n\tUpdate your ` +
          planFileName +
          ` proposal JSON file or respective step definition`;
        throw new Error(message);
      }
    }
  }
}

async function getProposalWorkbook(worldContext): Promise<WorkBook> {
  const downloadedFilePath = path.join(process.cwd(), 'testData', 'downloads', worldContext.proposalFileName);
  await worldContext.fileSystem.waitForFileToExist(downloadedFilePath);
  return await worldContext.excelHelper.getExcelWorkbookFromFile(downloadedFilePath);
}
