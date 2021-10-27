import { Locator, by } from 'protractor';
import BasePage from './basePage';

export class PreviewProposalPage extends BasePage {
  public readonly saveProposalButton: Locator = by.css("button[ng-click='vm.save()']");
  public readonly errorDialog: Locator = by.xpath("//md-dialog[@id='requote-errors']");
  public readonly errorOnSave: Locator = by.xpath("//*/li[contains(.,'Group is past effective date')]");
  public readonly savePrincipalProposal: Locator = by.css('.proposal-action-bar #action-proposal-next');
}
