import { Then, When } from 'cucumber';
import { element, ElementFinder } from 'protractor';
import { SavedProposalsPage } from '../pages/savedProposalsPage';
import { BaseProposalPage } from '../pages/proposalPdf/baseProposalPage';
import { navigateInsideGroupIfNeeded, groupNavigationSelectPages } from './navigationSteps';
import { agonizinglySlow, slow } from 'blue-harvest';

const savedProposalsPage: SavedProposalsPage = new SavedProposalsPage();
const baseProposalPage: BaseProposalPage = new BaseProposalPage();

Then(/^A proposal should be successfully created(?: for my group)?$/, async function() {
  await savedProposalsPage.waitForElementPresenceLocator(savedProposalsPage.createProposalBtn);
  const savedProposals: ElementFinder[] = await savedProposalsPage.getElements(savedProposalsPage.proposalNameField);

  const actualNumberOfSavedProposals: number = savedProposals.length;
  this.assert.strictEqual(
    actualNumberOfSavedProposals,
    1,
    'A proposal was not successfully created or there are more than one proposals for the group'
  );
});

Then('A requoted proposal should be successfully created for my group', async function() {
  let savedProposalElements: ElementFinder[] = await element.all(savedProposalsPage.proposalNameField);
  let actualNumberOfsavedProposals: number = savedProposalElements.length;
  this.assert.strictEqual(actualNumberOfsavedProposals, 2, 'A proposal was successfully requoted');
});

Then('The Excel file is downloaded correctly', async function() {
  const isProposalDownloaded = await this.fileSystem.isFileDownloaded(this.proposalFileName);
  this.assert.isTrue(
    isProposalDownloaded,
    `Proposal file [` + this.proposalFileName + `] is not downloaded successfully`
  );
});

When('I open my proposal', async function() {
  await savedProposalsPage.clickElement(savedProposalsPage.proposalActionsDropdown);
  await savedProposalsPage.clickProposalAction('Preview Proposal');
  await baseProposalPage.goToPdfUrl();
});

Then(/^Download of Excel Export should be disabled for an invalid proposal$/, async function() {
  await navigateInsideGroupIfNeeded(`proposals`);
  await savedProposalsPage.clickElement(savedProposalsPage.proposalActionsDropdown);
  await assertDownloadExcelExportIsDisabled(this);
});

When(/^I download my proposal in Excel format$/, async function() {
  await slow.see(savedProposalsPage.proposalActionsDropdown);
  await savedProposalsPage.waitForElementPresenceLocator(savedProposalsPage.proposalActionsDropdown);
  await savedProposalsPage.clickElement(savedProposalsPage.proposalActionsDropdown);
  await savedProposalsPage.clickProposalAction('Download Excel Export');
  this.proposalFileName = camelize(this.groupName) + '_' + camelize(this.groupName) + 'Proposal.xlsx';
  await savedProposalsPage.closeLoadingDialog();
});

Then('proposal status should be set to {string}', async function(status: string) {
  await groupNavigationSelectPages('proposals');
  this.assert.strictEqual(await savedProposalsPage.getProposalStatus(), status, 'The proposal should be declined');
});

Then(/^the proposal should not be actionable$/, async function() {
  await groupNavigationSelectPages('proposals');
  this.assert.isTrue(
    await savedProposalsPage.isSavedProposalActionable(),
    'Proposal actions button should be disabled'
  );
  this.assert.isTrue(await savedProposalsPage.isNoGoIconVisible(), 'The no go icon should be displayed');
});

function camelize(groupName: string): string {
  return groupName
    .replace(/(?:^\w|[A-Z]|\b\w|\s+)/g, match => {
      if (Number(match) === 0) {
        return '';
      }
      return match.toUpperCase();
    })
    .replace(/\W/g, '');
}

async function assertDownloadExcelExportIsDisabled(worldContext) {
  worldContext.assert.isTrue(
    await savedProposalsPage.isVisible(savedProposalsPage.downloadExcelExportDisabledButton),
    `'Download Excel Export' button displays enabled`
  );
}
