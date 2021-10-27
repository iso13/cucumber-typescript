import { When } from 'cucumber';
import { Locator } from 'protractor';
import { SmallGroupQuestionDialog } from '../../pages/dialogs/smallGroupQuestionDialog';

const smallGroupQuestionDialog: SmallGroupQuestionDialog = new SmallGroupQuestionDialog();

When(/^I answer "([^"]+)" to the small group question$/, async function(answer: string) {
  const locatorToClick: Locator =
    answer === 'Yes' ? smallGroupQuestionDialog.yesOption : smallGroupQuestionDialog.noOption;
  await smallGroupQuestionDialog.clickElement(locatorToClick);
  await smallGroupQuestionDialog.clickElement(smallGroupQuestionDialog.saveButton);
});
