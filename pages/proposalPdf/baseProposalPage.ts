import { browser, ElementFinder, element, Locator, by } from 'protractor';
import BasePage from '../basePage';

export class BaseProposalPage extends BasePage {
  private proposalPdfUrl: string = '?html=true';

  public async goToPdfUrl() {
    try {
      let windows: string[] = await browser.getAllWindowHandles();
      await browser.waitForAngularEnabled(false);
      for (let i = 0; i < windows.length; i++) {
        await browser.switchTo().window(windows[i]);
      }
      let currentUrl: string = await browser.getCurrentUrl();
      await browser.get(currentUrl + this.proposalPdfUrl);
    } catch (error) {
      throw error;
    }
  }

  /**
   * This method is used to build locators and their values for proposal pdf page that is displayed via html
   * @param locatorMap
   * @param object
   * @param basePath
   */
  public getProposalLocatorsAndValues(
    locatorMap: Map<string, string>,
    object: object,
    basePath = ''
  ): Map<string, string> {
    if (!locatorMap) {
      return;
    }

    // Process the complex object
    Object.keys(object).map(key => {
      if (!this.isPrimitive(object[key])) {
        this.augmentWithObject(locatorMap, object[key], key, basePath);
      } else {
        // Assign the primitive value at the constructed keyPath
        locatorMap.set(basePath, object[key]);
      }
    });
    return locatorMap;
  }

  /**
   * Handles the processing of a complex object for insertion into the AppSettings.
   * @param settings
   * @param object
   * @param currentKey
   * @param basePath
   */
  private augmentWithObject(settings: Map<any, any>, object: object, currentKey: string, basePath: string): void {
    // Recurse on the complex object
    this.getProposalLocatorsAndValues(settings, object, this.asKeyPath(basePath, currentKey));
  }

  /**
   * Determines if the passed in object represents a primitive type.
   * @param object
   */
  private isPrimitive(object: any): boolean {
    return typeof object === 'string' || typeof object === 'boolean' || typeof object === 'number';
  }

  /**
   * Assembles a keyPath from the inputs.
   * @param basePath
   * @param key
   */
  private asKeyPath(basePath: string, key: string): string {
    return basePath === '' ? key : basePath + '-' + key;
  }
}
