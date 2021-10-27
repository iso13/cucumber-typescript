import { Locator, by, element } from 'protractor';
import BasePage from './basePage';
import { debug } from 'util';

export class RecentQuotePage extends BasePage {
  public readonly viewAllBtnLocator: Locator = by.id('action-view-all-quotes');

  public async isQuoteCardPresent(quoteName: string) {
    await this.clickElement(this.viewAllBtnLocator);
    var isNameFound = await element(by.cssContainingText('span[id=quoteName]', quoteName)).isPresent();
    return isNameFound;
  }
}
