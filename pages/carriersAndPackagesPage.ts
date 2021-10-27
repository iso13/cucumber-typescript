import { Locator, by, element, ElementFinder } from 'protractor';
import BasePage from './basePage';

export class CarriersAndPackagesPage extends BasePage {
  private carrierCardLocatorText: string = "div > md-card[aria-label='XXXXX']";
  private packageCardLocatorText: string = "//md-card[.//span[text()='XXXXX']]";

  public async clickCarrierPackageCard(carrierName: string) {
    let locator: Locator = by.css(this.carrierCardLocatorText.replace('XXXXX', carrierName));
    let carrierCardElement: ElementFinder = await element(locator);
    await this.clickElementFinder(carrierCardElement);
  }

  public async clickPackageCard(packageName: string) {
    let locator: Locator = by.xpath(this.packageCardLocatorText.replace('XXXXX', packageName));
    let packageCardElement: ElementFinder = await element(locator);
    await this.clickElementFinder(packageCardElement);
  }
}
