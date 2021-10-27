import BaseDialog from './baseDialog';
import { Locator, by } from 'protractor';

export class InvalidOrMissingDataDialog extends BaseDialog {
  public readonly dialogLocator: Locator = by.css("md-dialog[aria-label='Invalid or Missing Data']");

  public async checkTheDialogIsNotDisplaying() {
    await this.waitForElementNotPresentLocator(this.dialogLocator);
  }
}
