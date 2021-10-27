import { by, Locator } from 'protractor';
import BaseDialog from './baseDialog';

export class soldProposalNoteDialog extends BaseDialog {
  public readonly saveBtn: Locator = by.css('#action-done');
  public readonly optionalNote: Locator = by.css('#activity_note');

  public async fillOptionalNote(note: string) {
    await this.sendKeys(this.optionalNote, note);
    await this.clickElement(this.saveBtn);
  }
}
