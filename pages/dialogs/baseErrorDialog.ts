import BaseDialog from './baseDialog';
import { Locator, by } from 'protractor';

export class BaseErrorDialog extends BaseDialog {
  public readonly dialogTitle: Locator = by.css('.md-title');
  public readonly dialogMessage: Locator = by.css('.md-dialog-content-body');

  public async getDialogTitle(): Promise<string> {
    return await this.getElementText(this.dialogTitle);
  }

  public async getDialogMessage(): Promise<string> {
    return await this.getElementText(this.dialogMessage);
  }
}
