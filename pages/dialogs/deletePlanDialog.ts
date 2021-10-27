import { by, Locator } from 'protractor';
import BaseDialog from './baseDialog';

export class DeletePlanDialog extends BaseDialog {
  public readonly deletePlanBtn: Locator = by.css('button[ng-click="dialog.hide()"]');
  public readonly cancelBtn: Locator = by.css('button[ng-click="dialog.abort()"]');
}
