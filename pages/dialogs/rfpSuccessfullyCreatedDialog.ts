import BaseDialog from './baseDialog';
import { by, Locator } from 'protractor';

export class RFPSuccessfullyCreatedDialog extends BaseDialog {
  public readonly okBtn: Locator = by.xpath('//md-dialog//button');
}
