import { $, ElementFinder, Locator, by, element, ElementArrayFinder, browser } from 'protractor';
import BasePage from './basePage';
import UnsupportedBrowserDialog from './dialogs/login/unsupportedBrowserDialog';

export class LoginPage extends BasePage {
  public readonly companyLogo: Locator = by.css('.login-logo');
  public readonly passwordField: ElementFinder = $('#loginPassword');
  public readonly emailField: ElementFinder = $('#loginId');
  public readonly loginButton: ElementFinder = $('#submitLogin');
  public readonly invalidCredsErrorMessage: ElementFinder = $('div[ng-if*="errorMessage"]');
  public readonly unsupportedBrowserDialog: UnsupportedBrowserDialog;

  public constructor() {
    super();
    this.unsupportedBrowserDialog = new UnsupportedBrowserDialog();
  }
}
