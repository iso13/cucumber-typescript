import { Locator, by, element, ElementFinder } from 'protractor';
import BasePage from './basePage';

export class GroupHomePage extends BasePage {
  public readonly headerLocator: Locator = by.xpath("//div[@class='saved-quotes']//h2");
  public readonly savedQuoteCardsButton: Locator = by.tagName('saved-quote-card');
  /**
   * @deprecated create an instance of QuoteCard class instead
   * and use quoteName element of the detailed side of a quote card
   */
  public readonly savedQuoteCardsTitle: Locator = by.css('#quoteName span');
  public readonly newQuoteBtnLocator: Locator = by.id('action-new-quote');
  public readonly bcrQuoteBtnLocator: Locator = by.id('action-benefit-comparison');
  public readonly createProposalLocator: Locator = by.xpath(
    "//button[@id='action-create-new-proposal' or @id='navigate-to-create-proposal']"
  );
  public readonly groupMenuOptionsLocator: Locator = by.css('#group-navigation-main>a>span');

  public async getNavigationMenuOptions(): Promise<string[]> {
    let menuOptions: string[] = [];
    let menuOptionsElementList: ElementFinder[] = await element.all(this.groupMenuOptionsLocator);
    for (let index = 0; index < menuOptionsElementList.length; index++) {
      let menuOptionElement: ElementFinder = menuOptionsElementList[index];
      let option: string = await menuOptionElement.getText();
      menuOptions.push(option);
    }
    return menuOptions;
  }
}
