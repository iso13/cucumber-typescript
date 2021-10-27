import { by, Locator, element, ElementFinder } from 'protractor';
import BaseDialog from './baseDialog';

export class AdditionalPlanNeededDialog extends BaseDialog {
  //public readonly dialogLocator: Locator = by.xpath("//md-dialog[@aria-describedby ='dialogContent_44']"
  public readonly dialogLocator: Locator = by.xpath("//md-dialog[contains(@aria-label,'Additional Plans NeededYour')]");
  public readonly continueButton: Locator = by.xpath("//span[contains(text(),'CONTINUE QUOTING')]");

  public async isDialogDisplayed() {
    return await this.isVisible(await this.dialogLocator);
  }
  public async clickContinueQuotingBtn() {
    await this.clickElement(this.continueButton);
  }
}
