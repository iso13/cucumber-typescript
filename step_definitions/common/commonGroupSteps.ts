import { Given, Then } from 'cucumber';
import { GroupProfilePage } from '../../pages/groupProfilePage';
import { HomePage } from '../../pages/homePage';
import { UploadCensusPage } from '../../pages/uploadCensusPage';
import { Navigation } from '../../pages/navigation';

const groupProfile: GroupProfilePage = new GroupProfilePage();
const uploadCensus: UploadCensusPage = new UploadCensusPage();
const homePage: HomePage = new HomePage();
const navigation: Navigation = new Navigation();

Given('I navigate to current and renewal', async function() {
  await groupProfile.clickGroupNavigation('Profile');
  await groupProfile.clickElement(groupProfile.currentCoverageButton);
});
