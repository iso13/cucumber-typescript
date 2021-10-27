export class QuoteWorkflow {
  public readonly name: string;
  public readonly benefitType: string;
  public readonly productLine: string;
  public readonly carriers: string[];
  public readonly packageName: string;
  public readonly benefitFilters: object[];
  public readonly setFilters: boolean;
  public readonly plans: PlanInWorkflow[];
  public readonly quoteType: string;
  public readonly exchange: string;

  constructor(params) {
    this.name = params.name;
    this.benefitType = params.benefitType;
    this.productLine = params.productLine;
    this.carriers = params.carriers;
    this.packageName = params.package;
    this.benefitFilters = params.benefitFilters;
    this.setFilters = params.setFilters;
    this.plans = params.plans;
    this.quoteType = params.quoteType;
    this.exchange = params.exchange;
  }
}

class PlanInWorkflow {
  public readonly name: string;
  public readonly benefits: object[];
  public readonly rates: RateInWorkflow[];

  constructor(params) {
    this.name = params.name;
    this.benefits = params.benefits;
    this.rates = params.rates;
  }
}

class RateInWorkflow {
  public readonly type: string;
  public readonly ageBanded: object;
  public readonly threeTier: object;
  public readonly fourTier: object;

  constructor(params) {
    this.type = params.type;
    this.ageBanded = params.ageBanded;
    this.threeTier = params.threeTier;
    this.fourTier = params.fourTier;
  }
}
