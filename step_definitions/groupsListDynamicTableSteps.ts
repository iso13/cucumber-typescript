import { When, Then } from 'cucumber';
import { GroupsListDynamicTablePage } from '../pages/groupsListDynamicTablePage';
import { HomePage } from '../pages/homePage';
import * as moment from 'moment';
import { selectBroker } from './brokerSelectionSteps';
import { reassignDialog } from '../pages/dialogs/reassignDialog';
import { slow } from 'blue-harvest';
import { by } from 'protractor';

const groupsListPage = new GroupsListDynamicTablePage();
const homePage = new HomePage();
const reassigDlg: reassignDialog = new reassignDialog();

When(/^I select the group from the list of groups$/, async function() {
  await groupsListPage.clickFirstGroupLink();
});

When(/^I navigate to group list$/, async function() {
  await homePage.clickGroups();
});

When('I sort {string} column in {string} order', async function(columnName: string, sortOrder: string) {
  await groupsListPage.setColumnOrder(columnName, sortOrder);
});

Then('I should be able to see groups sorted by {string} in {string} order', async function(
  columnName: string,
  sortOrder: string
) {
  const order = await groupsListPage.checkColumnOrder(columnName, sortOrder);
  this.assert.isTrue(order, `The column '${columnName}'  is not on the expected order '${sortOrder}'`);
});

When('I filter groups by {string} status', async function(state: string) {
  if (state === 'Rejected') {
    state = 'declined';
  }
  state = state.toLowerCase();
  await groupsListPage.selectStateFilter(state);
});

Then('I should be able to see groups with {string} status', async function(state: string) {
  await groupsListPage.waitForElementIsNotDisplayedLocator(groupsListPage.processingDialogLocator);
  for (let entry = 1; entry < (await groupsListPage.getTableSize()); entry++) {
    let elementstate = await groupsListPage.getGroupElement(entry, (await groupsListPage.getColumnId('Status')) + 1);
    this.assert.isTrue(state === elementstate, `The state is not the expected state: '${elementstate}' `);
  }
});

Then('I should be able to see groups with {string} on their name', async function(expectedName: string) {
  await groupsListPage.waitForElementIsNotDisplayedLocator(groupsListPage.processingDialogLocator);
  for (let entry = 1; entry < (await groupsListPage.getTableSize()); entry++) {
    let groupName = await groupsListPage.getGroupElement(entry, (await groupsListPage.getColumnId('Group')) + 1);
    groupName = groupName.toLocaleLowerCase();
    this.assert.isTrue(
      groupName.includes(expectedName.toLocaleLowerCase()),
      `The group does not contain the expected name: '${groupName}' `
    );
  }
});

Then('I should be able to see groups with {string} on their {string}', async function(
  expectedValue: string,
  attribute: string
) {
  await groupsListPage.waitForElementIsNotDisplayedLocator(groupsListPage.processingDialogLocator);
  for (let entry = 1; entry < (await groupsListPage.getTableSize()); entry++) {
    let attributeValue = await groupsListPage.getGroupElement(entry, (await groupsListPage.getColumnId(attribute)) + 1);
    attributeValue = attributeValue.toLocaleLowerCase();
    this.assert.isTrue(
      attributeValue.includes(expectedValue.toLocaleLowerCase()),
      `The group does not contain the expected attribute value: '${attributeValue}' `
    );
  }
});

When(/^I clean the search bar$/, async function() {
  await groupsListPage.cleanSearchGroup();
});

When(/^I delete the created group from groups list$/, async function() {
  await groupsListPage.searchGroup(this.groupName);
  await groupsListPage.waitForGroupLoad(this.groupName);
  await groupsListPage.clickElement(groupsListPage.actionsButtonLocator);
  await groupsListPage.deleteFirstGroup();
});

When('I change the number of entries to {string}', async function(numberPerPage: string) {
  await groupsListPage.setNumberOfGroupsPerPage(numberPerPage);
});

Then(/^the group doesn't display in the list$/, async function() {
  const groupXpath = groupsListPage.groupExistingLocator.replace('name', this.groupName);
  const groupLocator = by.xpath(groupXpath);
  this.assert.isFalse(await groupsListPage.isPresent(groupLocator), 'The group is still being shown');
});

Then('the number groups should match {string} and be displayed on the label', async function(expectedSize: string) {
  await groupsListPage.waitForElementIsNotDisplayedLocator(groupsListPage.processingDialogLocator);
  const labelsize = await groupsListPage.getLabelSize();
  const size = await groupsListPage.getTableSize();
  const expetedSizeNumbers = Number(expectedSize);
  this.assert.isTrue(size === labelsize, `The size is not the expected expected '${size}' actual '${labelsize}'`);
  this.assert.isTrue(
    size <= expetedSizeNumbers,
    `The size is not the expected expected '${expetedSizeNumbers}' actual '${size}'`
  );
});

Then(/^the next and previuos elements should be shown$/, async function() {
  this.assert.isTrue(await groupsListPage.isPresent(groupsListPage.nextPageLocator), 'The next button was not found');
  this.assert.isTrue(
    await groupsListPage.isPresent(groupsListPage.previousPageLocator),
    'The previus button was not found'
  );
  this.assert.isTrue(await groupsListPage.isPresent(groupsListPage.idPageLocator), 'The first page is not found');
});

Then(/^the number groups should match the default and be displayed on the label$/, async function() {
  await groupsListPage.waitForElementIsNotDisplayedLocator(groupsListPage.processingDialogLocator);
  const size = await groupsListPage.getTableSize();
  const labelsize = await groupsListPage.getLabelSize();
  this.assert.isTrue(size === labelsize, `The size is not the expected expected '${size}' actual '${labelsize}'`);
});

Then(/^I should see the group as nested$/, async function() {
  await groupsListPage.waitForElementPresenceLocator(groupsListPage.nestedGroupLocator);
  this.assert.isTrue(await groupsListPage.isPresent(groupsListPage.nestedGroupLocator), '');
});

When(/^I should be able to expand the group and access it$/, async function() {
  await groupsListPage.clickElement(groupsListPage.nestedGroupLocator);
  await groupsListPage.clickFirstInnerGroupLink();
});

When(/^I search for groups including "(.+)" on their properties$/, async function(group: string) {
  await groupsListPage.searchGroupAndWaitForResults(group);
});

When(/^I search for groups including "(.+)"$/, async function(group: string) {
  await groupsListPage.searchGroup(group);
});

When(/^I search the created group from the list of groups$/, async function() {
  await groupsListPage.searchGroup(this.groupName);
  await groupsListPage.waitForGroupLoad(this.groupName);
});

When(/^I select the created group from the list of groups$/, async function() {
  await groupsListPage.searchGroup(this.groupName);
  await groupsListPage.clickSpecificGroupLink(this.groupName);
});

When('I reassign group owner to {string} from groups list', async function(ownerName: string) {
  await groupsListPage.searchGroup(this.groupName);
  await groupsListPage.clickSelectedGroupActions(this.groupName);
  const reassignVisible = await groupsListPage.isWaitedAndVisible(groupsListPage.reassignButtonLocator);
  this.assert.isTrue(reassignVisible, `Reassign is not displayed on a valid user`);
  await groupsListPage.clickElement(groupsListPage.reassignButtonLocator);
  await selectBroker(ownerName);
  await reassigDlg.waitForDialogToDisplay();
  await reassigDlg.acceptReassign();
});

Then(/^basic group info displays in the list of groups$/, async function() {
  this.assert.isTrue(await groupsListPage.isPresent(groupsListPage.searchField), 'The search box was not found');
  this.assert.isTrue(
    await groupsListPage.isPresent(groupsListPage.groupsListingTable),
    'the group table was not found'
  );
});

Then(/^The due date column value match with the group profile due date$/, async function() {
  await groupsListPage.searchGroup(this.groupName);

  const groupListDueDateStr = await groupsListPage.getFirstGroupDueDate();

  const groupDueDate: Date = moment(this.groupDueDate, 'MM-DD-YYYY').toDate();
  const grouplistDueDate: Date = moment(groupListDueDateStr, 'MMM-DD-YYYY').toDate();

  this.assert.equalDate(
    groupDueDate,
    grouplistDueDate,
    `The due date for your group in the group list does not match with your due date in your profile page`
  );
});

Then(/^group can not be reassigned on group list$/, async function() {
  await groupsListPage.searchGroup(this.groupName);
  await groupsListPage.clickSelectedGroupActions(this.groupName);
  const reassignVisible = await groupsListPage.isWaitedAndVisible(groupsListPage.reassignButtonLocator);
  this.assert.isFalse(reassignVisible, `Reassign is displayed on a invalid user`);
});

Then(/^I can see the expected columns for my role:$/, async function(dataTable: any) {
  let missingColumns: Array<string> = new Array();
  for (let entry of dataTable.hashes()) {
    const isColumnVisible = await groupsListPage.isColumnNameDisplayed(entry[`Column name`]);
    if (!isColumnVisible) {
      missingColumns.push(entry[`Column name`]);
    }
  }
  this.assert.isTrue(missingColumns.length === 0, `Expected columns: '${missingColumns}' are not visible.`);
});

When(/^I look for group and open its Actions "(.+)"$/, async function(group: string) {
  await showActionsStatus(group);
});

When(/^I update the status to "(.+)"$/, async function(status: string) {
  await setNewStatus(status);
});

Then(/^I should get the status at grouplist updated to ([^"]+)$/, async function(status: string) {
  const newStatus = await groupsListPage.getStatusGroup(this.groupName);
  this.assert.strictEqual(newStatus, status);
});

Then(/^I can see the new status to the group "(.+)" and "(.+)"$/, async function(group: string, status: string) {
  const newStatus = await groupsListPage.getStatusGroup(group);
  this.assert.strictEqual(newStatus, status);
});

export async function showActionsStatus(group: string) {
  await homePage.clickGroups();
  await groupsListPage.getChangeStatusGroup(group);
  await groupsListPage.clickElement(groupsListPage.performAction);
}

export async function setNewStatus(status: string) {
  await groupsListPage.setNewStatus(status);
  await groupsListPage.clickElement(groupsListPage.updateStatus);
}
