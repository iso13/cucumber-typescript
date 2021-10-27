import { ElementFinder, Locator, by } from 'protractor';
import BasePage from './basePage';

export class ReviewQuotesForProposalPage extends BasePage {
  public readonly selectQuoteCardLocator: Locator = by.xpath('//flippy[@class="fancy flipped"]');
  public readonly unSoldQuoteCardLocator: Locator = by.xpath(
    '//flippy-front/div[@id="action-select-card-overview"][not(contains(@class,"selected"))]'
  );
  public readonly quoteCardNameLocator: Locator = by.xpath(
    '//input[@class="quote-name save-quote-name ng-pristine ng-untouched ng-valid md-input ng-not-empty"]'
  );
  public readonly tooltipLocator: Locator = by.css('md-tooltip span[class="ng-binding ng-scope"]');
  public readonly nextButtonLocator: Locator = by.css('.proposal-action-bar #action-proposal-next');
  public readonly saveButtonLocator: Locator = by.css("button[ng-click='vm.next()']");
  public readonly errorDialogLocator: Locator = by.xpath("//div[@class='ng-binding ng-scope']");
  public readonly nextOnCartButton: Locator = by.id('action-proceed');

  public async getQuoteCardNames(): Promise<string[]> {
    const quoteNameElements: ElementFinder[] = await this.getElements(this.quoteCardNameLocator);
    let quoteNames: string[] = new Array();
    for (const quoteNameElement of quoteNameElements) {
      const quoteName: string = await quoteNameElement.getAttribute('value');
      //The quote tiles "flip" so the locator for each quote name appears on the page twice
      if (quoteNames.indexOf(quoteName) === -1) {
        quoteNames.push(quoteName);
      }
    }
    return quoteNames;
  }
}
