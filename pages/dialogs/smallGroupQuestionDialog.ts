import { by, Locator } from 'protractor';
import BaseDialog from './baseDialog';

export class SmallGroupQuestionDialog extends BaseDialog {
  public readonly dialogLocator: Locator = by.xpath("//md-dialog[@aria-label='CancelLoading ...Save']");
  public readonly yesOption: Locator = by.css(`[id$='is_small_group'] > md-radio-button[aria-label='Yes']`);
  public readonly noOption: Locator = by.css(`[id$='is_small_group'] > md-radio-button[aria-label='No']`);
  public readonly cancelButton: Locator = by.id('action-cancel');
  public readonly saveButton: Locator = by.xpath("//button[@id='action-done']");
}
