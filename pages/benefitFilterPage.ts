import { $, ElementFinder, Locator, by, element } from 'protractor';
import BasePage from './basePage';
import { linkSync, link } from 'fs';
import { Discovery } from 'aws-sdk';
import _ = require('lodash');

export class BenefitFilterPage extends BasePage {
  public readonly pricingComparisonButton: Locator = by.xpath(
    "//button//span[contains(text(),'+ Pricing Comparison')]"
  );
  public readonly nextButton: Locator = by.css('#action-Next > button');
  public readonly addAllPlansButton: Locator = by.id('action-add-all');
  public readonly saveQuoteButton: Locator = by.id('action-save-quote');
  public readonly filterPageTitle: ElementFinder = $('h3.title');
  public readonly loadingDialog: Locator = by.css('.loading-dialog');

  public async clickPackageToQuote(packageName: string) {
    var locations = await element
      .all(by.xpath("//md-card[@class='marketplace-card layout-padding _md']"))
      .filter(async function(elem, index) {
        const text = await elem.getAttribute('innerText');
        return text.replace(/[\n\r]+/g, '') === packageName;
      })
      .click();
  }
}
