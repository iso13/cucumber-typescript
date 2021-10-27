import { Locator, by } from 'protractor';
import BasePage from './basePage';

export class SelectBrokerPage extends BasePage {
  public readonly brokerNameInputLocator: Locator = by.css('.dataTables_filter > label > input');

  public readonly brokerFirstColumnElement: Locator = by.css('.broker-listing-table > tbody > tr > td:first-child');

  public async enterBrokerName(brokerName: string) {
    await this.sendKeys(this.brokerNameInputLocator, brokerName);
  }

  public async clickAddBroker() {
    await this.clickElement(this.brokerFirstColumnElement);
  }
}
