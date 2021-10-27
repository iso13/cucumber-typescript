import { Then, When } from 'cucumber';
import { click, slow, type, under } from 'blue-harvest';
import { by } from 'protractor';
import * as faker from 'faker';

When('I associate the group with a broker', async function() {
  await slow.see('CREATE GROUP');
  await click('CREATE GROUP');
  await click(by.css('tr:nth-of-type(1) > .sorting_1'));
});

When('I fill in my group information', async function() {
  await slow.see('Company Name');
  await click(by.css('input#fl-input-2'));
  await type(faker.company.companyName());
  await click(by.css('input#info-input-zip-code'));
  await type('94117');
  await under('SIC Code:').click(by.css('input#input-4'));
  await click('0112: rice');
  await under('Group Type').click(by.css('input#input-info-employee-count'));
  await type('10');
  await click(by.css('.circle-icon.core-icon-long-term-disability'));
  await click(by.css('.circle-icon.core-icon-critical'));
  await click(by.css('.circle-icon.core-icon-hospital'));
  await click('Save & Continue');
});

When('I fill in my group information with a multi-county zip', async function() {
  await slow.see('Company Name');
  await click(by.css('input#fl-input-2'));
  await type(faker.company.companyName());
  await click(by.css('input#info-input-zip-code'));
  await type('60548');
  await click(by.css(".flex-100.ng-binding > md-select[role='listbox']"));
  await click('Kendall');
  await click('Done');
  await under('SIC Code:').click(by.css('input#input-4'));
  await click('0112: rice');
  await under('Group Type').click(by.css('input#input-info-employee-count'));
  await type('10');
  await click(by.css('.circle-icon.core-icon-long-term-disability'));
  await click(by.css('.circle-icon.core-icon-critical'));
  await click(by.css('.circle-icon.core-icon-hospital'));
  await click('Save & Continue');
});

Then('I should be able to save a group', async function() {
  await slow.see('Upload a Census File');
});
