import { Locator, element, ElementFinder, browser, ExpectedConditions } from 'protractor';
import { injectable, inject } from 'inversify';
import 'reflect-metadata';

import { TYPES } from '../../types';
import Logger from '../logger/logger';
import ImageComparison from './imageComparison';

@injectable()
export default class ProtractorImageComparison implements ImageComparison {
  @inject(TYPES.Logger) private logger: Logger;
  private readonly WAIT_TIMEOUT_MILLIS: number = 10000;
  private readonly SCREEN_MISMATCH_THRESHOLD = 5;
  private readonly ELEMENT_MISMATCH_THRESHOLD = 15;

  public async captureScreen(imageName: string): Promise<void> {
    this.logger.info(`Capturing full screen into file [${imageName}]`);
    await browser.imageComparison.checkScreen(imageName);
  }

  public async captureElement(locator: Locator, imageName: string): Promise<void> {
    const elementFinder: ElementFinder = await element(locator);
    await this.captureElementFinder(elementFinder, imageName);
  }

  public async captureElementFinder(elementFinder: ElementFinder, imageName: string): Promise<void> {
    await this.waitForElementPresence(elementFinder);
    this.logger.info(`Capturing element into file [${imageName}]`);
    await browser.imageComparison.checkElement(elementFinder, imageName);
  }

  public async compareScreen(imageName: string, compareConfigs = {} as any): Promise<boolean> {
    this.logger.info(`Comparing screen to a baseline file [${imageName}]`);
    compareConfigs.ignoreAntialiasing = true;
    compareConfigs.hideScrollBars = true;
    const result = await browser.imageComparison.checkScreen(imageName, compareConfigs).catch(err => {
      this.logger.error(`Error during screen comparison`);
      throw err;
    });
    this.logger.info(`Comparison mismatch percentage: ${result}`);
    return result < this.SCREEN_MISMATCH_THRESHOLD;
  }

  public async compareElement(locator: Locator, imageName: string, compareConfigs = {} as any): Promise<boolean> {
    const elementFinder: ElementFinder = await element(locator);
    return await this.compareElementFinder(elementFinder, imageName, compareConfigs);
  }

  public async compareElementFinder(
    elementFinder: ElementFinder,
    imageName: string,
    compareConfigs = {} as any
  ): Promise<boolean> {
    await this.waitForElementPresence(elementFinder);
    this.logger.info(`Comparing element to a baseline file [${imageName}]`);
    compareConfigs.ignoreTransparentPixel = true;
    compareConfigs.ignoreAntialiasing = true;
    compareConfigs.hideScrollBars = true;
    let result = await browser.imageComparison.checkElement(elementFinder, imageName, compareConfigs).catch(err => {
      this.logger.error(`Error during element comparison`);
      throw err;
    });
    this.logger.info(`Comparison mismatch percentage: ${result}`);
    if (compareConfigs.customMismatchThreshold) {
      return result < compareConfigs.customMismatchThreshold;
    }
    return result < this.ELEMENT_MISMATCH_THRESHOLD;
  }

  private async waitForElementPresence(elementFinder: ElementFinder) {
    try {
      await browser.wait(ExpectedConditions.presenceOf(elementFinder), this.WAIT_TIMEOUT_MILLIS);
    } catch (error) {
      throw error;
    }
  }
}
