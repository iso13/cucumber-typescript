import { Locator, ElementFinder } from 'protractor';

export default interface ImageComparison {
  captureScreen: (imageName: string) => Promise<void>;
  captureElement: (locator: Locator, imageName: string) => Promise<void>;
  captureElementFinder: (elementFinder: ElementFinder, imageName: string) => Promise<void>;
  compareScreen: (imageName: string, compareConfigs?: any) => Promise<boolean>;
  compareElement: (locator: Locator, imageName: string, compareConfigs?: any) => Promise<boolean>;
  compareElementFinder: (elementFinder: ElementFinder, imageName: string, compareConfigs?: any) => Promise<boolean>;
}
