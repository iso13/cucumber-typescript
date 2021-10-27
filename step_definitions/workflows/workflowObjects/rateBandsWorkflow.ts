class RateBandsWorkflow {
  readonly setQuarters: SetQuarters;
  readonly setExpirationDates: SetExpirationDates[];
  readonly exchanges: Exchanges[];

  constructor(params) {
    this.setQuarters = params.setQuarters;
    this.setExpirationDates = params.setExpirationDates;
    this.exchanges = params.exchanges;
  }
}

class SetQuarters {
  readonly primaryEffectiveQuarter: string;
  readonly alternateEffectiveQuarter: string;
  readonly currentEffectiveQuarter: string;

  constructor(params) {
    this.primaryEffectiveQuarter = params.nprimaryEffectiveQuarterame;
    this.alternateEffectiveQuarter = params.alternateEffectiveQuarter;
    this.currentEffectiveQuarter = params.currentEffectiveQuarter;
  }
}

class SetExpirationDates {
  readonly primaryExpiration: string;
  readonly alternateExpiration: object;

  constructor(params) {
    this.primaryExpiration = params.primaryExpiration;
    this.alternateExpiration = params.alternateExpiration;
  }
}

class Exchanges {
  readonly exchangeName: string;
  readonly defaultRatingBands: DefaultRatingBands[];
  readonly medicalCarrierData: CarrierData[];
  readonly lifeCarrierData: CarrierData[];

  constructor(params) {
    this.exchangeName = params.exchangeName;
    this.defaultRatingBands = params.defaultRatingBands;
    this.medicalCarrierData = params.medicalCarrierData;
    this.lifeCarrierData = params.lifeCarrierData;
  }
}

class DefaultRatingBands {
  readonly default: boolean;
  readonly productLine: string;
  readonly bands: Bands;

  constructor(params) {
    this.default = params.productLine;
    this.productLine = params.productLine;
    this.bands = params.bands;
  }
}

class Bands {
  readonly primaryBand: string;
  readonly alternateBand: string;
  readonly currentCoverageBand: string;

  constructor(params) {
    this.primaryBand = params.bands;
    this.alternateBand = params.productLine;
    this.currentCoverageBand = params.bands;
  }
}

class CarrierData {
  readonly carrierName: string;
  readonly bandValues: BandValues[];

  constructor(params) {
    this.carrierName = params.productLine;
    this.bandValues = params.bands;
  }
}

class BandValues {
  readonly primaryBand: string;
  readonly alternateBand: string;
  readonly currentCoverageBand: string;

  constructor(params) {
    this.primaryBand = params.productLine;
    this.alternateBand = params.bands;
    this.currentCoverageBand = params.bands;
  }
}

export = RateBandsWorkflow;
