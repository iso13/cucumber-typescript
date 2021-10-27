import { Locator, by } from 'protractor';
import BasePage from './basePage';

export class CurrentAndRenewalMedicalPage extends BasePage {
  public readonly createPublishedButton: Locator = by.css("button[ng-click='vm.createQuote()']");
  public readonly createCustomButton: Locator = by.css("button[ng-click='vm.goToPlanDesignerView()']");
  public readonly savedQuoteCardsButton: Locator = by.tagName('saved-quote-card');
}
