import { Locator, by } from 'protractor';
import BasePage from './basePage';
import { click } from 'blue-harvest';

export class AppMenu extends BasePage {
  private readonly appMenuLocator: Locator = by.css('#action-open-menu');
  private readonly signOutLocator: Locator = by.xpath("//button[@id='action-sign-out']");
  public readonly notificationsCountLocator: Locator = by.xpath(
    "//div[@class='center-badge ng-binding ng-scope ng-isolate-scope']"
  );
  public readonly notificationsLocator: Locator = by.id('navigate-to-notifications');
  public async signOut() {
    await click(by.css('#action-open-menu'));
    await click('Sign Out');
  }

  public async signoutWhenOpenedMenu() {
    await this.clickElement(this.signOutLocator);
  }

  public async openMenu() {
    await this.clickElement(this.appMenuLocator);
  }

  public async getNumberOfNotifications(): Promise<string> {
    return await this.getElementText(this.notificationsCountLocator);
  }

  public async clickNotifications() {
    await this.clickElement(this.appMenuLocator);
    await this.clickElement(this.notificationsLocator);
  }
}
