import { Given, When } from 'cucumber';
import { Navigation } from '../pages/navigation';
import { GroupProfilePage } from '../pages/groupProfilePage';
import { CensusPage } from '../pages/censusPage';
import { ClassesPage } from '../pages/classesPage';
import { PlanDesignerPage } from '../pages/planDesignerPage';
import { SavedProposalsPage } from '../pages/savedProposalsPage';
import { click, slow } from 'blue-harvest';

const navigation: Navigation = new Navigation();
const groupProfile: GroupProfilePage = new GroupProfilePage();
const editCensus: CensusPage = new CensusPage();
const classesPage: ClassesPage = new ClassesPage();
const planDesignerPage: PlanDesignerPage = new PlanDesignerPage();
const savedProposalsPage: SavedProposalsPage = new SavedProposalsPage();

Given('(I )Navigate to {string}', async function(url: string) {
  await navigation.navigateTo(url);
});

Given('I navigate to group home', async function() {
  await navigation.clickElement(navigation.groupHome);
});

Given('I navigate to group list from a group', async function() {
  await navigation.clickElement(navigation.groupList);
});

When('I navigate to home', async function() {
  await navigation.navigateToOption('home');
});

When('I navigate to the group {string} tab', async function(tab: string) {
  await slow.see(tab);
  await click(tab);
});

When('I navigate back to {string} page', async function(pageName: string) {
  await groupNavigationSelectPages('classes');
  await groupNavigationSelectPages(pageName);
});

When('I navigate to the {string} tab', async function(tab: string) {
  await slow.see(tab);
  await click(tab);
});

export async function NavigateToOption(page: string) {
  await navigation.navigateToOption(page);
}

export async function groupNavigationSelectPages(page: string) {
  await navigation.groupNavigationSelectPages(page);
}

export async function navigateInsideGroupIfNeeded(ingroupPageName: string) {
  let isPageCurrentlyDisplayed: boolean;
  switch (ingroupPageName.toLowerCase()) {
    case `profile`:
      isPageCurrentlyDisplayed = await groupProfile.isVisible(groupProfile.companyNameField);
      break;
    case `census`:
      isPageCurrentlyDisplayed = await editCensus.isVisible(editCensus.headerLocator);
      break;
    case `classes`:
      isPageCurrentlyDisplayed = await editCensus.isVisible(classesPage.allBenefitTypesTitle);
      break;
    case `plans`:
      isPageCurrentlyDisplayed = await planDesignerPage.isVisible(planDesignerPage.planDesignerPageTitle);
      break;
    case `proposals`:
      isPageCurrentlyDisplayed = await savedProposalsPage.isVisible(savedProposalsPage.proposalActionsDropdown);
      break;
    default:
      throw new Error(`Navigation to [` + ingroupPageName + `] currently is not supported`);
  }
  if (!isPageCurrentlyDisplayed) {
    await groupNavigationSelectPages(ingroupPageName);
  }
}
