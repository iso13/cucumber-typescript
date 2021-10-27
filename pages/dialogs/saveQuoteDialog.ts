import { by, Locator } from 'protractor';
import BaseDialog from './baseDialog';
import * as moment from 'moment';

export class SaveQuoteDialog extends BaseDialog {
  public readonly quoteNames = [];
  public readonly saveQuoteButton: Locator = by.css("button[ng-click='vm.save()']");
  public readonly quoteNameInputLocator: Locator = by.model('vm.name');

  public async setQuoteName(quoteType: string, benefitType: string) {
    let timestamp = await moment().format('MDYYYYHHmmss');
    let quoteName = quoteType + '_' + benefitType + '_' + (await timestamp);
    this.quoteNames.push(quoteName);
    await this.sendKeys(await this.quoteNameInputLocator, quoteName);
  }
}
