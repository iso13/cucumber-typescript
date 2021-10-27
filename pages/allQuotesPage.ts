import { $, element, ElementFinder, Locator, by } from 'protractor';
import BasePage from './basePage';

export class AllQuotesPage extends BasePage {
  public readonly pricingComparisonButton: Locator = by.xpath(
    "//button//span[contains(text(),'+ Pricing Comparison')]"
  );
  public readonly BenefitComparisonButton: Locator = by.xpath(
    "//button//span[contains(text(),'+ Benefit Comparison')]"
  );
  public readonly hamburgersMenuQuoteCard: Locator = by.id('action-open-quote-menu-overview');
  public readonly quotePricingCost: Locator = by.className('cost ng-binding');
  public readonly quoteCardName: Locator = by.xpath("//input[contains(@class, 'quote-name')]");
  public readonly quoteCard: Locator = by.css("md-grid-tile[role='listitem']");
  public readonly createProposalButton: Locator = by.id('navigate-to-create-proposal');

  public async isCreateProposalDisabled(): Promise<boolean> {
    return (await element(this.createProposalButton).getAttribute('disabled')) === 'true';
  }

  public async getQuoteCardsNameAndPrice() {
    let quoteCardData: Array<string> = [];
    const quoteCardsNameElements = await this.getElements(this.quoteCardName);
    const quoteCardsPriceElements = await this.getElements(this.quotePricingCost);
    for (const i in quoteCardsNameElements) {
      // Get the quote name and price values from the quote card (Every quote name and price has 2 locators that is the
      // reason for the 2* multiplier)
      quoteCardData.push(
        await quoteCardsNameElements[2 * +i].getAttribute('value'),
        await quoteCardsPriceElements[2 * +i].getText()
      );
      if (+i == 2) {
        break;
      }
    }
    return quoteCardData;
  }

  public async getQuoteCardsTierRates() {
    let quoteCardTierRates: Array<string> = [];
    const quoteCards = await this.getElements(this.quoteCard);
    for (let card of quoteCards) {
      let cardData = (await card.getText()).split('\n');
      let rateIndexStart = cardData.indexOf('EE (1 Lives)');
      if (rateIndexStart != -1) {
        quoteCardTierRates.push(cardData[3]);
        for (let i = 0; i <= 3; i++) {
          quoteCardTierRates.push(cardData[rateIndexStart + 2 * i], cardData[rateIndexStart + 2 * i + 1]);
        }
      }
    }
    return quoteCardTierRates;
  }
}
