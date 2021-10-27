import { Given, When, Then } from 'cucumber';
import { GroupProfilePage } from '../pages/groupProfilePage';
import { UploadCensusPage } from '../pages/uploadCensusPage';
import * as ZipCodeData from '../testData/trinet/group/zip_codes_verification.json';
import { selectBroker } from './brokerSelectionSteps';
import { createAGroup } from './workflows/groupWorkflows';
import { reassignDialog } from '../pages/dialogs/reassignDialog';
import { Locator, by, element } from 'protractor';
import { click, rightOf, inside, slow } from 'blue-harvest';
import { GroupsListDynamicTablePage } from '../pages/groupsListDynamicTablePage';
import { navigateInsideGroupIfNeeded, groupNavigationSelectPages } from './navigationSteps';

const groupProfile: GroupProfilePage = new GroupProfilePage();
const uploadCensus: UploadCensusPage = new UploadCensusPage();
const groupsListDynamicTablePage: GroupsListDynamicTablePage = new GroupsListDynamicTablePage();
const reassignDLG: reassignDialog = new reassignDialog();

let companyName: string;

Given('I create a new group with {string}', async function(groupFile: string) {
  const groupJson = await this.json.getJsonFromFile('/group/' + groupFile, this.implementation);
  await slow.see('CREATE GROUP');
  await createAGroup(this, groupJson);
});

Then('A group should be successfully created', async function() {
  this.assert.strictEqual(
    await element(uploadCensus.headerLocator).getText(),
    'Upload a Census File',
    'Group was not successfully created'
  );
});

Then(/^"(.+)" should be displayed, when user hovers over (.+) product icons?$/, async function(
  expectedMessage: string,
  products: string
) {
  let productsList: Array<string> = this.testData.convertStringToArray(products);
  for (let product of productsList) {
    const actualMessage = await groupProfile.getProductValidationMessage(product);
    this.assert.include(actualMessage, expectedMessage);
  }
});

Then(/^"(.+)" should be displayed under the Number of Eligible Lives entry box$/, async function(message: string) {
  let messageField = await groupProfile.getElementText(groupProfile.fieldErrorText);
  this.assert.strictEqual(messageField, message, 'The message is not the expected');
});

When('I populate all group profile fields with valid data', async function() {
  const groupJson = await this.testData.getGroupJson(this, 'i_have_a_group');
  await fillGroupData(this, groupJson);
});

When(/^I set the effective date on (.+)$/, async function(effectiveDate: string) {
  await setEffectiveDateDirectly(effectiveDate);
});

When(/^I set the effective date one year in the past$/, async function() {
  await setEffectiveDateOneYearAgo(this);
});

When(/^I populate some group profile fields with data$/, async function(data: any) {
  const groupJson = await this.testData.getGroupJson(this, data.raw()[0]);
  await fillGroupData(this, groupJson);
});

When(/^I fill in all the group profile fields except the (.+)$/, async function(profileFieldName: string) {
  const groupJson = await this.testData.getGroupJson(this, 'i_have_a_group');
  await fillGroupData(this, groupJson);
  await clearProfileField(profileFieldName);
});

When('I input {int} eligible employees', async function(number_of_eligible_ees) {
  await groupProfile.setNumberOfEligibleEEs(number_of_eligible_ees);
});

When(/^I populate SIC field with (.+) code$/, async function(sicCode: string) {
  await groupProfile.setSicCode(sicCode);
});

When(/^I select (.+) line$/, async function(productShortName: string) {
  await navigateInsideGroupIfNeeded(`Profile`);
  await groupProfile.clickProductLineBtn(productShortName);
});

When(/^I get the due date from the group profile$/, async function() {
  this.groupDueDate = await groupProfile.getElementValue(groupProfile.dueDateLocator);
});

export async function setEffectiveDateOneYearAgo(worldContext) {
  let currentDate = await groupProfile.getQuoteEffectiveDate();
  let current = new Date(Date.parse(currentDate));
  current.setFullYear(current.getFullYear() - 1);
  const defaultEffectiveDate = await worldContext.dateHelper.getEffectiveDateString(current.toISOString());
  await groupProfile.setQuoteEffectiveDate(defaultEffectiveDate);
}

export async function fillGroupData(worldContext, params) {
  if (params.broker_selection === true) {
    await selectBroker(params.broker_name);
  }
  if (params.agent_selection === true) {
    await groupProfile.selectAgent();
  }
  if (params.owner) {
    //perform steps to assign owner
  }
  if (params.city) {
    await groupProfile.sendKeys(groupProfile.cityField, params.city);
  }
  if (params.name_duplicatable) {
    const now: Date = new Date();
    let _companyName = params.name_duplicatable;
    await groupProfile.sendKeys(groupProfile.companyNameField, _companyName);
    worldContext.groupName = _companyName;
  }
  if (params.name) {
    const now: Date = new Date();
    let _companyName = params.name + ' ' + (await now.toLocaleDateString()) + ' ' + (await now.toLocaleTimeString());

    await groupProfile.sendKeys(groupProfile.companyNameField, _companyName);
    worldContext.groupName = _companyName;
    /*This is not an ideal way of entering the group name but needs to
    be done due to the linking of groups functionality.
    Setting this as tech debt to come back and cealnup*/
  }
  if (params.postal_code) {
    await groupProfile.sendKeys(groupProfile.zipCodeField, params.postal_code);
    worldContext.stateCode = await groupProfile.getElementValue(groupProfile.stateField);
  }
  if (params.sic) {
    await groupProfile.setSicCode(params.sic);
  }
  if (params.address) {
    await groupProfile.sendKeys(groupProfile.addressField, params.address);
  }
  if (params.address_2) {
    await groupProfile.sendKeys(groupProfile.addressField2, params.address_2);
  }
  if (params.number_of_eligible_ees) {
    await groupProfile.setNumberOfEligibleEEs(params.number_of_eligible_ees);
  }
  if (params.default_effective_on) {
    const defaultEffectiveDate = await worldContext.dateHelper.getEffectiveDateString(params.default_effective_on);
    await groupProfile.setQuoteEffectiveDate(defaultEffectiveDate);
  } else {
    worldContext.groupEfectiveDate = await groupProfile.getQuoteEffectiveDate();
  }
  if (params.payroll_frequency) {
    await groupProfile.setPayrollFrequency(params.payroll_frequency);
  }
  if (params.quote_lines) {
    await groupProfile.setProductLines(params.quote_lines);
  }
}

async function clearProfileField(fieldName: string) {
  const elem = await element(groupProfile.getRequiredFieldByName(fieldName));
  await elem.clear();
}

export async function setEffectiveDateDirectly(effectiveDate) {
  await groupProfile.setQuoteEffectiveDate(effectiveDate);
}

When(/^(?:I )?save (?:a|the) group$/, async function() {
  await groupProfile.clickElement(groupProfile.saveAndContinueButton);
});

Then(/^red error message for group (.+) field displays$/, async function(profileFieldName: string) {
  const redColor: string = `rgba(221, 44, 0, 1)`;
  let actualElement = await element(groupProfile.getRequiredFieldByName(profileFieldName));
  let actualFieldColor: string = await actualElement.getCssValue('border-bottom-color');
  let actualFieldText: string = await element(groupProfile.getErrorLocatorByName(profileFieldName)).getText();

  if (profileFieldName === 'Company Name') {
    await slow.see(actualFieldText.toLocaleLowerCase());
  } else {
    await slow.see(actualFieldText);
  }

  await this.expect(actualFieldColor, redColor, `One of the required fields is not highlighted with red color`);
});

Then(/^group cannot be saved \(Save button is disabled\)$/, async function() {
  groupProfile.waitForElementPresenceLocator(groupProfile.saveAndContinueButton);
  this.assert.isFalse(await groupProfile.isEnabled(groupProfile.saveAndContinueButton));
});

Given(/^I update the minimum data for the new group using zip code "([^"]*)"$/, async function(zipCode: string) {
  companyName = Math.random()
    .toString(36)
    .replace(/[^a-z]+/g, '')
    .substr(0, 6);
  let zipCodeInfo = ZipCodeData[zipCode];
  await click('Profile');
  await groupProfile.sendKeys(groupProfile.companyNameField, companyName);
  await groupProfile.sendKeys(groupProfile.zipCodeField, zipCode);
  await rightOf(zipCode)
    .rightOf(zipCodeInfo.city)
    .rightOf(zipCodeInfo.state)
    .see(zipCodeInfo.county);
});

Given(/^I should be able to save the group with the changes$/, async function() {
  await click('Save');
  await slow.see('Saved');
  await click('GROUPS');
});

Then(/^I verify the group has been modified with zip code "([^"]*)"$/, async function(zipCode: string) {
  let zipCodeInfo = ZipCodeData[zipCode];
  await slow.see('Search:');
  await groupsListDynamicTablePage.waitForProcessingDialogToDissapear();
  await groupsListDynamicTablePage.searchGroup(companyName);
  await groupsListDynamicTablePage.waitForProcessingDialogToDissapear();
  await groupsListDynamicTablePage.waitForElementPresenceLocator(
    by.xpath(groupsListDynamicTablePage.getGroupPath(companyName))
  );
  await inside(groupsListDynamicTablePage.groupsListingTable).click(companyName);
  await click('Profile');
  await rightOf(zipCode)
    .rightOf(zipCodeInfo.city)
    .rightOf(zipCodeInfo.state)
    .see(zipCodeInfo.county);
});

Then(/^state field gets filled in with (".{2}"|empty) value$/, async function(expectedStatevalue: string) {
  let actualStateValue = await groupProfile.getElementValue(groupProfile.stateField);
  if (expectedStatevalue === 'empty') {
    expectedStatevalue = '';
  }
  this.assert.strictEqual(actualStateValue, expectedStatevalue);
});

Then(/^city, state and county fields get filled in with "(.+)", "(.+)" and "(.+)" values$/, async function(
  expectedCity: string,
  expectedState: string,
  expectedCounty: string
) {
  let actualCity = await groupProfile.getElementValue(groupProfile.cityField);
  let actualState = await groupProfile.getElementValue(groupProfile.stateField);
  let actualcounty = await groupProfile.getElementValue(groupProfile.countyField);
  this.assert.strictEqual(expectedCity, actualCity);
  this.assert.strictEqual(expectedState, actualState);
  this.assert.strictEqual(expectedCounty, actualcounty);
});

Then(/^Selected "(.+)" county should be saved for the group$/, async function(expectedCounty: string) {
  await uploadCensus.clickElement(uploadCensus.backBtnLocator);
  const actualCounty: string = await groupProfile.getElementText(groupProfile.countyField);
  this.assert.strictEqual(actualCounty, expectedCounty, 'Selected county was not saved for the group');
});

When(/^I update group profile "(.+)" value to "(.+)"$/, async function(fieldName: string, fieldValue: string) {
  await navigateInsideGroupIfNeeded(`Profile`);
  switch (fieldName) {
    case `Zip Code`:
      await element(groupProfile.zipCodeField).clear();
      await groupProfile.setZipCode(fieldValue);
      break;
    default:
      throw new Error(`Group profile field [` + fieldName + `] is not found/supported`);
  }
});

When(/^I input (?:invalid )?ZIP code (.+)$/, async function(zipCode: string) {
  await groupProfile.setZipCode(zipCode);
});

Then(/^I cannot select a Quote Effective Date that is in the past$/, async function() {
  await groupProfile.clickElement(groupProfile.effectiveDateDropdownMenu);
  const actualQED: string = await groupProfile.getDropdownFirstOption();
  const expectedQED: string = this.dateHelper.getNextQuoteEffectiveDate();
  this.assert.strictEqual(actualQED, expectedQED);
});

Then(/^I unselect all product lines except (.+)$/, productSelected);
async function productSelected(productsToSelect: string) {
  await navigateInsideGroupIfNeeded(`Profile`);
  let productsList = {
    '1': { name: 'Dental' },
    '2': { name: 'Vision' },
    '3': { name: 'Group Term Life' },
    '4': { name: 'Critical Illness' },
    '7': { name: 'Short-Term Disability' },
    '8': { name: 'Long-Term Disability' },
    '9': { name: 'Voluntary Term Life' },
    '11': { name: 'Accident' }
  };
  let productsToSelectObject = { '1': { name: productsToSelect } };
  await groupProfile.setProductLines(productsList);
  await groupProfile.setProductLines(productsToSelectObject);
  await click('Save');
  await slow.see('Saved');
}

Then(/^(.+) display unselected on Group Profile page$/, unselectedProducts);
async function unselectedProducts(products: string) {
  await navigateInsideGroupIfNeeded(`Profile`);
  let productsList: Array<string> = this.testData.convertStringToArray(products);
  const isNone: boolean = productsList.length === 1 && productsList[0].toLowerCase().includes(`none`);
  if (!isNone) {
    for (let product of productsList) {
      const isActuallySelected = await groupProfile.isProductSelected(product);
      this.assert.isFalse(isActuallySelected, product + ` is not disabled or warning icon doesn't display`);
    }
  }
}

Then(/^(.+) products? (should|should not) be available for selection$/, checkProductSelected);
async function checkProductSelected(products: string, should: string) {
  let productsList: Array<string> = this.testData.convertStringToArray(products);
  const isNone: boolean = productsList.length === 1 && productsList[0].toLowerCase().includes(`none`);
  if (!isNone) {
    for (let product of productsList) {
      const isActuallyDisabled = await groupProfile.isProductDisabled(product);
      if (should === 'should') {
        this.assert.isFalse(isActuallyDisabled, product + ` is disabled`);
      } else {
        this.assert.isTrue(isActuallyDisabled, product + ` is not disabled or warning icon doesn't display`);
      }
    }
  }
}

When(/^I update the group profile info$/, async function() {
  const groupJson = await this.testData.getGroupJson(this, 'i_update_a_group');
  await groupNavigationSelectPages('Profile');
  await fillGroupData(this, groupJson);
  await groupProfile.clickElement(groupProfile.saveAndContinueButton);
  this.groupJsonData = groupJson;
});

Then(/^group can not be reassigned on profile$/, async function() {
  const reassignVisible = await groupProfile.isVisible(groupProfile.reassignButtonLocator);
  this.assert.isFalse(reassignVisible, `Change Broker is displayed on a invalid user`);
});

When('I reassign group owner to {string} from groups profile', async function(ownerName: string) {
  const reassignVisible = await groupProfile.isVisible(groupProfile.reassignButtonLocator);
  this.assert.isTrue(reassignVisible, `Change Broker is not displayed on a valid user`);
  await groupProfile.clickElement(groupProfile.reassignButtonLocator);
  await selectBroker(ownerName);
  await reassignDLG.waitForDialogToDisplay();
  await reassignDLG.acceptReassign();
});

Then('the old owner {string} is added to owners history', async function(ownerName: string) {
  await groupProfile.waitForElementToBeClickableShort(groupProfile.companyNameField);
  const historyVisible = await groupProfile.isVisible(groupProfile.historyButtonLocator);
  this.assert.isTrue(historyVisible, `History is not displayed on a valid user`);
  await groupProfile.clickElement(groupProfile.historyButtonLocator);
  const locatorPath = groupProfile.historyUserLocatorString.replace('owner', ownerName);
  const oldOwnerLocator: Locator = by.xpath(locatorPath);
  const oldOwnerVisible = await groupProfile.isVisible(oldOwnerLocator);
  this.assert.isTrue(oldOwnerVisible, `previewsOwner is not displayed on a valid user`);
});
