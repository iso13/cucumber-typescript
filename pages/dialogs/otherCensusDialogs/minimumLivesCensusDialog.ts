import { by, Locator } from 'protractor';
import BaseDialog from '../baseDialog';

export class minimumLivesCensusDialog extends BaseDialog {
  public readonly undoButton: Locator = by.id('action-cancel');
  public readonly okBtnLocator: Locator = by.id('action-ok');

  public readonly censusLivesDialog = by.xpath("//md-dialog[contains(@class,'_md md-transition-in')]");
  public readonly productList = by.xpath("//div[@class='md-dialog-content']//div[@class='ng-scope']//ul");
  public readonly censusErrorMessage = by.xpath(
    "(//div[contains(@class,'md-dialog-content')]//p[contains(@class,'ng-binding')])[1]"
  );

  public async waitForDialogtoDisplay() {
    await this.waitForElementVisibilityWithLocator(this.censusLivesDialog);
  }

  public async acceptError() {
    await this.clickElement(this.okBtnLocator);
  }
  public async undoError() {
    await this.clickElement(this.undoButton);
  }
}
