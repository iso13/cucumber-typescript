export const ProductLine = {
  Medical: {
    lineId: 13,
    fullName: 'Medical',
    shortName: 'Medical',
    locatorString: 'medical'
  },
  Dental: {
    lineId: 1,
    fullName: 'Dental',
    shortName: 'Dental',
    locatorString: 'dental'
  },
  GTL: {
    lineId: 3,
    fullName: 'Group Term Life',
    shortName: 'GTL',
    locatorString: 'group-term-life'
  },
  Vision: {
    lineId: 2,
    fullName: 'Vision',
    shortName: 'Vision',
    locatorString: 'vision'
  },
  STD: {
    lineId: 7,
    fullName: 'Short-Term Disability',
    shortName: 'STD',
    locatorString: 'short-term-disability'
  },
  LTD: {
    lineId: 8,
    fullName: 'Long-Term Disability',
    shortName: 'LTD',
    locatorString: 'long-term-disability'
  },
  VTL: {
    lineId: 9,
    fullName: 'Voluntary Term Life',
    shortName: 'VTL',
    locatorString: 'voluntary-term-life'
  },
  Accident: {
    lineId: 11,
    fullName: 'Accident',
    shortName: 'Accident',
    locatorString: 'accident'
  },
  CriticalIllness: {
    lineId: 4,
    fullName: 'Critical Illness',
    shortName: 'CI',
    locatorString: 'critical-illness'
  }
};

export function getProductFullName(productShortName: string): string {
  for (let productKey of Object.keys(ProductLine)) {
    if (ProductLine[productKey].shortName === productShortName) {
      return ProductLine[productKey].fullName;
    }
  }
  throw new Error(`Product short name [` + productShortName + `] is not found/supported in productLine.ts`);
}

export function getProductLocator(productShortName: string): string {
  for (let productKey of Object.keys(ProductLine)) {
    if (ProductLine[productKey].shortName === productShortName) {
      return ProductLine[productKey].locatorString;
    }
  }
  throw new Error(`Product short name [` + productShortName + `] is not found/supported in productLine.ts`);
}
