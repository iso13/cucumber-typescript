import { Locator, by } from 'protractor';
import BasePage from './basePage';

export class PlanListingPage extends BasePage {
  public readonly listingStyleLocator: Locator = by.css("md-switch[ng-model='vm.listingStyle']");
  public readonly quickSearchField: Locator = by.id('input-search');
  public readonly addPlanQuickSearchButton: Locator = by.css("button[aria-label='quick search add']");
  public readonly addAllPlanButton: Locator = by.id('action-add-all');
}
