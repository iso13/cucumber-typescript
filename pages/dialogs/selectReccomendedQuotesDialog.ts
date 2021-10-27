import { by, Locator } from 'protractor';
import BaseDialog from './baseDialog';

export class SelectRecommendedQuoteDialog extends BaseDialog {
  public readonly nextButton = by.css("button[ng-click='vm.save()']");
}
