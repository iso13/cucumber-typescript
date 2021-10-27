import { by } from 'protractor';
import BaseDialog from './baseDialog';

export class AddFUPDialog extends BaseDialog {
  public readonly addFUPButtonLocator = by.css('#update-freq-plan-name-save');
  public readonly cancelButtonLocator = by.css('#update-freq-plan-name-cancel');
  public readonly planNameInputLocator = by.css('input#update-freq-plan-name');
  public readonly okBtnOnFupPopupLocator = by.css('button#update-freq-plan-save-ok');
}
