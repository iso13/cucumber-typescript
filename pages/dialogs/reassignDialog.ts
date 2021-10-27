import { by, Locator } from 'protractor';
import BaseDialog from './baseDialog';

export class reassignDialog extends BaseDialog {
  public readonly undoButton: Locator = by.id('action-cancel');
  public readonly okBtnLocator: Locator = by.id('action-ok');

  public readonly reassignDialogDialog = by.xpath("//md-dialog[contains(@class,'_md md-transition-in')]");

  public async waitForDialogToDisplay() {
    await this.waitForElementVisibilityWithLocator(this.reassignDialogDialog);
  }

  public async acceptReassign() {
    await this.clickElement(this.okBtnLocator);
  }
  public async undoReassign() {
    await this.clickElement(this.undoButton);
  }
}
