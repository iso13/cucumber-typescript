import { Locator, by } from 'protractor';
import BasePage from '../basePage';

export default abstract class ModelingPage extends BasePage {
  public readonly saveQuoteButton: Locator = by.id('action-save-quote');
}
