import { Locator, by } from 'protractor';
import BasePage from './basePage';

export class SideBySidePage extends BasePage {
  public readonly actionSaveButton: Locator = by.id('action-save-quote');
}
