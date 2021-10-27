import { by, element, Locator } from 'protractor';
import BaseDialog from './baseDialog';

export class SelectProductToQuoteDialog extends BaseDialog {
  public async clickProductToQuote(productLine: string) {
    const productBtnString: string = 'action-toggle-{product}';
    const productBtnLoadingStr: string = `//button[@id='action-toggle-{product}'][//icon[contains(@class,'loading')]]`;
    const productBtnSelectedStr: string = `//button[@id='action-toggle-{product}'][//icon[@class='disabled ng-scope ng-isolate-scope icon-selected']]`;

    const productBtn: Locator = by.id(productBtnString.replace('{product}', productLine));
    const productBtnLoading: Locator = by.xpath(productBtnLoadingStr.replace('{product}', productLine));
    const productBtnSelected: Locator = by.xpath(productBtnSelectedStr.replace('{product}', productLine));

    await this.waitForElementNotPresentLocator(productBtnLoading);
    await this.clickElement(productBtn);
    await element(productBtnSelected).isPresent();
  }
}
