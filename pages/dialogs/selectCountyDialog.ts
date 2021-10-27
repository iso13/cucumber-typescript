import { by, Locator, ElementFinder, element } from 'protractor';
import BaseDialog from './baseDialog';

export class SelectCountyDialog extends BaseDialog {
  public readonly selectCountyDialogLocator: Locator = by.xpath("//md-dialog[@aria-label='select County']");
  public readonly selectCountyDropDownLocator: Locator = by.css('county-modal-row md-select');
  public readonly doneBtnLocator: Locator = by.xpath("//button[@ng-click='vm.ok()']");
  public countyDropDownFirstOptionLocator: Locator = by.xpath(
    "//div[@class='md-select-menu-container md-active md-clickable']//md-option[1]"
  );

  public async getCountyMenuOptions(): Promise<string[]> {
    let countyOptions: string[] = [];
    const countyOptionsElementList: ElementFinder[] = await this.getDropdownOptionElements();
    for (let countyOptionElement of countyOptionsElementList) {
      let optionText: string = await countyOptionElement.getAttribute('value');
      countyOptions.push(optionText);
    }
    return countyOptions;
  }
}
