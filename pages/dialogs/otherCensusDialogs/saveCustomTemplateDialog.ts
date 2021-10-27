import { by, Locator } from 'protractor';
import BaseDialog from '../baseDialog';

export class SaveCustomTemplateDialog extends BaseDialog {
  public readonly cancelButton = by.id('action-cancel');
  public readonly saveBtnLocator: Locator = by.id('action-finish');
  public readonly templateNameField: Locator = by.css('#mapping-name');

  public async setCensusTemplateName(templateName: string) {
    const now: Date = new Date();
    const templName = templateName + ' ' + (await now.toLocaleDateString()) + ' ' + (await now.toLocaleTimeString());
    await this.sendKeys(this.templateNameField, templName);
  }
}
