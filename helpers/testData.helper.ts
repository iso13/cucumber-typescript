import { JSONHelper } from '../helpers/index';
import * as usersFile from '../config/users.json';
import { lstatSync } from 'fs';
import * as pathUtils from 'path';

export default {
  async getUserDetails(env: string, userRole: string) {
    userRole = userRole
      .toLocaleLowerCase()
      .split(' ')
      .join('_');
    let users = usersFile[env];
    return await JSONHelper.findJsonValue(users, userRole);
  },

  async isFileOrDirectory(path) {
    try {
      let stat = lstatSync(path);
      return stat.isDirectory() || stat.isFile();
    } catch (e) {
      // lstatSync throws an error if path doesn't exist
      throw new Error('Invalid file path: ' + path);
    }
  },

  async getGroupJson(worldContext, fileName: string) {
    return await worldContext.json.getJsonFromFile('/group/' + fileName, worldContext.implementation);
  },

  getCensusPath(worldContext, fileName: string) {
    return pathUtils.normalize(process.cwd() + '/testData/' + worldContext.implementation + '/census/' + fileName);
  },

  async getCustomPlanJson(worldContext, fileName: string) {
    return await worldContext.json.getJsonFromFile('customPlan/' + fileName, worldContext.implementation);
  },

  async getQuoteCardConfigJson(worldContext, fileName: string) {
    return await worldContext.json.getJsonFromFile('/quoteCardConfigurations/' + fileName, worldContext.implementation);
  },

  async getQuoteJson(worldContext, fileName: string) {
    return await worldContext.json.getJsonFromFile('/quoting/' + fileName, worldContext.implementation);
  },

  async getRateBandsJson(worldContext, fileName: string) {
    return await worldContext.json.getJsonFromFile('/rateBands/' + fileName, worldContext.implementation);
  },

  async getProposalJson(worldContext, fileName: string) {
    return await worldContext.json.getJsonFromFile('/proposalApplication/' + fileName, worldContext.implementation);
  },

  async getOtherCensusDataJson(worldContext, fileName: string) {
    return await worldContext.json.getJsonFromFile('/census/' + fileName, worldContext.implementation);
  },

  async getUnderwritingJson(worldContext, fileName: string) {
    return await worldContext.json.getJsonFromFile('/underwriting/' + fileName, worldContext.implementation);
  },

  getCurrentImplementation(worldContext): Promise<string> {
    return worldContext.implementation;
  },

  checkTableForRequiredFields(table, requiredFields: string[]) {
    for (const requiredField of requiredFields) {
      if (!table[requiredField]) {
        throw new Error(requiredField + ' is a required field in the table');
      }
    }
  },

  convertStringToArray(commaSeparatedString: string): Array<string> {
    return commaSeparatedString.split(',').map(element => element.trim());
  },

  setImageComparisonPath(context, fileName: string): string {
    return pathUtils.join(context.implementation, fileName);
  }
};
