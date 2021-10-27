import { Locator, by, element, ElementFinder } from 'protractor';
import BaseDialog from '../baseDialog';

export class SelectYourHeaderRowDialog extends BaseDialog {
  public readonly selectHeaderTableRowLocator: Locator = by.tagName('tr');
  public readonly nextButton = by.id('action-finish');
  public readonly selectRowDropDown: Locator = by.css('#action-select-value');

  public async setHeaderRow(rowNumber: number) {
    let rows: ElementFinder[] = await element.all(this.selectHeaderTableRowLocator);
    await this.clickElementFinder(rows[rowNumber - 1]);
  }

  public async clickSelectHeaderRowDropDown(value: string) {
    await this.clickElement(this.selectRowDropDown);
    await this.clickElement(by.css("md-select-menu[role=presentation]  md-option[value='" + value + "']"));
    await this.clickElement(this.nextButton);
  }
}
