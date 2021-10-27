import { by, Locator } from 'protractor';
import BaseDialog from './baseDialog';

export class DeleteEmployeeDialog extends BaseDialog {
  public readonly deleteEmployeeDialogLocator: Locator = by.xpath("//md-dialog[@aria-label='Are You Sure?']");
  public readonly yesButton: Locator = by.css("button[ng-click='dialog.hide()']");
  public readonly cancelButton = by.css('button[dialog.abort()]');
}
