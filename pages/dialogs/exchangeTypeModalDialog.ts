import { Locator, by, element, ElementFinder, ElementArrayFinder } from 'protractor';
import BaseDialog from './baseDialog';

export class ExchangeTypeModalDialog extends BaseDialog {
  private _exchangeType: string;
  public readonly exchangeIButton: Locator = by.id('action-toggleett-Exchange I');
  public readonly exchangeIIButton: Locator = by.id('action-toggleett-Exchange II');
  public readonly exchangeIIIButton: Locator = by.id('action-toggleett-Exchange III');
  public readonly exchangeIVButton: Locator = by.id('action-toggleett-Exchange IV');
  public readonly exchangeXIButton: Locator = by.id('action-toggleett-Exchange XI');
  public readonly nextButton: Locator = by.id('action-next');

  get exchangeType(): string {
    return this._exchangeType;
  }

  set exchangeType(type: string) {
    this._exchangeType = type;
  }
}
