import { by, ElementFinder, Locator, $, By } from 'protractor';
import BaseDialog from './baseDialog';

export class QuoteTypeDialog extends BaseDialog {
  public readonly dialog: ElementFinder = $('dialogContent_888');
  public readonly standardModelingButton: Locator = by.xpath("//button[@id='action-type-select-Standard Modeling']");
  public readonly nextButton: Locator = by.css('#action-next');
}
