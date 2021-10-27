import { When, Then } from 'cucumber';
import { SelectCountyDialog } from '../../pages/dialogs/selectCountyDialog';

const selectCountyDialog: SelectCountyDialog = new SelectCountyDialog();

Then(/^the "Select County" dialog pops up$/, async function() {
  const isVisible: boolean = await selectCountyDialog.isVisible(selectCountyDialog.selectCountyDialogLocator);
  this.assert.isTrue(isVisible, `"Select County" dialog doesn't display`);
});

Then(/^Select County dropdown has "(.+)" counties available for selection$/, async function(expected: string) {
  const expectedCounties: Array<string> = this.testData.convertStringToArray(expected);
  await selectCountyDialog.clickElement(selectCountyDialog.selectCountyDropDownLocator);
  const actualCountes: string[] = await selectCountyDialog.getCountyMenuOptions();

  this.assert.strictEqual(
    actualCountes.length,
    expectedCounties.length,
    `The number of available counties differs from expected number of counties`
  );

  for (let actualCounty of actualCountes) {
    this.assert.include(
      expectedCounties,
      actualCounty,
      actualCounty + `is not found in the list of expected counties: `
    );
  }
});

When(/^I select "(.+)" county in the multi-county dialog$/, async function(county: string) {
  await selectCountyDialog.clickElement(selectCountyDialog.selectCountyDropDownLocator);
  await selectCountyDialog.clickDropdownOption(county);
  await selectCountyDialog.clickElement(selectCountyDialog.doneBtnLocator);
});
