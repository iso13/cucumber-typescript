import { Locator, by, element, browser } from 'protractor';
import BasePage from './basePage';

export class UploadCensusPage extends BasePage {
  public readonly headerLocator: Locator = by.tagName('md-card-header');
  public readonly censusTypeDropdown: Locator = by.id('action-select-import-type');

  public readonly browseFilesButtonSelector: Locator = by.css("label[for='navigate-to-browse-file']");
  public readonly browseFilesInputLocator: Locator = by.id('navigate-to-browse-file');
  public readonly continueLocator: Locator = by.id('action-upload-census');
  public readonly removeFileLocator: Locator = by.css("button[ng-click='vm.removeFile()']");
  public readonly backBtnLocator: Locator = by.id('action-go-back');

  public async setCensusType(censusType: string) {
    await this.clickElement(this.censusTypeDropdown);
    await this.clickDropdownOption(censusType);
  }

  public async setCensusFile(censusFilePath: string) {
    await this.executeJs("document.getElementById('navigate-to-browse-file').style.display='block'");
    await this.clickElement(this.browseFilesButtonSelector);
    await this.sendKeys(this.browseFilesInputLocator, censusFilePath);
    await this.waitForElementPresenceLocator(this.removeFileLocator);
  }

  public async goBack() {
    await this.clickElement(this.backBtnLocator);
  }
}
