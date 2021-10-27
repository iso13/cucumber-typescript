import { by, Locator, element, ElementFinder } from 'protractor';
import BaseDialog from './../baseDialog';

export default class UnsupportedBrowserDialog extends BaseDialog {
  public readonly dialogLocator: Locator = by.css("md-dialog[aria-label='Experience Dialog']");
  public readonly continueButton: Locator = by.css("md-dialog[aria-label='Experience Dialog'] button");

  public async isDialogDisplayed() {
    return this.isVisible(this.dialogLocator);
  }
  public async clickOkBtn() {
    return this.clickElement(this.continueButton);
  }
}
