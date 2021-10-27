import { Container } from 'inversify';
import Logger from './support/logger/logger';
import Log4jsLogger from './support/logger/logger4jsLogger';
import ImageComparison from './support/imageComparison/imageComparison';
import ProtractorImageComparison from './support/imageComparison/protractorImageComparison';
import { TYPES } from './types';

const registry = new Container();
registry.bind<ImageComparison>(TYPES.ImageComparison).to(ProtractorImageComparison);
registry.bind<Logger>(TYPES.Logger).to(Log4jsLogger);

export { registry };
