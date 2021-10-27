import { Locator, by } from 'protractor';
import BasePage from './basePage';

export class SelectPlansPage extends BasePage {
  public readonly selectAllCheckboxLocator: Locator = by.id('select-plans-Select-All');
  public quoteNameInputString: string = "input[name='XXXXX-quote-name']";
  public readonly continueButton: Locator = by.xpath("//span[contains(text(),'Continue')]");

  public selectPlanCheckbox(planName: string): Locator {
    return by.css(`md-checkbox[id='select-plan-` + planName + `']`);
  }

  public async setQuoteName(productLine: string, quoteName: string) {
    let quoteNameInputLocator: Locator = by.css(this.quoteNameInputString.replace('XXXXX', productLine));
    await this.sendKeys(quoteNameInputLocator, quoteName);
  }
}
