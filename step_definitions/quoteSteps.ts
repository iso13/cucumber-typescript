import { When } from 'cucumber';
import { slow, click, rightOf } from 'blue-harvest';
import { AllQuotesPage } from '../pages/allQuotesPage';
import { createCustomPlans } from './workflows/planDesignWorkflows';
import { createCustomQuoteForAPlan } from './workflows/principalWorkflows';

const allQuotePage: AllQuotesPage = new AllQuotesPage();

When('I delete one quote', async function() {
  await slow.see('quotes');
  await click('quotes');
  let planDeleted = Array.from(this.customPlans)[0][1].plan_name;
  await rightOf(planDeleted).click(allQuotePage.hamburgersMenuQuoteCard);
  await click('delete');
  await click('delete it!');
});

When(/^I create (?:a|few) quotes? based on custom plans?:$/, async function(dataTable: any) {
  await createCustomPlans(this, dataTable);
  await createCustomQuoteForAPlan(this);
});
