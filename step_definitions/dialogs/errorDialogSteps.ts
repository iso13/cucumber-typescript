import { Then } from 'cucumber';
import { BaseErrorDialog } from '../../pages/dialogs/baseErrorDialog';

const errorDialog: BaseErrorDialog = new BaseErrorDialog();

Then(/^I should see an error dialog with the following message$/, async function(dataTable) {
  const expectedErrorMessage: string = String(dataTable.raw()[0]);
  const actualErrorMessage: string = await errorDialog.getDialogTitle();
  this.assert.equal(actualErrorMessage, expectedErrorMessage);
});
