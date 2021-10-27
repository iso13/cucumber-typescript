import { Locator, by, element } from 'protractor';
import BasePage from './basePage';

export class UnderwritingPage extends BasePage {
  public readonly underwritingTab: Locator = by.id('group-navigate-to-underwriting');
  public readonly underwritingContent: Locator = by.css('div.underwriting-content');
  public readonly quoteTiles: Locator = by.className('quote-content');
  public readonly expandArrow: Locator = by.className('md-tile-content');
  public readonly sicField: Locator = by.id('underwriting-profile-sic-code');
  public readonly stateField: Locator = by.id('underwriting-profile-region');
  public readonly numberOfEligibleEmployeesField: Locator = by.id('underwriting-profile-total-lives');
  public readonly quoteTile: Locator = by.xpath("//md-item-content[contains(@class, 'quote-tile-content')]");
  public readonly quoteTileRatesTable: Locator = by.className('uw-rates-table-body');
  public readonly quoteTileForRatesTable: Locator = by.xpath(
    "//div[@class = 'uw-rates-table-body']/ancestor::md-item-content"
  );
  public readonly quoteTileMenu: Locator = by.css('.quote-tile:first-of-type .quote-tile-content .menu-content');
  public readonly duplicateQuoteBtn: Locator = by.css('.md-active button');
  public readonly quoteTileTitle: Locator = by.css('.quote-tile .md-tile-content.main-data .ng-binding:nth-child(1)');
  public readonly quoteTileTimestamp: Locator = by.css(
    '.quote-tile .md-tile-content.main-data .ng-binding:nth-child(2)'
  );
  public readonly quoteTileIsDeclinedIndicator: Locator = by.xpath('//span[@class="display-status ng-scope"]');
  public readonly duplicateQuoteName: Locator = by.xpath('//span[contains(text(),"Revised")]//preceding::strong');
  public readonly dtqBtn: Locator = by.id('uw-action-decline-quote');
  public readonly createProposalButton: Locator = by.id('uw-action-create-proposal');

  public async duplicateQuote(): Promise<void> {
    await this.clickElement(this.quoteTileMenu);
    await this.clickElement(this.duplicateQuoteBtn);
  }

  public async getDuplicateQuoteName(): Promise<string> {
    const quoteName: string = await this.getElementText(this.duplicateQuoteName);
    return quoteName;
  }

  public async isQuoteTileActionable(): Promise<boolean> {
    return await element(this.quoteTileMenu).isDisplayed();
  }

  public async isQuoteTileDeclined(): Promise<boolean> {
    return await element(this.quoteTileIsDeclinedIndicator).isPresent();
  }

  public async isDeclineToQuoteEnabled(): Promise<boolean> {
    return await element(this.dtqBtn).isEnabled();
  }

  public async isCreateProposalDisabled(): Promise<boolean> {
    return (await element(this.createProposalButton).getAttribute('disabled')) === 'true';
  }
}
