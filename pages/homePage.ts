import { Locator, by, element, ElementFinder } from 'protractor';
import BasePage from './basePage';

export class HomePage extends BasePage {
  public readonly navBarLogo: Locator = by.css(`.nav-logo`);
  public readonly carrierLogo: Locator = by.css(`.carrier-logo`);
  public readonly createGroupButton: Locator = by.id('home-navigate-to-newGroup');
  public readonly groupsButton: Locator = by.id('home-navigate-to-groups');
  public readonly loadingBar: Locator = by.id('loading-bar');

  public async waitLoadingBar() {
    await this.waitForElementNotPresentLocator(this.loadingBar);
  }

  public async clickCreateGroup() {
    await this.waitLoadingBar();
    await this.clickElement(this.createGroupButton);
  }
  public async clickGroups() {
    await this.waitLoadingBar();
    await this.clickElement(this.groupsButton);
  }
}
