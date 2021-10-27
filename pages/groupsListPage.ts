import { Locator, by, ElementFinder, element } from 'protractor';
import BasePage from './basePage';
import { click, slow } from 'blue-harvest';
import { FlexibleLocator } from 'blue-harvest/dist/action_helpers/locator_types';

export class GroupsListPage extends BasePage {
  public readonly searchField: Locator = by.id('input-search');
  public readonly newSearchField: Locator = by.css("input[type='search']");
  public readonly groupsLocator: Locator = by.css("a[id^='navigate-to-group-']");
  public readonly itemsPerPageDropdown: Locator = by.css("md-select[ng-model='$ctrl.itemsPerPage']");
  public groupsListingTable: Locator = by.className('group-listing-table');
  public readonly paginatorBackArrow: FlexibleLocator = 'arrow_back';
  public readonly paginatorForwardArrow: FlexibleLocator = 'arrow_forward';
  public readonly topGroupNameLocator: Locator = by.css(`div.table-row:first-of-type a[id^='navigate-to-group']`);
  public readonly showMoreLocator: Locator = by.css(`button.more-label--more`);
  public readonly actionsButtonLocator: Locator = by.xpath(
    "//button[@class='vertical-align-middle md-button md-ink-ripple ng-scope']"
  );
  public readonly reassignButtonLocator: Locator = by.xpath("//button[@id='-action-assign-broker']");
  public readonly columnNamePattern: String = "//md-content[@layout='column']//th[text()='{{columnName}}']";
  private readonly groupsRowsLocator: Locator = by.xpath('//group-listing-row');

  public async searchGroup(group: string) {
    await slow.see(this.searchField);
    await this.sendKeys(this.searchField, group);
  }

  public async searchGroup_(group: string) {
    await slow.see(this.searchField);
    await this.sendKeys(this.searchField, group);
  }

  public async clickArrowForward() {
    await slow.see(this.paginatorForwardArrow);
    await click(this.paginatorForwardArrow);
  }

  public async clickArrowBack() {
    await slow.see(this.paginatorBackArrow);
    await click(this.paginatorBackArrow);
  }

  public async isColumnNameDisplayed(columnName: string): Promise<boolean> {
    const columnNameLocator: Locator = by.xpath(this.columnNamePattern.replace(`{{columnName}}`, columnName));
    return this.isVisible(columnNameLocator);
  }

  public async getFirstGroupDueDate(): Promise<string> {
    const groupsRow = await element.all(this.groupsRowsLocator).first();
    const dueDateCellLocator = by.xpath('./div[10]');
    const dueDateCellSpan = await groupsRow.element(dueDateCellLocator).element('./span');
    return (await dueDateCellSpan.getText()).trim();
  }
}
