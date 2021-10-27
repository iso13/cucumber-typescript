import { by, Locator } from 'protractor';
import BaseDialog from './baseDialog';

export class BenefitTypeDialog extends BaseDialog {
  public readonly medicalButton: Locator = by.css("button[id='action-toggle-Medical']");
  public readonly dentalButton: Locator = by.css("button[id='action-toggle-Dental']");
  public readonly visionButton: Locator = by.css("button[id='action-toggle-Vision']");
  public readonly lifeButton: Locator = by.css("button[id='action-toggle-Life']");
  public readonly nextButton: Locator = by.xpath("//button//span[contains(text(),'Next')]");
  public readonly setQuoteFiltersChkbox: Locator = by.css('#force-quote-filters');
}
