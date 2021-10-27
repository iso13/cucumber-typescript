import { minimumLivesCensusDialog } from '../../pages/dialogs/otherCensusDialogs/minimumLivesCensusDialog';
import { Then } from 'cucumber';

const minimumLivesCensusDlg: minimumLivesCensusDialog = new minimumLivesCensusDialog();

Then('warning dialog about low number of employees should appear', async function() {
  await minimumLivesCensusDlg.waitForDialogtoDisplay();
});

Then('warning dialog about low number of employees should contain the message:', async function(dataTable) {
  const data = dataTable.raw();
  const actualErrorMessage: string = await minimumLivesCensusDlg.getElementText(
    minimumLivesCensusDlg.censusErrorMessage
  );
  this.assert.include(actualErrorMessage, data[0]);
});

Then(/^I "(.+)" the changes on the warning dialog$/, async function(buttonSelected: string) {
  await minimumLivesCensusDlg.waitForDialogtoDisplay();
  if (buttonSelected.match('Undo')) {
    await minimumLivesCensusDlg.undoError();
  } else {
    await minimumLivesCensusDlg.acceptError();
  }
});

Then(/^the dialog should contain the invalidated products$/, async function(dataTable: any) {
  const expectedProducts: string[] = dataTable.raw() as Array<string>;
  const actualProducts: string = await minimumLivesCensusDlg.getElementText(minimumLivesCensusDlg.productList);
  expectedProducts.forEach(expectedProduct => {
    this.assert.include(actualProducts, expectedProduct);
  });
});
