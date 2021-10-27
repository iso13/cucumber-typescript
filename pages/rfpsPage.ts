import { Locator, by, element, ElementFinder } from 'protractor';
import BasePage from './basePage';

export class RfpsPage extends BasePage {
  private readonly rfpsTableLocator: Locator = by.id('DataTables_Table_0');
  private readonly rfpsRowsLocator: Locator = by.xpath(
    "//table[@id='DataTables_Table_0']//tr[@ng-repeat='rfp in $ctrl.rfps track by rfp.id']"
  );
  private readonly pageNumberLocator: Locator = by.css("a[class='paginate_button ']");
  public readonly searchField: Locator = by.css("input[type='search']");

  public async waitForRFPsAreVisible(): Promise<Boolean> {
    try {
      await this.waitForElementVisibilityWithLocator(this.rfpsTableLocator);
      return true;
    } catch (error) {
      return false;
    }
  }

  public async goToTheLastPage() {
    const lastPageNumber = await element.all(this.pageNumberLocator).last();
    await this.clickElementFinder(lastPageNumber);
  }

  public async searchRFP(rfp: string) {
    await this.sendKeys(this.searchField, rfp);
  }

  public async getRFPsCreatedDates(): Promise<string[]> {
    const rfpRowList: ElementFinder[] = await element.all(this.rfpsRowsLocator);
    const createdDateCellLocator = by.xpath('./td[1]');
    const createdDateList: string[] = new Array<string>();
    for (let index = 0; index < rfpRowList.length; index++) {
      const dateDiv = await rfpRowList[index]
        .element(createdDateCellLocator)
        .element(by.xpath("./div[@class='ng-binding'][1]"));
      const timeDiv = await rfpRowList[index]
        .element(createdDateCellLocator)
        .element(by.xpath("./div[@class='ng-binding'][2]"));
      const date = await dateDiv.getText();
      const time = await timeDiv.getText();
      createdDateList.push(date + ' ' + time);
    }
    return createdDateList;
  }
  public async getFirstRFPGroupName(): Promise<string> {
    const rfpRow = await element.all(this.rfpsRowsLocator).first();
    return (await this.getRFPGroupName(rfpRow)).trim();
  }

  public async findRFPByGroupNameInPage(groupName: string): Promise<Map<string, string>> {
    const rfpRowList: ElementFinder[] = await element.all(this.rfpsRowsLocator);
    let rfpMap = new Map();

    for (let rfpRow of rfpRowList) {
      const rfpGroupName = await this.getRFPGroupName(rfpRow);

      if (rfpGroupName === groupName) {
        const rfpCreatedDate = await this.getRFPCreatedDate(rfpRow);
        rfpMap.set('created date', rfpCreatedDate);
        rfpMap.set('group name', rfpGroupName);
        break;
      }
    }
    return rfpMap;
  }

  private async getRFPGroupName(rfpElement: ElementFinder): Promise<string> {
    const groupNameCellLocator = by.xpath('./td[3]');
    const groupNameCell = await rfpElement.element(groupNameCellLocator);
    return await groupNameCell.getText();
  }

  private async getRFPCreatedDate(rfpElement): Promise<string> {
    const createdDateCellLocator = by.xpath('./td[1]');

    const dateDiv = await rfpElement.element(createdDateCellLocator).element(by.xpath("./div[@class='ng-binding'][1]"));

    const timeDiv = await rfpElement.element(createdDateCellLocator).element(by.xpath("./div[@class='ng-binding'][2]"));

    const date = await dateDiv.getText();
    const time = await timeDiv.getText();
    return `${date} ${time}`;
  }
}
