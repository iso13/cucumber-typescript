import { Locator, by, element, ElementFinder, Key } from 'protractor';
import { slow } from 'blue-harvest';
import BasePage from './basePage';

export class GroupsListDynamicTablePage extends BasePage {
  public readonly searchField: Locator = by.css("input[type='search']");
  private readonly groupsRowsLocator: Locator = by.css("tr[role='row'][class]");
  private readonly innerGroupRowsLocator: Locator = by.xpath("//*[@class='dataTable no-footer']/tbody/tr/td/div");
  public readonly actionsButtonLocator: Locator = by.xpath(
    "//button[@class='vertical-align-middle md-button md-ink-ripple']"
  );
  public readonly reassignButtonLocator: Locator = by.xpath("//button[@id='action-assign-broker']");
  public readonly deleteButtonLocator: Locator = by.xpath(
    "//div[contains(@class, 'clickable')]//md-menu-content//md-menu-item//button[@id='action-delete']"
  );
  public readonly confirmDeleteButtonLocator: Locator = by.xpath(
    "//md-dialog-actions//button//span[contains(text(),'Delete')]"
  );
  public readonly tableInfoLocator: Locator = by.xpath("//*[@class='dataTables_info']");

  public readonly columnNamePattern: String = "//md-content[@layout='column']//th[text()='{{columnName}}']";
  public groupsListingTable: Locator = by.className('group-listing-table');
  public readonly performAction: Locator = by.css('#action-perform');
  public readonly deleteGroup: Locator = by.css('div[style*="transform"] md-menu-content md-menu-item #action-delete');
  public readonly reassingGroup: Locator = by.css(
    'div[style*="transform"] md-menu-content md-menu-item #action-assign-broker'
  );
  private readonly cmbSelectStatus: Locator = by.css('.ng-pristine');
  public readonly cancelStatus: Locator = by.css(
    ' button.md-primary.md-raised.md-button.ng-scope.md-ink-ripple.layout-align-start-center.layout-column'
  );
  public readonly updateStatus: Locator = by.css(
    ' button.md-primary.md-raised.md-button.ng-scope.md-ink-ripple.layout-align-end-center.layout-column'
  );
  public readonly confirmStatus: Locator = by.css(
    'div.md-dialog-container.ng-scope > md-dialog > md-dialog-actions > button'
  );
  public readonly groupExistingLocator: string = "//*[@id='groupsTable']//tbody//tr//td//div[text()='name']";
  public readonly nestedGroupLocator: Locator = by.xpath(
    "//*[@id='groupsTable']/tbody/tr/td/div[@class='group-expand fas fa-plus']"
  );

  public readonly stateFilterLocator: Locator = by.xpath("//md-select[@id='select_3']");

  public readonly tableElementPattern: string = "//table[@id='groupsTable']/tbody/tr[{{row}}]/td[{{column}}]";
  public readonly optionPattern: string = "//md-option[@value='item']";
  public readonly tableLengthPattern: string = "//*[@id='groupsTable_length']/label/select/option[@value='item']";

  public readonly nextPageLocator: Locator = by.xpath("//*[@id='groupsTable_next']");
  public readonly previousPageLocator: Locator = by.xpath("//*[@id='groupsTable_previous']");
  public readonly idPageLocator: Locator = by.xpath("//*[@id='groupsTable_paginate']/span/a[1]");
  public readonly groupsHeadersLocator: string = "//md-content[@layout='column']//th";
  public groupsHeadersAscendingLocator: string =
    "//md-content[@layout='column']//th[@class='sorting_asc'][text()='{{columnName}}']";
  public groupsHeadersDesendingLocator: string =
    "//md-content[@layout='column']//th[@class='sorting_desc'][text()='{{columnName}}']";

  public async setColumnOrder(columnName: string, sortOrder: string) {
    const columnNameLocator: Locator = by.xpath(this.columnNamePattern.replace(`{{columnName}}`, columnName));
    await this.waitForElementPresenceLocator(columnNameLocator);
    await this.clickElement(columnNameLocator);
    const columnAscendingLocator: Locator = by.xpath(
      this.groupsHeadersAscendingLocator.replace(`{{columnName}}`, columnName)
    );
    await slow.see(columnAscendingLocator);
    if (sortOrder === 'descending') {
      await this.clickElement(columnAscendingLocator);
      const columnDesendingLocator: Locator = by.xpath(
        this.groupsHeadersDesendingLocator.replace(`{{columnName}}`, columnName)
      );
      await this.waitForElementPresenceLocator(columnDesendingLocator);
    }
  }

  public async checkColumnOrder(columnName: string, sortOrder: string) {
    const columnID = await this.getColumnId(columnName);
    const tableSize = await this.getTableSize();
    let compareTypeNum;
    if (sortOrder === 'descending') {
      compareTypeNum = 1;
    } else {
      compareTypeNum = -1;
    }
    for (let index = 0; index < tableSize - 1; index++) {
      let current = await this.getGroupElement(index + 1, columnID + 1);
      let next = await this.getGroupElement(index + 2, columnID + 1);
      //remove special characters and _ due to the way postgresql do the sort ignoring those characters
      current = current.replace(/[^\w]/gi, '').replace(/_/gi, '');
      next = next.replace(/[^\w]/gi, '').replace(/_/gi, '');
      let localCompare = current.localeCompare(next);
      if (current !== '') {
        if (next !== '') {
          if (localCompare !== 0) {
            if (localCompare !== compareTypeNum) {
              return false;
            }
          }
        }
      }
    }
    return true;
  }

  public async getColumnId(columnName: string): Promise<number> {
    const groupsHeaders = await element.all(by.xpath(this.groupsHeadersLocator));
    for (let index = 0; index < groupsHeaders.length; index++) {
      let value = await this.getElementFinderText(groupsHeaders[index]);
      if (value === columnName) {
        return index;
      }
    }
    return 0;
  }

  public async setNumberOfGroupsPerPage(size: string) {
    const lengthLocator = this.tableLengthPattern.replace('item', size);
    const lengthSelector = by.xpath(lengthLocator);
    await this.clickElement(lengthSelector);
  }

  public async selectStateFilter(state: string) {
    await this.clickElement(this.stateFilterLocator);
    let optionSelector = this.optionPattern;
    optionSelector = optionSelector.replace('item', state);
    const stateSelector = by.xpath(optionSelector);
    await this.clickElement(stateSelector);
  }

  public async getGroupElement(row: any, colum: any): Promise<string> {
    let xpathString = this.tableElementPattern;
    xpathString = xpathString.replace('{{row}}', row);
    xpathString = xpathString.replace('{{column}}', colum);
    const cellLocator = by.xpath(xpathString);
    this.waitForElementPresenceLocator(cellLocator);
    return this.getElementText(cellLocator);
  }
  public async getTableSize(): Promise<number> {
    const groupsRow = await element.all(this.groupsRowsLocator);
    return groupsRow.length;
  }

  public async getLabelSize(): Promise<number> {
    await this.isVisible(this.tableInfoLocator);
    const labelString = await this.getElementText(this.tableInfoLocator);
    const stringArray = labelString.split(' ');
    const labelNumber = Number(stringArray[3]) - Number(stringArray[1]) + 1;
    return labelNumber;
  }

  public readonly processingDialogLocator: Locator = by.id('groupsTable_processing');

  public getGroupPath(group: string): string {
    return this.groupExistingLocator.replace('name', group);
  }

  public async searchGroupAndWaitForResults(group: string) {
    await slow.see('Search:');
    await this.sendKeys(this.searchField, group + Key.ENTER);
    //search does not provide feedback while loading so a minor wait is required to get the new list instead of old one
    await this.pause(4000);
  }

  public async searchGroup(group: string) {
    await slow.see('Search:');
    await this.sendKeys(this.searchField, group);
  }

  public async cleanSearchGroup() {
    await slow.see('Search:');
    const elem = await element(this.searchField);
    await elem.clear();
    await elem.click();
    await this.sendKeys(this.searchField, Key.BACK_SPACE + Key.ENTER);
    await this.waitForElementPresenceLocator(this.groupsRowsLocator);
  }

  public async waitForGroupLoad(group: string) {
    const groupXpath = this.groupExistingLocator.replace('name', group);
    const groupLocator = by.xpath(groupXpath);
    await this.waitForElementPresenceLocator(groupLocator);
  }

  public async clickSpecificGroupLink(group: string) {
    const groupXpath = this.groupExistingLocator.replace('name', group);
    const groupLocator = by.xpath(groupXpath);
    await this.waitForElementPresenceLocator(groupLocator);
    await this.clickElement(groupLocator);
  }

  public async getFirstGroupDueDate(): Promise<string> {
    const groupsRow = await element.all(this.groupsRowsLocator).first();
    const dueDateCellLocator = by.xpath('./td[10]');
    const dueDateCellSpan = await groupsRow.element(dueDateCellLocator);
    return (await dueDateCellSpan.getText()).trim();
  }

  public async clickFirstInnerGroupLink() {
    const group = await element.all(this.innerGroupRowsLocator).first();
    await this.clickElementFinder(group);
  }

  public async clickFirstGroupLink() {
    const groupsRow = await element.all(this.groupsRowsLocator).first();
    const groupNameLink = await groupsRow.element(by.xpath('./td[2]'));
    await this.clickElementFinder(groupNameLink);
  }

  public async deleteFirstGroup() {
    await this.clickElement(this.deleteButtonLocator);
    await this.clickElement(this.confirmDeleteButtonLocator);
  }

  public async isColumnNameDisplayed(columnName: string): Promise<boolean> {
    const columnNameLocator: Locator = by.xpath(this.columnNamePattern.replace(`{{columnName}}`, columnName));
    return this.isVisible(columnNameLocator);
  }

  public async getChangeStatusGroup(strGroup: string): Promise<void> {
    const rows = await element.all(by.tagName('tr'));
    for (let i = 2; i <= rows.length; i++) {
      const cells = await rows[i]
        .all(by.tagName('td'))
        .get(1)
        .getText();
      if ((await cells) == strGroup) {
        await rows[i]
          .all(by.tagName('td'))
          .last()
          .click();
        break;
      }
    }
  }
  public async setNewStatus(status: string): Promise<void> {
    await this.clickElement(this.cmbSelectStatus);
    await this.clickDropdownOption(status);
  }
  public async getStatusGroup(strGroup: string): Promise<string> {
    await this.waitForElementPresenceLocator(by.xpath(this.getGroupPath(strGroup)));
    const rows = await element.all(by.tagName('tr'));
    for (let i = 2; i <= rows.length; i++) {
      const cells = await rows[i]
        .all(by.tagName('td'))
        .get(1)
        .getText();
      if ((await cells) == strGroup) {
        const newStatus = await rows[i]
          .all(by.tagName('td'))
          .get(9)
          .getText();
        return newStatus;
      }
    }
  }

  private async getSelectedGroupRow(group: string): Promise<ElementFinder> {
    const rows = await element.all(by.tagName('tr'));
    for (let i = 2; i <= rows.length; i++) {
      const cells = await rows[i]
        .all(by.tagName('td'))
        .get(1)
        .getText();
      if ((await cells) == group) {
        return await rows[i];
      }
    }
    return null;
  }

  public async clickSelectedGroupActions(group: string) {
    await this.waitForProcessingDialogToDissapear();
    await this.waitForElementPresenceLocator(by.xpath(this.getGroupPath(group)));
    const groupRow = await this.getSelectedGroupRow(group);
    const actionsColumn = await groupRow.all(by.tagName('td')).last();
    const actionsDropdown = await actionsColumn.element(
      by.xpath("./md-menu/button[@class='vertical-align-middle md-button md-ink-ripple']")
    );
    await this.clickElementFinder(actionsDropdown);
  }

  public async waitForProcessingDialogToDissapear() {
    if (await this.isVisible(this.processingDialogLocator)) {
      await this.waitForElementIsNotDisplayedLocator(this.processingDialogLocator);
    }
  }
}
