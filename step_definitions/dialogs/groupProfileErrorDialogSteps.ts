import { Then } from 'cucumber';
import { GroupProfileErrorDialog } from '../../pages/dialogs/groupProfileErrorDialog';

const errorDialog: GroupProfileErrorDialog = new GroupProfileErrorDialog();

Then(/^group cannot be saved, error dialog with the message "(.+)" pops up$/, async function(
  expectedErrorMessage: string
) {
  const actualErrorMessage: string = await errorDialog.getElementText(errorDialog.errorMessage);
  this.assert.include(actualErrorMessage, expectedErrorMessage);
});
