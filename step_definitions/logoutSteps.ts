import { Given, When, Then } from 'cucumber';
import { AppMenu } from '../pages/appMenu';
import { LoginPage } from '../pages/loginPage';

const login: LoginPage = new LoginPage();
const appMenu: AppMenu = new AppMenu();

Given('I sign out from the app', async function() {
  await appMenu.signOut();
  await login.waitForElementVisibility(login.emailField);
});

Given('I sign out from the app on current menu', async function() {
  await appMenu.signoutWhenOpenedMenu();
  await login.waitForElementVisibility(login.emailField);
});
