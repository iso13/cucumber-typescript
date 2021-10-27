import { Locator, by, element } from 'protractor';
import BasePage from './basePage';

export class Navigation extends BasePage {
  private readonly moreBtnLocator: Locator = by.id('group-navigate-to-more');
  public readonly groupHome: Locator = by.xpath("//a[@id='group-navigate-to-group-home']");
  public readonly createGroupButton: Locator = by.id('home-navigate-to-newGroup');
  public readonly groupList: Locator = by.xpath("//button//span[contains(text(),'Groups')]");

  public async navigateToOption(option: string) {
    await this.clickElement(by.id('navigate-to-' + option));
  }

  public async clickGroupNavigationMoreBtn() {
    await this.clickElement(this.moreBtnLocator);
  }

  public async groupNavigationSelectPages(page: string) {
    const groupByLocator: Locator = by.id('group-navigate-to-' + page.toLowerCase());
    const isGroupTabVisible = await element(groupByLocator).isDisplayed();

    if (isGroupTabVisible === true) {
      await this.clickElement(groupByLocator);
    } else {
      await this.clickGroupNavigationMoreBtn();
      await this.clickElement(groupByLocator);
    }
  }
}
