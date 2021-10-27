import { by, Locator, ElementFinder } from 'protractor';
import BaseDialog from './baseDialog';

export class TierMappingDialog extends BaseDialog {
  public readonly finishButton: Locator = by.id('action-finish');
  public readonly tierMappingTitle: Locator = by.css('md-dialog-content h2');
  public readonly everyTierName: Locator = by.css(`div.value-map > p`);
  public readonly skipButton: Locator = by.id('action-skip');

  public async setTierSelection(tierCode: string, mapToValue: string) {
    const selectionDropdownString: string = `//p[text()='` + tierCode + `']/following-sibling::md-select`;
    const dropdownOptionString: string = `div.md-active md-option[value='` + mapToValue + `']`;
    await this.clickElement(by.xpath(selectionDropdownString));
    await this.clickElement(by.css(dropdownOptionString));
  }

  public async getAllDisplayedTierCodes(): Promise<string[]> {
    let tierCodes: string[] = [];
    const allTierCodeElements: ElementFinder[] = await this.getElements(this.everyTierName);
    for (let tierCodeElement of allTierCodeElements) {
      const tierCode: string = await this.getElementFinderText(tierCodeElement);
      tierCodes.push(tierCode);
    }
    return tierCodes;
  }
}
