import { PlanListingPage } from '../pages/planListingPage';
import { click, slow } from 'blue-harvest';

const planListingPageObject: PlanListingPage = new PlanListingPage();

export async function addPlansToQuote(plans) {
  await slow.see('Add All Plans');
  await planListingPageObject.clickElement(planListingPageObject.listingStyleLocator);
  for (let plan of plans) {
    await planListingPageObject.sendKeys(planListingPageObject.quickSearchField, plan.name);
    await planListingPageObject.clickElement(planListingPageObject.addPlanQuickSearchButton);
  }
}
