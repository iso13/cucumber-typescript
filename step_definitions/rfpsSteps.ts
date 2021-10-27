import { Then } from 'cucumber';
import { RfpsPage } from '../pages/rfpsPage';
import { Navigation } from '../pages/navigation';
import { SavedProposalsPage } from '../pages/savedProposalsPage';
import * as moment from 'moment';

const rfpsPage: RfpsPage = new RfpsPage();
const navigation: Navigation = new Navigation();
const savedProposalsPage: SavedProposalsPage = new SavedProposalsPage();

Then(/^User is able to see the RFPs listing page$/, async function() {
  const isVisible = await rfpsPage.waitForRFPsAreVisible();
  this.assert.isTrue(isVisible, 'User is not able to see the RFPs Listing page');
});

Then(/^The Rfps are listed by created date in descending order$/, async function() {
  const createdDates = await getRFPCreatedDates();
  const isSorted = await this.dateHelper.isArraySorted(createdDates);
  this.assert.isTrue(isSorted, 'RFPs are not sorted by created dated in descending order');
});

Then(/^I am able to find the created RFP manually$/, async function() {
  await rfpsPage.goToTheLastPage();
  const rfpMap = await rfpsPage.findRFPByGroupNameInPage(this.groupName);
  this.assert.isTrue(
    rfpMap.size !== 0,
    'New RFP was not found. This can be because it was not added  by the created date in descending order'
  );
});

Then(/^I am able to find the created RFP by using the searcher$/, async function() {
  await rfpsPage.searchRFP(this.groupName);
  const expectedRfp = this.groupName;
  const actualRfp = await rfpsPage.getFirstRFPGroupName();
  this.assert.strictEqual(actualRfp, expectedRfp, 'The RFP was not created or searcher is not working properly');
});

Then(/^I am not able to create an RFP$/, async function() {
  await navigation.groupNavigationSelectPages('Proposals');
  const isVisible = await savedProposalsPage.isRFPButtonVisible();
  this.assert.isFalse(isVisible, 'User is being allowed to create RFPs');
});

export async function getRFPCreatedDates(): Promise<Date[]> {
  const createdDatesStr: string[] = await rfpsPage.getRFPsCreatedDates();
  let createdDates: Date[] = new Array<Date>();
  for (let index = 0; index < createdDatesStr.length; index++) {
    const createdDate = createdDatesStr[index];
    const date: Date = moment(createdDate, 'MM-DD-YYYY hh:mm a').toDate();
    createdDates.push(date);
  }
  return createdDates;
}
