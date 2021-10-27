import { Locator, by, element, ElementFinder } from 'protractor';
import BasePage from '../basePage';

export class QuoteCard extends BasePage {
  public readonly allQuoteCards = by.css(`saved-quote-card`);
  public quoteCard: ElementFinder;

  /***************************
   * Detailed side of the card
   **************************/
  public readonly detailedSide: Locator = by.css(`flippy-back`);
  private readonly quoteNameInput: Locator = by.css(`input.quote-name`);
  private readonly quoteNameParamValue: Locator = by.css(`#quoteName span`);
  private readonly totalCostValue: Locator = by.css(`div[ng-if*='showTotalCost'] .cost`);
  private readonly totalCostLabel: Locator = by.css(`div[ng-if*='showTotalCost'] .cost-label`);
  private readonly viewRatesLink: Locator = by.css(`a[ng-click*='showRates']`);

  /***************************
   * Overview side of the card
   **************************/
  private readonly overviewSide: Locator = by.css(`flippy-front`);
  private readonly declinedQuoteIndicator: Locator = by.xpath('//div[@class="declined ng-scope"]');
  private readonly quoteMenuLocator: Locator = by.css('#action-open-quote-menu-overview');

  public async isQuoteCardDisplayed(nameToLookFor: string): Promise<boolean> {
    const allQuoteCards: ElementFinder[] = await this.getElements(this.allQuoteCards);
    for (let quoteCard of allQuoteCards) {
      const currentName: string = await quoteCard
        .element(this.detailedSide)
        .element(this.quoteNameInput)
        .getAttribute('value');
      if (currentName === nameToLookFor) {
        this.quoteCard = quoteCard;
        return true;
      }
    }
    return false;
  }

  public async getQuoteCardParameter(cardSideLocator: Locator, quoteParamLocator: Locator): Promise<string> {
    const quoteParam: ElementFinder = await this.quoteCard.element(cardSideLocator).element(quoteParamLocator);
    return await this.getElementFinderText(quoteParam);
  }

  public async isParameterDisplayed(paramName: string): Promise<boolean> {
    const paramNamePattern: string = `//span[starts-with(text(),'{{paramName}}')]`;
    const paramNameLocator: Locator = by.xpath(paramNamePattern.replace(`{{paramName}}`, paramName));
    const paramNameElement: ElementFinder = await this.quoteCard.element(this.detailedSide).element(paramNameLocator);
    return await this.isElementFinderVisible(paramNameElement);
  }

  public async getParameterValue(paramName: string): Promise<string> {
    const paramValuePattern: string = `//div[./span[starts-with(text(),'{{paramName}}')]]/span[@id]`;
    const paramValueLocator: Locator = by.xpath(paramValuePattern.replace(`{{paramName}}`, paramName));
    const paramValue: ElementFinder = await this.quoteCard.element(this.detailedSide).element(paramValueLocator);
    return await this.getElementFinderText(paramValue);
  }

  public async isDialogParameterDisplayed(paramName: string): Promise<boolean> {
    const paramNamePattern: string = `//md-dialog//th[starts-with(text(),'{{paramName}}')]`;
    const paramNameLocator: Locator = by.xpath(paramNamePattern.replace(`{{paramName}}`, paramName));
    return await this.isVisible(paramNameLocator);
  }

  public async getDialogParameterValue(paramName: string): Promise<string> {
    const paramValuePattern: string = `//md-dialog//th[starts-with(text(),'{{paramName}}')]/following-sibling::td`;
    const paramValueLocator: Locator = by.xpath(paramValuePattern.replace(`{{paramName}}`, paramName));
    return await this.getElementText(paramValueLocator);
  }

  public async getTierCountValue(tierName: string): Promise<string> {
    const countValuePattern: string = `//span[starts-with(text(),'{{tierName}}')]/span[contains(@ng-if, 'showLives')]`;
    const tierValueLocator: Locator = by.xpath(countValuePattern.replace(`{{tierName}}`, tierName));
    const tierValue: ElementFinder = await this.quoteCard.element(this.detailedSide).element(tierValueLocator);
    return await this.getElementFinderText(tierValue);
  }

  public async isTotalCostDisplayed(): Promise<boolean> {
    return await this.isElementFinderVisible(
      await this.quoteCard.element(this.detailedSide).element(this.totalCostValue)
    );
  }

  public async clickViewRatesLink(): Promise<void> {
    const viewRatesLink: ElementFinder = await this.quoteCard.element(this.detailedSide).element(this.viewRatesLink);
    await this.clickElementFinder(viewRatesLink);
  }

  public async getTotalCostLabel(): Promise<string> {
    return await this.getElementFinderText(
      await this.quoteCard.element(this.detailedSide).element(this.totalCostLabel)
    );
  }

  public async getTotalCostValue(): Promise<string> {
    return await this.getElementFinderText(
      await this.quoteCard.element(this.detailedSide).element(this.totalCostValue)
    );
  }

  public async isQuoteCardDeclined(): Promise<boolean> {
    return await element(this.declinedQuoteIndicator).isPresent();
  }

  public async isQuoteCardActionable(): Promise<boolean> {
    return await element(this.quoteMenuLocator).isEnabled();
  }
}
