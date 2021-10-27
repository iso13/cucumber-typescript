import { Locator, by } from 'protractor';
import BasePage from '../basePage';

export class ViewRatesDialog extends BasePage {
  public readonly viewRatesBtn: Locator = by.css(`view-rates-button button`);
  public readonly viewRatesModal: Locator = by.css(`.view-rates-modal`);
  public readonly closeBtnModal: Locator = by.css(`.close-btn button`);

  public async openRatesModal() {
    await this.clickElement(this.viewRatesBtn);
  }

  public async closeRatesModal() {
    await this.clickElement(this.closeBtnModal);
  }
}
