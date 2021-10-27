import { by, Locator } from 'protractor';
import ModelingPage from './modelingPage';

export class ModelingContributionPage extends ModelingPage {
  private readonly dropdownEnrolledPlanLocator: Locator = by.model('$ctrl.contributionPackage.plan_id');
  private enrolledPlanLocatorText: string =
    "//md-select-menu[@class='_md md-modelingTabs-theme md-overflow']/md-content[@class='_md md-modelingTabs-theme']/md-option/div[contains(text(),'XXXXX')]";

  public async selectEnrolledPlan(option: string) {
    let dynamicXpath: string = await this.enrolledPlanLocatorText.replace('XXXXX', option);
    let optionLocator = await by.xpath(dynamicXpath);
    await this.clickElement(optionLocator);
  }

  public async clickDropdownOption() {
    await this.clickElement(this.dropdownEnrolledPlanLocator);
  }
}
