import * as fs from 'fs';
import * as path from 'path';
import { browser } from 'protractor';

export default {
  /**
   * Verifies if downloaded file exists in project 'downloads' folder
   * @param fileName - name of the file including extenstion
   */
  async isFileDownloaded(fileName: string): Promise<boolean> {
    const pathStr = '../../testData/downloads/' + fileName;
    const absolutePath: string = path.resolve(__dirname, pathStr);
    try {
      await this.waitForFileToExist(absolutePath);
      return true;
    } catch (error) {
      return false;
    }
  },

  async waitForFileToExist(fileAbsolutePath: string) {
    await browser.wait(async () => fs.existsSync(fileAbsolutePath), 5000);
  }
};
