import BaseDialog from './baseDialog';
import { Locator, by, element } from 'protractor';

export class DeclineToQuoteDialog extends BaseDialog {
  public readonly productCheckbox: string = `//md-checkbox[@aria-label='{productFullName}']`;
  public readonly reasonCodeDropDown: Locator = by.id('dtq-dialog-select-reason-codes');
  public readonly reasonCodeOption: Locator = by.id('dtq-dialog-QT');
  public readonly declineToQuoteNoteField: Locator = by.id('dtq-dialog-notes');
  public readonly dtqsubmitBtn: Locator = by.id('dtq-dialog-submit');

  public async selectProductToDecline(product: string) {
    const productChbxLocator: Locator = by.xpath(this.productCheckbox.replace(`{productFullName}`, product));
    await this.clickElement(productChbxLocator);
  }

  public async submitDeclineToCodeReason(reasonCode: string, note: string) {
    await this.clickElement(this.reasonCodeDropDown);
    await this.clickDropdownOptionExactMatch(reasonCode);
    await this.sendKeys(this.declineToQuoteNoteField, note);
    await this.clickElement(this.dtqsubmitBtn);
  }

  public async isProductLineDeclined(product: string): Promise<boolean> {
    const productChbxLocator: Locator = by.xpath(this.productCheckbox.replace(`{productFullName}`, product));
    const result: string = await element(productChbxLocator).getAttribute('disabled');
    if (result === 'true') {
      return true;
    }
    return false;
  }
}
