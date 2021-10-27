import BaseDialog from './baseDialog';
import { by, Locator } from 'protractor';

export class GroupProfileErrorDialog extends BaseDialog {
  public readonly errorMessage: Locator = by.xpath(`//md-dialog//div[contains(@ng-repeat, 'errorArray')]`);
}
