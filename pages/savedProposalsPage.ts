import { Locator, element, by, browser, Key } from 'protractor';
import BasePage from './basePage';

export class SavedProposalsPage extends BasePage {
  public readonly createProposalBtn: Locator = by.id('action-create-proposal');
  public readonly createRFPBtn: Locator = by.id('action-create-rfp');
  public readonly proposalNameField: Locator = by.xpath("//div[@class='proposal-name ng-binding layout-row flex']");
  public readonly proposalActionsDropdown: Locator = by.id('action-select');
  public readonly downloadExcelExportDisabledButton: Locator = by.css(
    `button[ng-disabled^='vm.proposal'][disabled='disabled']`
  );
  private readonly loadingDialog: Locator = by.css(`md-dialog.loading-dialog`);
  private readonly proposalActionOptionButton: string =
    "//md-menu-item//button/div/p[text()[contains(.,'XXXXX')]]/../..";
  private readonly proposalStatusField: Locator = by.css('.proposal-products + div');
  private readonly proposalNoGoIcon: Locator = by.css('.proposal-row .material-icons');
  private readonly proposalToolTip: Locator = by.css('div md-tooltip');

  public async isCreateProposalDisabled(): Promise<boolean> {
    return (await element(this.createProposalBtn).getAttribute('disabled')) === 'true';
  }

  public async clickProposalAction(option: string) {
    let dynamicXpath: string = this.proposalActionOptionButton.replace('XXXXX', option);
    let optionLocator = by.xpath(dynamicXpath);
    await this.clickElement(optionLocator);
  }

  /**
   * Hack to bypass the issue on Windows machines,
   * when loading dialog (loop) doesn't close automatically
   * https://limelight.atlassian.net/browse/MSTR-3758
   */
  public async closeLoadingDialog() {
    if (await this.isVisible(this.loadingDialog)) {
      await browser
        .actions()
        .sendKeys(Key.ESCAPE)
        .perform();
      await this.waitForElementNotPresentLocator(this.loadingDialog);
    }
  }

  public async clickCreateRFP() {
    await this.clickElement(this.createRFPBtn);
  }

  public async isRFPButtonVisible(): Promise<Boolean> {
    return await this.isVisible(this.createRFPBtn);
  }

  public async isSavedProposalActionable(): Promise<boolean> {
    return (await element(this.proposalActionsDropdown).getAttribute('disabled')) === 'true';
  }

  public async isNoGoIconVisible(): Promise<Boolean> {
    return await this.isVisible(this.proposalNoGoIcon);
  }

  public async getProposalStatus(): Promise<string> {
    return await this.getElementText(this.proposalStatusField);
  }
}
