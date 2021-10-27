import { by } from 'protractor';
import BaseDialog from './baseDialog';

export class AutoMappingPlanSelectionDialog extends BaseDialog {
  public readonly okButton = by.css("button[ng-click='vm.closeModal()']");
}
