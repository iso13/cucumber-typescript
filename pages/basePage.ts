import { browser, element, Locator, by, ElementFinder, protractor } from 'protractor';
import { TYPES } from '../types';
import Logger from '../support/logger/logger';
import ImageComparison from '../support/imageComparison/imageComparison';
import { registry } from '../inversify.config';

export default abstract class BasePage {
  private TIMEOUT_MILLIS = 20000;
  private SHORT_TIMEOUT_MILLIS = 10000;
  private EXCEPTIONAL_LONG_TIMEOUT_MILLIS = 90000;
  private LONG_TIMEOUT_MILLIS = 35000;
  private POLL_INTERVAL_MILLIS: number = 20000;

  protected readonly logger = registry.get<Logger>(TYPES.Logger);
  public readonly imageComparison = registry.get<ImageComparison>(TYPES.ImageComparison);

  private dropdownOptionsLocator: Locator = by.xpath(
    "//div[@class='md-select-menu-container md-active md-clickable'] //md-option"
  );
  private dropdownOptionsExactMatchLocatorText: string =
    "//div[@class='md-select-menu-container md-active md-clickable']//md-option/div[text()='XXXXX']";
  private dropdownOptionsLocatorText: string =
    "//div[@class='md-select-menu-container md-active md-clickable']//md-option/div[text()[contains(.,'XXXXX')]]/..";
  private groupNavigationLocatorIdTxt: string = 'group-navigate-to-';
  private groupNavigationLocator: Locator = by.css('group-navigation div + div');
  private moreGroupNavigationLocator: Locator = by.id('group-navigate-to-more');
  public readonly commentsBtn: Locator = by.xpath(
    '//button[@class="md-button ng-scope ng-isolate-scope md-ink-ripple"]'
  );
  public readonly nextButton: Locator = by.xpath("//button//span[text()='Next']/..");
  public readonly walkMeCloseBtn: Locator = by.xpath(
    "//*[@class='walkme-click-and-hover walkme-custom-balloon-close-button walkme-action-close walkme-inspect-ignore']"
  );
  private dropdownFirstOptionLocator: Locator = by.xpath(
    "//div[@class='md-select-menu-container md-active md-clickable']//md-option[1]"
  );
  public readonly walkMeNotThanksBtn: Locator = by.css("span[class^='walkme-action-destroy']");
  /**
   * Improvement:
   * We could make this generic and be able to pass in the text.
   * So then any button can be clicked by text(This is a blue harvest like approach)
   */
  public readonly continueButton: Locator = by.xpath("//button//*[text()='CONTINUE']/..");

  /**
   * Wait for browser to redirect to another page or refresh the same one.
   * @param lookedupUrlFragment part of the URL you're redirecting to
   * e.g. if you try to navigate to Group List page (https://{env}/groups), you should pass 'groups'
   *
   * Added because of the occasional issue with Protractor throwing an error, while waiting to sync with the page.
   * This could be either because of non-angular page or because a scenario involves some navigation,
   * which can interfere with Protractor's bootstrapping. See http://git.io/v4gXM for details
   */
  public async waitForRedirection(lookedupUrlFragment: string): Promise<void> {
    await browser.wait(async function() {
      await browser.waitForAngularEnabled(false);
      const url: string = await browser.getCurrentUrl();
      await browser.waitForAngularEnabled(true);
      return url.includes(lookedupUrlFragment);
    }, this.TIMEOUT_MILLIS);
  }

  public async getDropdownOptionElements() {
    await this.waitForElementPresenceLocator(this.dropdownOptionsLocator);
    return element.all(this.dropdownOptionsLocator);
  }

  public async getElements(elementLocator: Locator): Promise<ElementFinder[]> {
    await this.waitForElementPresenceLocator(elementLocator);
    return await element.all(elementLocator);
  }

  public async getElementFinderText(_element: ElementFinder): Promise<string> {
    await this.waitForElementPresence(_element);
    return await _element.getText();
  }

  public async getDropdownFirstOption(): Promise<string> {
    await this.pause(200);
    return await this.getElementText(this.dropdownFirstOptionLocator);
  }

  public async getElementText(elementLocator: Locator): Promise<string> {
    await this.waitForElementPresenceLocator(elementLocator);
    return await element(elementLocator).getText();
  }

  public async clickDropdownOptionExactMatch(option: string) {
    const dynamicXpath: string = this.dropdownOptionsExactMatchLocatorText.replace('XXXXX', option);
    const optionLocator = by.xpath(dynamicXpath);
    await this.clickElement(optionLocator);
  }

  /**
   * Clicks dropdowns across the entire app. Originally implemented a
   * filter but selenium server has problems using getText() not sure why yet
   * I hate using xpaths like this but chrome has issues in protractor
   * with element finder array and getting text. This resolves the chrome issue
   * @param option
   */
  public async clickDropdownOption(option: string) {
    let dynamicXpath: string = this.dropdownOptionsLocatorText.replace('XXXXX', option);
    let optionLocator = by.xpath(dynamicXpath);
    await this.clickElement(optionLocator);
  }

  /**
   * Group navigation is available across multiple pages so the method is now available to all pages
   * @param navigation
   */
  public async clickGroupNavigation(navigation: string) {
    let groupNavElement: ElementFinder = await element(this.groupNavigationLocator);
    let selectedNavigationElement: ElementFinder = await groupNavElement.element(
      by.id(this.groupNavigationLocatorIdTxt + navigation.toLocaleLowerCase())
    );
    if (await !selectedNavigationElement.isPresent()) {
      await this.clickElement(this.moreGroupNavigationLocator);
      await this.waitForElementPresence(selectedNavigationElement);
    }
    await this.clickElementFinder(selectedNavigationElement);
  }

  /**
   * clicks the Comments button to open the Comments dialog
   */
  public async clickCommentsButton() {
    await this.clickElement(this.commentsBtn);
  }

  /**
   * This method is used for clicking element throughout the qp app
   * We use this wrapper and catch Webdriver errors due to our application using a lot of modal dialogs for loading.
   * The modal dialogs result in elements being visible but not clickable yet
   * (A problem with this method is that when we have eventually timedout the error that should display on a failed
   * click is masked)
   */
  public async clickElement(elementLocator: Locator) {
    const elem: ElementFinder = await element(elementLocator);
    await this.clickElementFinder(elem);
  }

  public async clickElements(element: ElementFinder) {
    await this.waitForElementPresence(element);
    await this.clickElementFinder(element);
  }

  /**
   * @deprecated This is an ugly solution for these failures https://limelight.atlassian.net/browse/MSTR-2350
   * Do NOT use it, if it's not absolutely needed
   * @param elementLocator Element locator to find
   */
  public async clickElementJS(elementLocator: Locator) {
    this.logger.warn(`[${BasePage.name}.${this.clickElementJS.name}] function is deprecated: try not to use it`);
    const elem: ElementFinder = await element(elementLocator);
    await browser.executeScript('arguments[0].click()', elem);
  }

  public async hoverOverElement(elementLocator: Locator) {
    const _element = await element(elementLocator);
    await browser
      .actions()
      .mouseMove(_element)
      .perform();
  }

  /**
   * scrolls element into view
   * @param _element
   * @param vertAlignment - one of "start", "center", "end", "nearest" params is possible,
   * "start" - browser will scroll, so that the element is at the top of your viewport
   * "end" - browser will scroll, so that the element is at the bottom of your viewport
   */
  public async scrollElementFinderIntoView(_element: ElementFinder, vertAlignment: string) {
    const scrollParams: string = '{behavior: "smooth", block: "' + vertAlignment + '"}';
    await browser.executeScript('arguments[0].scrollIntoView(' + scrollParams + ')', _element);
  }

  public async scrollElementIntoView(locator: Locator, vertAlignment: string) {
    const _element = await element(locator);
    await this.scrollElementFinderIntoView(_element, vertAlignment);
  }

  /**
   * Get the value of an attribute of an element
   * @param  {Locator}         elementLocator [description]
   * @param  {string}          attributeName  [description]
   * @return {Promise<string>}                [description]
   */
  public async getElementAttribute(elementLocator: Locator, attributeName: string): Promise<string> {
    await this.waitForElementPresenceLocator(elementLocator);
    const elementFound = await element(elementLocator);
    return elementFound.getAttribute(attributeName);
  }

  /**
   * Specific get the value of the attribute value
   * @param  {Locator}         elementLocator [description]
   * @return {Promise<string>}                [description]
   */
  public async getElementValue(elementLocator: Locator): Promise<string> {
    return this.getElementAttribute(elementLocator, 'value');
  }

  /**
   * Specific get the value of the attribute disabled
   * @param  {Locator}         elementLocator [description]
   * @return {Promise<string>}                [description]
   */
  public async getElementDisabled(elementLocator: Locator): Promise<string> {
    return this.getElementAttribute(elementLocator, 'disabled');
  }

  public async clickElementFinder(elementToClick: ElementFinder) {
    let classContext = this;
    let isErrorLogged: boolean = false;
    await this.waitForElementPresence(elementToClick);
    await this.waitForElementVisibility(elementToClick); // Necessary in headless where the execution is faster
    await browser.wait(
      async function() {
        try {
          await classContext.pause(500); // Protractor and JS Webdriver bindings do not allow for customized polling
          await elementToClick.click();
          return true;
        } catch (error) {
          if (!isErrorLogged) {
            classContext.logger.error(
              'Error on click using locator: ' + elementToClick.parentElementArrayFinder.locator_ + '\n\t' + error
            );
            isErrorLogged = true;
          }
          return false;
        }
      },
      this.TIMEOUT_MILLIS,
      'Clicking of element failed: ' + elementToClick.parentElementArrayFinder.locator_
    );
  }

  /**
   * Should be utilized mainly to check, if an attribute of an element updated by automation was actually changed
   * Use case examples:
   * - clicking of disabled product icon on profile page will not result in product selection, but automation won't fail
   * - clicking of disabled radiobutton on PD page won't select an option, when in fact it's expected to be selected
   * - invalid input for commision input field on PD page won't be caught as PD page makes it valid automatically
   */
  public async checkElementFinderAttributeEqualsTo(_element: ElementFinder, attrName: string, expAttrValue: string) {
    await this.waitForElementPresence(_element);
    const actualAttrValue: string = await _element.getAttribute(attrName);
    if (actualAttrValue === null) {
      throw new Error(
        'Error occurred while trying to get value of the attribute: ' +
          attrName +
          '\n\tfor the element locator: ' +
          _element.parentElementArrayFinder.locator_ +
          '\n\tCheck if the attribute exists'
      );
    } else if (actualAttrValue !== expAttrValue) {
      throw new Error(
        'Error occured on attribute value check: ' +
          '\n\tactual value: ' +
          actualAttrValue +
          '\n\texpected value: ' +
          expAttrValue +
          '\n\telement locator: ' +
          _element.parentElementArrayFinder.locator_
      );
    }
  }

  public async sendKeys(elementLocator: Locator, keys) {
    const elem: ElementFinder = await element(elementLocator);
    await this.sendKeysWithElementFinder(elem, keys);
  }

  public async sendKeysWithElementFinder(elem: ElementFinder, keys) {
    try {
      await this.waitForElementPresenceShort(elem);
      await this.waitForElementVisibilityShort(elem); // Necessary in headless where the execution is faster
      await elem.clear();
      await elem.sendKeys(keys);
    } catch (error) {
      throw new Error(
        'Element is not present on the page ' + elem.parentElementArrayFinder.locator_ + ' : Error ' + error
      );
    }
    return (await elem.getAttribute('value')) === keys;
  }

  public async isVisible(locator: Locator): Promise<boolean> {
    if (!(await this.isElementExist(locator))) {
      // This is a fix, when the element was not present in the DOM, it was throwing an exception, not returning false
      return false;
    } else {
      const _element: ElementFinder = await element(locator);
      return this.isElementFinderVisible(_element);
    }
  }

  public async isWaitedAndVisible(locator: Locator): Promise<boolean> {
    try {
      await this.waitForElementVisibilityWithLocator(locator);
      return true;
    } catch (error) {
      return false;
    }
  }

  public async isEnabled(locator: Locator): Promise<boolean> {
    try {
      await this.waitForElementPresenceShortWithLocator(locator);
      return await element(locator).isEnabled();
    } catch (error) {
      return false;
    }
  }

  public async isPresent(locator: Locator): Promise<boolean> {
    try {
      await this.waitForElementPresenceShortWithLocator(locator);
      return true;
    } catch (error) {
      return false;
    }
  }

  public async isElementFinderVisible(_element: ElementFinder): Promise<boolean> {
    try {
      await this.waitForElementPresenceShort(_element);
      return _element.isDisplayed();
    } catch (error) {
      return false;
    }
  }

  /**
   * Ugh. I can't overload with Typescript because typscript compiles
   * to js which doesn't have types so it sees these as the exact same method
   * @param locator
   */
  public async waitForElementPresenceLocator(locator: Locator) {
    const elem = await element(locator);
    await this.waitForElementPresence(elem);
  }

  public async waitForElementPresence(elem: ElementFinder) {
    let EC = protractor.ExpectedConditions;
    try {
      await browser.wait(EC.presenceOf(elem), this.LONG_TIMEOUT_MILLIS);
    } catch (error) {
      throw new Error(
        'Element is not present on the page ' + elem.parentElementArrayFinder.locator_ + ' : Error ' + error
      );
    }
  }

  /**
   *  A shorter wait for element. This will usually be used when the popup
   *  sometimes shows based on data config but is not guarenteed to show in the flow
   * @param locator
   */
  public async waitForElementPresenceShortWithLocator(locator: Locator) {
    const elem = await element(locator);
    await this.waitForElementPresenceShort(elem);
  }

  public async waitForElementPresenceShort(elem: ElementFinder) {
    let EC = protractor.ExpectedConditions;
    try {
      await browser.wait(EC.presenceOf(elem), this.SHORT_TIMEOUT_MILLIS);
    } catch (error) {
      throw error;
    }
  }
  /**
   * waits until an element is visible
   * @param locator
   * Normally if I click or interact with an not visible element it will throw an exception
   * Headless execution also supports visibility
   */
  public async waitForElementVisibilityShortWithLocator(locator: Locator) {
    const elem = await element(locator);
    await this.waitForElementVisibilityShort(elem);
  }

  public async waitForElementVisibilityWithLocator(locator: Locator) {
    const elem = await element(locator);
    await this.waitForElementVisibility(elem);
  }

  public async waitForElementVisibilityShort(elem: ElementFinder) {
    let EC = protractor.ExpectedConditions;
    try {
      await browser.wait(EC.visibilityOf(elem), this.SHORT_TIMEOUT_MILLIS);
    } catch (error) {
      throw error;
    }
  }

  public async waitForElementVisibility(elem: ElementFinder) {
    let EC = protractor.ExpectedConditions;
    try {
      await browser.wait(EC.visibilityOf(elem), this.TIMEOUT_MILLIS);
    } catch (error) {
      throw error;
    }
  }

  public async waitForElementToBeClickableShort(elementLocator: Locator) {
    const elem: ElementFinder = await element(elementLocator);
    let EC = protractor.ExpectedConditions;
    try {
      await browser.wait(EC.elementToBeClickable(elem), this.SHORT_TIMEOUT_MILLIS);
    } catch (error) {
      throw error;
    }
  }

  public async waitForElementToBeClickableLong(elementLocator: Locator) {
    const elem: ElementFinder = await element(elementLocator);
    let EC = protractor.ExpectedConditions;
    try {
      await browser.wait(EC.elementToBeClickable(elem), this.LONG_TIMEOUT_MILLIS);
    } catch (error) {
      throw error;
    }
  }

  public async waitForElementNotPresentLocator(locator: Locator) {
    const elem = await element(locator);
    await this.waitForElementNotPresent(elem);
  }

  public async waitForElementNotPresent(elem: ElementFinder) {
    let EC = protractor.ExpectedConditions;
    try {
      await browser.wait(EC.stalenessOf(elem), this.EXCEPTIONAL_LONG_TIMEOUT_MILLIS);
    } catch (error) {
      throw new Error(
        'Element was still present on the page ' + elem.parentElementArrayFinder.locator_ + ' : Error ' + error
      );
    }
  }

  public async waitForElementIsNotDisplayedLocator(locator: Locator) {
    const elem = await element(locator);
    await this.waitForElementIsNotDisplayed(elem);
  }

  public async waitForElementIsNotDisplayed(elem: ElementFinder) {
    let EC = protractor.ExpectedConditions;
    try {
      await browser.wait(EC.invisibilityOf(elem), this.LONG_TIMEOUT_MILLIS);
    } catch (error) {
      throw new Error(
        'Element was still visible on the page ' + elem.parentElementArrayFinder.locator_ + ' : Error ' + error
      );
    }
  }

  public async pause(millisecondsToSleep: number) {
    return await new Promise(resolve => setTimeout(resolve, millisecondsToSleep));
  }

  /**
   * Helper for executing javascipt on a page. This should be a last resort and should actually have a fix implemented
   * by the devs
   * @param jsToExecute
   */
  public async executeJs(jsToExecute: string) {
    await browser.executeScript(jsToExecute);
  }

  public async navigateTo(url: string) {
    await browser.navigate().to(url);
  }
  /*
   * Helper for checking if element is in the DOM
   * @param elementLocator
   */
  public async isElementExist(elementLocator: Locator): Promise<boolean> {
    return (await element.all(elementLocator).count()) > 0 ? true : false;
  }

  /**
   * Method for closing Walkme pop-up
   */
  public async clickWalkMeCloseBtn() {
    if (await this.isVisible(this.walkMeCloseBtn)) {
      await this.clickElement(this.walkMeCloseBtn);
    }
  }

  public async closeWalkMe() {
    if (await this.isVisible(this.walkMeCloseBtn)) {
      await this.clickElement(this.walkMeCloseBtn);
    } else if (await this.isVisible(this.walkMeNotThanksBtn)) {
      await this.clickElement(this.walkMeNotThanksBtn);
    }
  }
}
