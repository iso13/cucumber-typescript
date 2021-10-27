import { by, Locator } from 'protractor';
import BaseDialog from './baseDialog';

export class AddClassDialog extends BaseDialog {
  public readonly classNumberFld: Locator = by.css(`#class-management-dialog-form-number`);
  public readonly classDescriptionFld: Locator = by.css(
    `class-management-dialog #class-management-dialog-form-description`
  );
  public readonly saveBtn: Locator = by.css(`#class-management-dialog-save`);
  public readonly cancelBtn: Locator = by.css(`#class-management-dialog-cancel`);
}
