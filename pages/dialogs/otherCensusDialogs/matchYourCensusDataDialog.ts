import { by, Locator } from 'protractor';
import BaseDialog from '../baseDialog';

export class MatchYourCensusDataDialog extends BaseDialog {
  public readonly nextButton = by.id(`action-finish`);
  public readonly cancelButton = by.id(`action-cancel`);
  public readonly selectDOBFormatLocator = by.css("md-select[ng-model='column.format']");
  private readonly selectionToIdMapping: Map<string, string> = new Map([
    ['first name', 'first_name'],
    ['last name', 'last_name'],
    ['first/last name', 'first_last_name'],
    ['last/first name', 'last_first_name'],
    ['date of birth', 'dob'],
    ['age', 'age'],
    ['gender', 'sex'],
    ['salary', 'w2_income'],
    ['state', 'region'],
    ['dental election', 'coverage_codes.1'],
    ['vision election', 'coverage_codes.2'],
    ['salary mode', 'salary_mode'],
    ['skip column', 'skip'],
    ['address 1', 'address_1'],
    ['address 2', 'address_2'],
    ['phone', 'phone_number'],
    ['email', 'email'],
    ['all', 'class_number']
  ]);

  public async skipColumns(columnsToSkip: string[]) {
    for (let columnName of columnsToSkip) {
      const skipBtnLocatorStr: string = `//p[contains(text(),'{column_name}')]/../preceding-sibling::div/button`;
      const skipBtnLocator: Locator = by.xpath(skipBtnLocatorStr.replace(`{column_name}`, columnName));
      await this.clickElement(skipBtnLocator);
    }
  }

  public async setColumnSelection(columnData: any) {
    for (let column of columnData) {
      if (column.mappingKey) {
        const selectDropdownStr: string = `//p[contains(text(),'{column_name}')]/../preceding-sibling::div/md-select`;
        const selectDropdownLocator: Locator = by.xpath(selectDropdownStr.replace('{column_name}', column.columnName));
        await this.clickElement(selectDropdownLocator);

        if (this.selectionToIdMapping.has(column.mappingKey)) {
          const dropdownOptionId: string = this.selectionToIdMapping.get(column.mappingKey);
          const dropdownOptionLocator: string = `div.md-select-menu-container.md-active md-option[value='{option_id}']`;
          const dropdownOption: Locator = by.css(dropdownOptionLocator.replace(`{option_id}`, dropdownOptionId));
          await this.clickElement(dropdownOption);
        } else {
          throw new Error(
            `Mapping key [` +
              column.mappingKey +
              `] is not supported by [` +
              MatchYourCensusDataDialog.name +
              `]. Set the correct key in your test data json file or add new key to 'selectionToIdMapping' map`
          );
        }
      }
      if (column.columnName.toLowerCase().includes('date of birth') && column.format) {
        await this.selectDateOfBrithFormat('MM/DD/YYYY');
      }
    }
  }

  private async selectDateOfBrithFormat(dobFormat: string) {
    await this.clickElement(this.selectDOBFormatLocator);
    await this.clickDropdownOption(dobFormat);
  }
}
