import { Then, When } from 'cucumber';
import { QuoteCard } from '../../pages/cards/quoteCard';
import { groupNavigationSelectPages } from '../navigationSteps';

const quoteCard: QuoteCard = new QuoteCard();

Then(/^A quote for the selected plan should be successfully created$/, async function() {
  await verifyQuoteCreated(this);
});

Then(/^every plan should have corresponding quote created$/, async function() {
  const actualNumberOfQuotes: number = (await quoteCard.getElements(quoteCard.allQuoteCards)).length;
  this.assert.strictEqual(actualNumberOfQuotes, this.customPlans.size, `Incorrect number of quotes has been created`);

  for (let customPlan of this.customPlans.values()) {
    await verifyQuoteCreatedByName(this, customPlan.plan_name);
  }
});

Then(/^On "([^"]+)" quote summary card I should be able to see the "([^"]+)"$/, async function(
  planFileName: string,
  paramsToSee: string
) {
  const expectedParams: Map<string, object> = await getCardExpectedParams(this, planFileName, paramsToSee);
  await quoteCard.isQuoteCardDisplayed(this.customPlan.plan_name);
  for (let expectedParamName of expectedParams.keys()) {
    const isActuallyVisible: boolean = await quoteCard.isParameterDisplayed(expectedParamName);
    this.assert.isTrue(
      isActuallyVisible,
      `[${expectedParamName}] parameter/rate is not displayed/found on [${this.customPlan.plan_name}] quote card`
    );

    const actualParamValue: string = await quoteCard.getParameterValue(expectedParamName);
    const expectedFormatRegex: RegExp = new RegExp(String(expectedParams.get(expectedParamName)));
    this.assert.match(
      actualParamValue,
      expectedFormatRegex,
      `The value of the [${expectedParamName}] param is not in the expected format`
    );
  }
});

Then(/^On "([^"]+)" quote summary card I should not be able to see the "([^"]+)"$/, async function(
  planFileName: string,
  paramsNotToSee: string
) {
  const expectedParams: Map<string, object> = await getCardExpectedParams(this, planFileName, paramsNotToSee);
  await quoteCard.isQuoteCardDisplayed(this.customPlan.plan_name);
  for (let expectedParamName of expectedParams.keys()) {
    const isActuallyVisible: boolean = await quoteCard.isParameterDisplayed(expectedParamName);
    this.assert.isFalse(
      isActuallyVisible,
      `Unexpected [${expectedParamName}] parameter displays on [${this.customPlan.plan_name}] quote card`
    );
  }
});

Then(/^On "([^"]+)" quote summary card I should be able to see number of enrolled lives per tier$/, async function(
  planFileName: string
) {
  const expectedTierCounts: Map<string, object> = await getCardExpectedParams(this, planFileName, `enrolled lives`);
  await quoteCard.isQuoteCardDisplayed(this.customPlan.plan_name);

  for (let expectedTierCount of expectedTierCounts.keys()) {
    const actualCountValue: string = await quoteCard.getTierCountValue(expectedTierCount);
    const expectedFormatRegex: RegExp = new RegExp(String(expectedTierCounts.get(expectedTierCount)));
    this.assert.match(
      actualCountValue,
      expectedFormatRegex,
      `The value of the [${expectedTierCount}] tier count is not in the expected format`
    );
  }
});

Then(/^Total dollar amount should display on (?:.+) quote summary card$/, checkTotalCost);

async function getCardExpectedParams(
  context: any,
  planFileName: string,
  paramsToCheck: string
): Promise<Map<string, object>> {
  const quoteConfig = await context.testData.getQuoteCardConfigJson(context, planFileName + `_quote_card`);
  let paramsObject = null;
  try {
    paramsObject = quoteConfig[planFileName][paramsToCheck];
  } catch {
    throw new Error(`Check and update the quote card configuration json file: [${planFileName}_quote_card.json]`);
  }
  return context.json.jsonToMap(paramsObject);
}

async function checkTotalCost() {
  await quoteCard.isQuoteCardDisplayed(this.customPlan.plan_name);
  const costDisplayedValue: string = await quoteCard.getTotalCostValue();
  const costNumValue: number = Number(costDisplayedValue.replace(/[^0-9-]+/g, ``));
  this.assert.isTrue(await quoteCard.isTotalCostDisplayed(), `Total dollar amount value (cost) doesn't display`);
  this.assert.isTrue(costNumValue > 0, `The total cost [` + costDisplayedValue + `] should be a positive number`);
  this.assert.match(
    costDisplayedValue,
    /^\$(\d{1,3},)*\d{1,3}$/,
    `The Total Cost value is not in the expected currency format`
  );
}

Then(/^Total dollar amount should not display on (?:.+) quote summary card$/, async function() {
  await quoteCard.isQuoteCardDisplayed(this.customPlan.plan_name);
  this.assert.isFalse(await quoteCard.isTotalCostDisplayed(), `Total dollar amount value (cost) displays`);
});

Then(/^I should see "([^"]+)" text on (?:[^"]+) quote summary card$/, async function(expectedText: string) {
  await quoteCard.isQuoteCardDisplayed(this.customPlan.plan_name);
  const actualText: string = await quoteCard.getTotalCostLabel();
  this.assert.strictEqual(actualText, expectedText);
});

When(/^I open 'View Rates' dialog for "([^"]+)"$/, async function(rateType: string) {
  await quoteCard.isQuoteCardDisplayed(this.customPlan.plan_name);
  const isViewRatesParamVisible: boolean = await quoteCard.isParameterDisplayed(rateType);
  this.assert.isTrue(
    isViewRatesParamVisible,
    `[${rateType}] link is not displayed/found on [${this.customPlan.plan_name}] quote card`
  );

  await quoteCard.clickViewRatesLink();
});

Then(/^On 'View Rates' dialog of "([^"]+)" I should be able to see the "([^"]+)"$/, async function(
  planFileName: string,
  paramsToSee: string
) {
  const expectedParams: Map<string, object> = await getCardExpectedParams(this, planFileName, paramsToSee);
  await quoteCard.isQuoteCardDisplayed(this.customPlan.plan_name);
  for (let expectedParamName of expectedParams.keys()) {
    const isActuallyVisible: boolean = await quoteCard.isDialogParameterDisplayed(expectedParamName);
    this.assert.isTrue(isActuallyVisible, `[${expectedParamName}] parameter/rate is not displayed/found on the dialog`);

    const actualParamValue: string = await quoteCard.getDialogParameterValue(expectedParamName);
    const expectedFormatRegex: RegExp = new RegExp(String(expectedParams.get(expectedParamName)));
    this.assert.match(
      actualParamValue,
      expectedFormatRegex,
      `The value of the [${expectedParamName}] param is not in the expected format`
    );
  }
});

Then(/^the quote card should not be actionable$/, async function() {
  await groupNavigationSelectPages('quotes');
  this.assert.isTrue(await quoteCard.isQuoteCardDeclined(), 'Error, quote card is not declined');
  this.assert.isFalse(await quoteCard.isQuoteCardActionable(), 'Error, quote card is actionable');
});

export async function verifyQuoteCreated(context: any) {
  const quoteName: string = context.customPlan.plan_name;
  await verifyQuoteCreatedByName(context, quoteName);
}

async function verifyQuoteCreatedByName(context: any, quoteName: string) {
  context.logger.info(`Checking if quote [${quoteName}] is created/displayed`);
  const isQuoteCardDisplayed: boolean = await quoteCard.isQuoteCardDisplayed(quoteName);
  context.assert.isTrue(isQuoteCardDisplayed, `Quote with the name [` + quoteName + `] was not created/found`);
}

class QuoteCardParams {
  private valuesArray: string[];

  constructor(dataTable: any) {
    this.valuesArray = [];
    for (let paramName of dataTable.raw()) {
      this.valuesArray.push(paramName.pop());
    }
  }

  public getArrayOfValues(): string[] {
    return this.valuesArray;
  }
}
