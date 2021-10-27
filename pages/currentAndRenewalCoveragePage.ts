import { Locator, by } from 'protractor';
import BasePage from './basePage';

export class CurrentAndRenewalCoveragePage extends BasePage {
  public readonly selectMedicalLocator: Locator = by.css("a[translate='group.currentRenewalCoverage.selectMedical']");
}
