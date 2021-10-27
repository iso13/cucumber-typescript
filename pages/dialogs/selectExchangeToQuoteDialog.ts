import { by, Locator } from 'protractor';
import BaseDialog from './baseDialog';

export class SelectExchangeToQuoteDialog extends BaseDialog {
  public exchangeToQuoteString = 'action-toggleett-XXXXX';
  public readonly nextButtonModal: Locator = by.xpath("//span[contains(text(),'next')]");

  public async clickExchangeToQuote(exchangeName: string) {
    let locator: Locator = by.id(this.exchangeToQuoteString.replace('XXXXX', exchangeName));
    await this.clickElement(locator);
  }
}
