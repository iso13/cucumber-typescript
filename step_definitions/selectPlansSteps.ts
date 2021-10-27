import { SelectPlansPage } from '../pages/selectPlansPage';
import { browser } from 'protractor';
import { see } from 'blue-harvest';

let selectPlansPage: SelectPlansPage = new SelectPlansPage();

export async function addPlansToCustomQuote(quote) {
  await see('Select All');
  await selectPlansPage.clickElement(selectPlansPage.selectAllCheckboxLocator);
  await selectPlansPage.setQuoteName(quote.productLine, quote.name);
  await selectPlansPage.clickElement(selectPlansPage.continueButton);
}

export async function addAllPlansToCustomQuoteAndContinue() {
  browser.waitForAngularEnabled(true); //Need to do due timeout issue, will come back again once issue is resolved
  await selectPlansPage.clickElement(selectPlansPage.selectAllCheckboxLocator);
  await clickContinueBtn();
}

export async function selectPlanToQuote(planName: string) {
  await selectPlansPage.clickElement(selectPlansPage.selectPlanCheckbox(planName));
}

export async function clickContinueBtn() {
  await selectPlansPage.clickElement(selectPlansPage.continueButton);
}
