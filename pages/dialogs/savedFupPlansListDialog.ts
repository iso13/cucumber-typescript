import { by, Locator, element } from 'protractor';
import BaseDialog from './baseDialog';

export class SavedFupPlansListDialog extends BaseDialog {
  public readonly allSavedFupPlansLocator = by.css('.align-left.adjusted-medium');
  public readonly savedFupDialogPopLocator = by.css('.add-frequent-plans-modal');
  public allSavedFupPlan: string = "//tr[@class='frequent-plans-row ng-scope']/td[2][contains(text(),'XXXXX')]";

  public readonly savedFUPDialogCancelBtnLocator = by.css('#freq-plan-modal-cancel');

  public readonly deleteFUP: string = 'delete-freq-plan-XXXXX';

  public readonly savedFUPPlanLocator = by.css('.frequent-plans-row:first-child td.align-left.adjusted-medium');

  public async clickDeleteFupPlanBtn(planName: string) {
    let locator: Locator = by.id(this.deleteFUP.replace('XXXXX', planName));
    await this.clickElement(locator);
  }

  public async clickCancelBtn() {
    await this.clickElement(this.savedFUPDialogCancelBtnLocator);
  }
}
