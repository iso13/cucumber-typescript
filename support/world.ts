/*
 * World is a constructor function with utility properties,
 * to be used in step definitions.
 * World constructor is strictly synchronous
 * https://github.com/cucumber/cucumber-js/blob/master/docs/support_files/world.md
 */

import { setDefaultTimeout, setWorldConstructor } from 'cucumber';
import { JSONHelper, TestDataHelper, S3Helper, DateHelper, FileSystemHelper, ExcelFileHelper } from '../helpers/index';
import Logger from './logger/logger';
import { registry } from '../inversify.config';
import { TYPES } from '../types';
import * as chai from 'chai';
import * as chaiDateTime from 'chai-datetime';
import * as deepEqualInAnyOrder from 'deep-equal-in-any-order';
import { CensusWorkflow } from '../step_definitions/workflows/workflowObjects/censusWorkflow';

chai.use(deepEqualInAnyOrder);
chai.use(chaiDateTime);

export class World {
  protected constructor(params) {
    this.implementation = null;
    this.groupName = null;
    this.groupEfectiveDate = null;
    this.logger = registry.get<Logger>(TYPES.Logger);
    this.attach = params.attach;
    this.expect = chai.expect;
    this.assert = chai.assert;
    this.json = JSONHelper;
    this.testData = TestDataHelper;
    this.s3 = S3Helper;
    this.dateHelper = DateHelper;
    this.fileSystem = FileSystemHelper;
    this.excelHelper = ExcelFileHelper;
    this.customPlans = new Map<string, object>();
    this.stateCode = null;
    this.notificationsCount = null;
    this.groupDueDate = null;
  }
  protected notificationsCount: string;
  protected groupEfectiveDate: string;
  protected implementation: string;
  protected groupName: string;
  protected groupJsonData: string;
  protected censusWorkflowData: CensusWorkflow;
  protected customPlan: string; //custom plan json data
  protected customPlans: Map<string, object>;
  protected proposalFileName: string; //proposal file name, excluding absolute or relative path
  protected attach;
  protected expect;
  protected assert;
  protected logger: Logger;
  protected json;
  protected testData;
  protected s3;
  protected latestResponse;
  protected dateHelper;
  protected fileSystem;
  protected excelHelper;
  protected stateCode: string;
  protected groupDueDate: string;
  protected dtqJsonData: string;
}

setDefaultTimeout(600 * 1000);
setWorldConstructor(World);
