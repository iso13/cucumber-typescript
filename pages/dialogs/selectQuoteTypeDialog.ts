import { by, Locator } from 'protractor';
import BaseDialog from './baseDialog';

export class SelectQuoteTypeDialog extends BaseDialog {
  // This locator is very slow and should be replaced
  public quoteTypeString: string =
    "//div[contains(@class, 'option-description text-center ng-binding') and text() = 'XXXXX']/..";

  public async clickQuoteType(quoteType: string) {
    let locator: Locator = by.xpath(this.quoteTypeString.replace('XXXXX', quoteType));
    await this.clickElement(locator);
  }
}
