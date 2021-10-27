import { Locator, by } from 'protractor';
import BasePage from './basePage';

export class QuotesHomePage extends BasePage {
  public readonly pcrQuoteBtnLocator: Locator = by.partialButtonText('+ Pricing Comparison');
  public readonly bcrQuoteBtnLocator: Locator = by.partialButtonText('+ Benefit Comparison');
  public readonly createProposalLocator: Locator = by.id('action-create-new-proposal');
}
