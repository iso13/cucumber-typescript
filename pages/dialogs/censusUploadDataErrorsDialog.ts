import BaseDialog from './baseDialog';
import { Locator, by } from 'protractor';

export class CensusUploadDataErrorsDialog extends BaseDialog {
  public readonly dialogLocator: Locator = by.css("md-dialog[aria-label^='Data Errors']");
  public readonly closeBtnLocator: Locator = by.css("button[ng-click='vm.hide()']");
}
