import { by, Locator } from 'protractor';
import BaseDialog from './baseDialog';

export class CheckPlanAvailabilityDialog extends BaseDialog {
  public readonly dialogLocator: Locator = by.css("md-dialog[aria-label^='Check Plan Availability']");
  public readonly continueButton: Locator = by.css("button[ng-click='vm.confirm()']");
  public readonly generateQuotesButton: Locator = by.id('action-generate-quotes');

  public async isDialogDisplayed() {
    return await this.isVisible(this.dialogLocator);
  }
}
