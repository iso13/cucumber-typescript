import { getLogger } from 'log4js';
import { injectable } from 'inversify';
import 'reflect-metadata';

import Logger from './logger';

@injectable()
export default class Log4jsLogger implements Logger {
  private logger;

  constructor() {
    this.logger = getLogger();
    this.logger.level = 'info';
  }

  public trace(message: string) {
    this.logger.trace(message);
  }

  public debug(message: string) {
    this.logger.debug(message);
  }

  public info(message: string) {
    this.logger.info(message);
  }

  public warn(message: string) {
    this.logger.warn(message);
  }

  public error(message: string) {
    this.logger.error(message);
  }

  public fatal(message: string) {
    this.logger.fatal(message);
  }
}
