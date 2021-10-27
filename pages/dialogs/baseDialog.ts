import BasePage from '../basePage';
import { browser, element, Locator, by, ElementFinder, protractor } from 'protractor';
export default abstract class BaseDialog extends BasePage {
  /**
   * Improvement:
   * We could make this generic and be able to pass in the text.
   * So then any button can be clicked by text(This is a blue harvest like approach)
   */
  private readonly navigationBtnLocator: string = "//button//*[text()='XXXXX']/..";

  public async clickModalNavigationBtn(option: string) {
    let dynamicXpath: string = this.navigationBtnLocator.replace('XXXXX', option);
    let optionLocator = by.xpath(dynamicXpath);
    await this.clickElement(optionLocator);
  }
}
