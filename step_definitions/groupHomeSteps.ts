import { Then } from 'cucumber';
import { element, ElementFinder } from 'protractor';
import { GroupHomePage } from '../pages/groupHomePage';

const groupHomePageObject: GroupHomePage = new GroupHomePage();

Then('A custom medical quote should be successfully created for my group', async function() {
  let savedCardElements: ElementFinder[] = await element.all(groupHomePageObject.savedQuoteCardsButton);
  let actualNumberOfsavedCards: number = savedCardElements.length;
  this.assert.strictEqual(actualNumberOfsavedCards, 1, 'A custom quote was not successfully saved');
});

Then('Quotes should be created for all product lines', async function(productNames) {
  let expectedQuoteNames = [];
  for (let product of productNames.raw()) {
    let quote = await this.testData.getQuoteJson(this, product);
    for (let plan of quote.plans) {
      expectedQuoteNames.push(plan.toString());
    }
  }

  let actualQuoteNames = [];
  let savedCardElements: ElementFinder[] = await element.all(groupHomePageObject.savedQuoteCardsTitle);
  for (let quote of savedCardElements) {
    actualQuoteNames.push(quote.getText().toString());
  }

  this.assert.strictEqual(expectedQuoteNames.sort(), actualQuoteNames.sort(), 'Quotes was not successfully saved');
});

Then('A published quote should be successfully created for my group', async function() {
  await groupHomePageObject.waitForElementPresenceLocator(groupHomePageObject.savedQuoteCardsButton);
  let savedCardElements: ElementFinder[] = await element.all(groupHomePageObject.savedQuoteCardsButton);
  let actualNumberOfsavedCards: number = savedCardElements.length;
  this.assert.strictEqual(actualNumberOfsavedCards, 1, 'A published quote was not successfully saved');
});

Then('in-group home page displays for the selected group', async function() {
  const actualPageHeaderText: string = await groupHomePageObject.getElementText(groupHomePageObject.headerLocator);
  this.assert.strictEqual(actualPageHeaderText, 'Recent Quotes');
});

Then('I am redirected to the group home page', async function() {
  const actualPageHeaderText: string = await groupHomePageObject.getElementText(groupHomePageObject.headerLocator);
  this.assert.strictEqual(actualPageHeaderText, 'Recent Quotes');
});
