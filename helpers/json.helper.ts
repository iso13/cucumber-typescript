import * as pathUtils from 'path';
let fs = require('fs');
export default {
  async getJsonFromFile(filePath: any, env: string) {
    filePath = filePath.split(' ').join('_') + '.json';
    filePath = pathUtils.normalize(process.cwd() + '/testData/' + env + '/' + filePath);
    let contents = fs.readFileSync(filePath);
    return JSON.parse(contents);
  },

  async findJsonValue(obj, prop) {
    prop = prop.split('.');
    for (let i = 0; i < prop.length; i++) {
      if (typeof obj[prop[i]] === 'undefined') {
        throw Error('Json value not found: ' + prop);
      }
      obj = obj[prop[i]];
    }
    return obj;
  },

  jsonToMap(jsonObj): Map<string, object> {
    const map: Map<string, object> = new Map();
    Object.keys(jsonObj).forEach(key => {
      map.set(key, jsonObj[key]);
    });
    return map;
  }
};
