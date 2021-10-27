import { When, Then } from 'cucumber';
import { AppMenu } from '../pages/appMenu';

const appMenu: AppMenu = new AppMenu();

When(/^Go to the listing RFPs page$/, async function() {
  await appMenu.clickNotifications();
});

When(/^(?:I )?go to the application menu$/, async function() {
  await appMenu.openMenu();
});

When(/^(?:I )?get the number of notifications$/, async function() {
  await appMenu.openMenu();
  this.notificationsCount = await appMenu.getNumberOfNotifications();
});

Then(/^the number of notifications increase$/, async function() {
  await appMenu.openMenu();
  const currentNotifications = await appMenu.getNumberOfNotifications();
  this.assert.isTrue(
    currentNotifications > this.notificationsCount,
    `The number of notifications are not the expected`
  );
});

Then(/^a notification section is (.+)?shown on the application menu$/, async function(notshown: any) {
  const notifiactionsVisible: boolean = await appMenu.isVisible(appMenu.notificationsLocator);
  if (notshown) {
    this.assert.isFalse(notifiactionsVisible, `Notifications is shown on the menu`);
  } else {
    this.assert.isTrue(notifiactionsVisible, `Notifications is not shown on the menu`);
  }
});
