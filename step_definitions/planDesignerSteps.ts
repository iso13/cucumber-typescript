import { DeletePlanDialog } from './../pages/dialogs/deletePlanDialog';
import { element, browser } from 'protractor';
import { When, Then, TableDefinition } from 'cucumber';
import { PlanDesignerPage } from '../pages/planDesignerPage';
import { CheckPlanAvailabilityDialog } from '../pages/dialogs/checkPlanAvailabilityDialog';
import { addAllPlansToCustomQuoteAndContinue } from './selectPlansSteps';
import { navigateInsideGroupIfNeeded } from './navigationSteps';
import { slow } from 'blue-harvest';

const planDesignerPage: PlanDesignerPage = new PlanDesignerPage();
const checkPlanAvailabilityDialog: CheckPlanAvailabilityDialog = new CheckPlanAvailabilityDialog();
const deletePlanDialog: DeletePlanDialog = new DeletePlanDialog();

Then('I should be redirected to Plan Designer page', async function() {
  this.assert.strictEqual(
    await element(planDesignerPage.planDesignerPageTitle).getText(),
    'Plan Designer',
    'The name of the page is not as expected'
  );
});

When(/^I start creating new "([^"]+)" plan$/, startNewPlanCreation);
async function startNewPlanCreation(productName: string) {
  await planDesignerPage.clickGroupNavigation('plans');
  await planDesignerPage.clickAddPlanForProduct(productName);
}

When('I review the {string} saved plan', async function(planName: string) {
  await planDesignerPage.viewSavedPlans(planName);
});

Then('{string} option should be selected in {string} field', async function(option: string, benefitName: string) {
  const isRadioButtonChecked = await planDesignerPage.verifyRadioButtonCheckedOrNot(benefitName, option);
  this.assert.strictEqual(
    'true',
    isRadioButtonChecked,
    'Expected Result: The benefit [' + benefitName + '] should be set to true.'
  );
});

//most likely, applicable to PDv2 only
When(/^I populate (?:all|some) fields for (?:.+) custom plan$/, async function(dataTable: any) {
  const customPlans: CustomPlansData = new CustomPlansData(dataTable);
  let customPlan = await customPlans.getCustomPlan(this, 0);
  await populateAllCustomPlanFields(this, customPlan);
});

When(/^I copy plan$/, async function(dataTable: any) {
  await planDesignerPage.copyPlan(this.customPlan.plan_name);
  // TODO: assert plan was copied over or duplicated
  await verifyBenefits(this, dataTable.raw()[0][0]);
});

When(/^I delete the custom plan$/, async function() {
  await planDesignerPage.selectCustomPlanFromList(this.customPlan.plan_name);

  //checking if the plan displays as saved
  await assertSavedPlanIconVisible(this);
  await assertSaveBtnIsDisabled(this);

  await planDesignerPage.clickElement(planDesignerPage.deleteCustomPlanBtnLocator);
  await deletePlanDialog.clickElement(deletePlanDialog.deletePlanBtn);
});

Then(/^I can set the benefit "(.*?)" (.*?) with value "(.*?)"$/, async function(
  slug: string,
  type: string,
  value: string,
  dataTable: TableDefinition
) {
  await populateBenefitValue({ slug, value, type });
  const benefitSlug = dataTable.raw()[0][0];
  const benefitType = dataTable.raw()[0][2];
  const benefitVisible = JSON.parse(dataTable.raw()[0][1]);
  const benefitLocator = planDesignerPage.benefitLocator(benefitSlug, benefitType);
  const isBenefitVisible = await planDesignerPage.isVisible(benefitLocator);
  this.assert.strictEqual(isBenefitVisible, benefitVisible);
});

Then(/^I (should see|should not see) benefit "(.*?)" (.*?)$/, async function(
  visible: string,
  benefitSlug: string,
  type: string
) {
  const shouldBeVisible: boolean = visible === 'should see';
  const isBenefitVisible = await planDesignerPage.isVisible(planDesignerPage.benefitLocator(benefitSlug, type));
  this.assert.strictEqual(isBenefitVisible, shouldBeVisible);
});

Then(/^the custom plan should be removed successfully$/, async function() {
  const isCustomPlanDisplayed: boolean = await planDesignerPage.isCustomPlanVisible(this.customPlan.plan_name);
  this.assert.isFalse(
    isCustomPlanDisplayed,
    `Custom plan [${this.customPlan.plan_name}] was not successfully removed from the list of plans`
  );
});

Then(/^I should get the status updated to ([^"]+)$/, async function(status: string) {
  await navigateInsideGroupIfNeeded(`plans`);
  const currentStatus: string = await planDesignerPage.getElementText(planDesignerPage.groupStatusOnPlanDesigner);
  const isStatusExpected: boolean = await currentStatus.includes(status);
  this.assert.isTrue(isStatusExpected, `The status is not the expected [${status}] actual [${currentStatus}]`);
});

Then('plan should display correct set of benefit values for the {string}', async function(plan: string) {
  const customPlan = await this.testData.getCustomPlanJson(this, plan);
  for (let benefit of customPlan.benefits) {
    if (benefit.type == 'radio') {
      const isRadioButtonChecked = await planDesignerPage.verifyRadioButtonCheckedOrNot(benefit.slug, benefit.value);
      this.assert.strictEqual(
        'true',
        isRadioButtonChecked,
        'Expected Result: The benefit [' + benefit.slug + '] should be set to true.'
      );
    }
    if (benefit.type == 'select') {
      const verifySelectValue = await planDesignerPage.verifySelectOption(benefit.slug, benefit.label, benefit.value);
      this.assert.strictEqual(
        benefit.label + ': ' + benefit.value,
        verifySelectValue,
        'Expected Result: The benefit [' + benefit.slug + '] should be set to [' + benefit.value + '].'
      );
    }
  }
});

Then(/^each of the quoted plans should be locked$/, async function() {
  await navigateInsideGroupIfNeeded(`plans`);
  for (let customPlan of this.customPlans.values()) {
    const isCustomPlanDisplayed: boolean = await planDesignerPage.isCustomPlanVisible(customPlan.plan_name);
    this.assert.isTrue(
      isCustomPlanDisplayed,
      `Custom plan [${customPlan.plan_name}] is not displayed on Plan Designer page`
    );
    const isCustomPlanLocked: boolean = await planDesignerPage.isCustomPlanLocked(customPlan.plan_name);
    this.assert.isTrue(isCustomPlanLocked, `Custom plan [${customPlan.plan_name}] is not marked as locked`);
  }
});

When(/^I select the preset "([^"]+)"$/, async function(presetName: string) {
  await browser.waitForAngularEnabled(false);
  await planDesignerPage.clickPresetDropdown(presetName);
  await browser.waitForAngularEnabled(true);
});

export async function populateAllCustomPlanFields(worldContext, customPlan: any) {
  await startNewPlanCreation(customPlan.product_line);

  await browser.waitForAngularEnabled(false);
  await planDesignerPage.sendKeys(planDesignerPage.planNameField, customPlan.plan_name);
  if (customPlan.presetName) {
    await planDesignerPage.clickPresetDropdown(customPlan.presetName);
  }
  if (customPlan.planViewName) {
    await planDesignerPage.clickPlanViewDropdown(customPlan.planViewName);
  }
  for (let benefit of customPlan.benefits) {
    await populateBenefitValue(benefit);
  }
  await planDesignerPage.waitForElementNotPresentLocator(planDesignerPage.savePlanDisabledButton);
  await browser.waitForAngularEnabled(true);
  worldContext.customPlan = customPlan;
  worldContext.customPlans.set(customPlan.plan_name, customPlan);
}

//most likely, applicable to PDv2 only
When(/^I save a custom plan$/, savePlanPDv2);
export async function savePlanPDv2() {
  await browser.waitForAngularEnabled(false);
  await planDesignerPage.clickElement(planDesignerPage.savePlanButton);
  await planDesignerPage.waitForElementPresenceLocator(planDesignerPage.savedPlanButton);
  await browser.waitForAngularEnabled(true);
}

When(/^I attempt to save a custom plan$/, attemptSavePlanPDv2);
export async function attemptSavePlanPDv2() {
  await browser.waitForAngularEnabled(false);
  await planDesignerPage.clickElement(planDesignerPage.savePlanButton);
}

//most likely, applicable to PDv2 only
Then(/^the custom plan should be saved successfully$/, async function() {
  await planDesignerPage.waitForElementPresenceLocator(planDesignerPage.savedPlanButton);
  await browser.waitForAngularEnabled(true);
  await assertSaveBtnIsDisabled(this);
  await assertSavedPlanIconVisible(this);
});

Then('I should see a warning prompt with message {string}', async function(message: string) {
  try {
    const softStopMessage = await planDesignerPage.getSoftStopWarning();
    this.assert.strictEqual(message, softStopMessage);
  } catch {
    throw new Error('SoftStop modal is not present on the page');
  }
});

Then('I {string} on softstop warning', async function(button: string) {
  await planDesignerPage.clickSoftStopWarning(button);
});

Then('custom plan is not saved', async function() {
  await planDesignerPage.waitForElementPresenceLocator(planDesignerPage.savePlanButton);
  await browser.waitForAngularEnabled(true);
  await assertSaveBtnIsEnabled(this);
});

/**
 * Core / ADP
 * create and save custom plan based on preset and rates values
 */
When('I save custom plan for', async function(productNames) {
  for (let product of productNames.raw()) {
    let quote = await this.testData.getQuoteJson(this, product);
    for (let plan of quote.plans) {
      await configurePlan(quote, plan);
      await savePlan();
    }
  }
});

When(/^I create (?:custom )?quotes? for all saved plans$/, async function() {
  await createCustomQuoteForAllPlans();
});
export async function createCustomQuoteForAllPlans() {
  await startGeneratingQuotes();
  await addAllPlansToCustomQuoteAndContinue();
}

When(/^I (?:un)?select class(?:es)? ([^"]+) to quote$/, async function(classNumbers: any) {
  classNumbers = this.testData.convertStringToArray(classNumbers);
  for (let classNumber of classNumbers) {
    await planDesignerPage.clickClassNumberChbx(classNumber);
  }
});

When(/^I set the action to ([^"]+)$/, async function(actionsSet: any) {
  actionsSet = actionsSet.split(' ');
  for (let actionSet of actionsSet) {
    const actionNormalized = actionSet.replace(/_/g, ' ');
    await planDesignerPage.clickActionsDropdown(actionNormalized);
    await planDesignerPage.waitForElementPresenceShortWithLocator(planDesignerPage.okStatusUpdatedLocator);
    await planDesignerPage.clickElement(planDesignerPage.okStatusUpdatedLocator);
  }
});

When(/^I unselect all checked class(?:es)?$/, async function() {
  await planDesignerPage.uncheckClasses();
});

Then(/^custom plan cannot be saved?$/, async function() {
  await planDesignerPage.scrollElementIntoView(planDesignerPage.savePlanButtonContainer, `start`);
  await planDesignerPage.waitForElementPresenceLocator(planDesignerPage.savePlanButtonContainer);
  const saveButtonElement = await element(planDesignerPage.savePlanButtonContainer);
  const isDisabled: boolean = (await saveButtonElement.getAttribute('disabled')) === 'true';
  this.assert.isTrue(isDisabled);
});

Then(/^Message about not meeting the requirement of minimum number of lives should display$/, async function() {
  const actualWarningMessage: string = await planDesignerPage.getElementText(planDesignerPage.assignClassesWarning);
  const expectedWarningMessage: string =
    `Minimum number of lives for this product not met with current ` +
    `class selection. Select additional class(es) to save a plan.`;
  this.assert.strictEqual(actualWarningMessage, expectedWarningMessage);
});

Then(/^I should not be allow to save the quote$/, async function() {
  await browser.waitForAngularEnabled(false);
  await planDesignerPage.waitForElementPresenceLocator(planDesignerPage.errorOnSave);
  this.assert.isTrue(
    await planDesignerPage.isElementExist(planDesignerPage.errorOnSave),
    `You should not be able to save the quote on this account`
  );
  await browser.waitForAngularEnabled(true);
});

Then(/^I should not be able to save the plan$/, async function() {
  await assertSaveBtnIsDisabled(this);
});

Then(/^I should not get the status updater$/, async function() {
  await assertActionsIsDisabled(this);
});

When(/^I select to view the plan Summary card$/, async function() {
  await planDesignerPage.clickElement(planDesignerPage.planSummaryTab);
});

Then(/^the (?:[^"]+) logo should display on the plan Summary card$/, async function() {
  const baselineFileName: string = this.testData.setImageComparisonPath(this, `plan_card_carrier_logo`);
  const result: boolean = await planDesignerPage.imageComparison.compareElement(
    planDesignerPage.planCarrierLogo,
    baselineFileName
  );
  this.assert.isTrue(
    result,
    `Element [${planDesignerPage.planCarrierLogo}] doesn't match the image in [${baselineFileName}]`
  );
});

/**
 * Core / ADP
 * populating custom plan fields with preset and rates
 */
export async function configurePlan(quote, plan) {
  await planDesignerPage.clickAddPlanForProduct(quote.productLine);
  await planDesignerPage.sendKeys(planDesignerPage.planNameField, plan.name);
  if (quote.carriers) {
    await planDesignerPage.clickCarrierDropdown(quote.carriers[0]);
  }
  if (plan.preset) {
    await planDesignerPage.clickPresetDropdown(plan.preset);
  }
  if (plan.networkNameField) {
    await planDesignerPage.sendKeys(planDesignerPage.networkNameField, plan.networkNameField);
  }
  if (plan.rates) {
    await planDesignerPage.clickElement(planDesignerPage.ratesTab);
    await planDesignerPage.setRates(plan.rates);
  }
}

export async function savePlanWithDefaultState(quote) {
  await planDesignerPage.clickAddPlanForProduct(quote.productLine);
  await planDesignerPage.clickElement(planDesignerPage.savePlanButton);
}

export async function clickImportPlanBtnForProduct(quote) {
  await planDesignerPage.isVisible(planDesignerPage.clickImportFupPlanBtnForProduct);
  await planDesignerPage.clickImportFupPlanBtnForProduct(quote.productLine);
}

export async function savePlan() {
  await planDesignerPage.clickElement(planDesignerPage.savePlanButton);
  if (await checkPlanAvailabilityDialog.isElementExist(checkPlanAvailabilityDialog.continueButton)) {
    await checkPlanAvailabilityDialog.clickElement(checkPlanAvailabilityDialog.continueButton);
  }
}

export async function startGeneratingQuotes() {
  await planDesignerPage.waitForElementToBeClickableShort(planDesignerPage.generateQuoteButton);
  await planDesignerPage.clickElement(planDesignerPage.generateQuoteButton);
  if (await planDesignerPage.isPresent(planDesignerPage.continueButton)) {
    await planDesignerPage.clickElement(planDesignerPage.continueButton);
  }
}

export async function populateBenefitValue(benefit: any) {
  switch (benefit.type) {
    case 'radio': {
      await planDesignerPage.clickRadioOption(benefit.slug, benefit.value);
      break;
    }
    case 'range': {
      await planDesignerPage.setSliderValue(benefit.slug, benefit.value);
      break;
    }
    case 'input': {
      //TODO
      break;
    }
    case 'select': {
      await planDesignerPage.setSelectOption(benefit.slug, benefit.value);
      break;
    }
    default: {
      throw new Error(`Unsupported benefit type '` + benefit.type + `'. Check your custom plan json`);
    }
  }
}

async function verifyBenefits(worldContext, customPlan: string) {
  const benefitsFile = await worldContext.testData.getCustomPlanJson(worldContext, customPlan);

  for (const benefit of benefitsFile.benefits) {
    const benefitLocator = planDesignerPage.benefitLocator(benefit.slug, benefit.type);
    const isBenefitVisible = await planDesignerPage.isVisible(benefitLocator);
    worldContext.assert.equal(isBenefitVisible, true);

    // Add benefit value verification here
  }
}

async function assertBtnIsVisible(worldContext, element) {
  await browser.waitForAngularEnabled(false);
  worldContext.assert.isTrue(await planDesignerPage.isVisible(element), `'${element}' button displays enabled`);
  await browser.waitForAngularEnabled(true);
}

export async function assertActionsIsDisabled(worldContext) {
  worldContext.assert.isFalse(
    await planDesignerPage.isVisible(planDesignerPage.actionsDropdownMenuOnPlanDesigner),
    `'${planDesignerPage.actionsDropdownMenuOnPlanDesigner}'Action drowpdown is enable and should be disable`
  );
}

async function assertSaveBtnIsDisabled(worldContext) {
  await assertBtnIsVisible(worldContext, planDesignerPage.savePlanDisabledButton);
}

async function assertSaveBtnIsEnabled(worldContext) {
  await assertBtnIsVisible(worldContext, planDesignerPage.savePlanButton);
}

export async function assertViewRatesBtnIsDisabled(worldContext) {
  await assertBtnIsVisible(worldContext, planDesignerPage.viewRatesDisabledButton);
}

export async function assertViewRatesBtnIsEnabled(worldContext) {
  await assertBtnIsVisible(worldContext, planDesignerPage.viewRatesEnabledButton);
}

async function assertSavedPlanIconVisible(context) {
  await browser.waitForAngularEnabled(false);
  context.assert.isTrue(
    await planDesignerPage.isSavedPlanIconVisible(context.customPlan.plan_name),
    `'Saved' icon doesn't display for a custom plan`
  );
  await browser.waitForAngularEnabled(true);
}

export class CustomPlansData {
  private readonly customPlanJsonFiles: [];

  constructor(dataTable: any) {
    this.customPlanJsonFiles = dataTable.raw();
  }

  public get allCustomPlans(): [] {
    return this.customPlanJsonFiles;
  }

  public async getCustomPlan(context, rowIdx: number) {
    // Change this to use first column to grab filename
    return await context.testData.getCustomPlanJson(context, this.customPlanJsonFiles[rowIdx][0]);
  }
}
