import { Given } from 'cucumber';
import { SelectBrokerPage } from '../pages/selectBrokerPage';

const selectBrokerPage: SelectBrokerPage = new SelectBrokerPage();

Given(/^I select "(.+)" as an? (?:broker|producer|owner) for a group$/, async function(brokerName: string) {
  await selectBroker(brokerName);
});

export async function selectBroker(brokerName: string) {
  await selectBrokerPage.enterBrokerName(brokerName);
  await selectBrokerPage.clickAddBroker();
}
