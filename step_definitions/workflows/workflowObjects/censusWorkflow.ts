export class CensusWorkflow {
  public readonly templateType: string;
  public readonly censusLocation: string;
  public readonly headerRow: number;
  public readonly columnData: object[];
  public readonly columnsToSkip: string[];

  private availableTemplates: Map<string, string> = new Map([
    ['other census', 'Other Census Files (csv, xls, xlsx)'],
    ['exchange ii / xi rfp template file', 'Exchange II / XI RFP Template File']
  ]);

  constructor(context, parametersTable) {
    context.testData.checkTableForRequiredFields(parametersTable, ['template_type', 'census_location']);
    const censusTypeToLookup: string = parametersTable['template_type'].toLocaleLowerCase();
    if (this.availableTemplates.has(censusTypeToLookup)) {
      this.templateType = this.availableTemplates.get(censusTypeToLookup);
    } else {
      throw new Error(
        `Invalid/unsupported census type [` +
          parametersTable['template_type'] +
          `]. Update your test data json file [` +
          parametersTable['census_location'] +
          `]`
      );
    }
    this.censusLocation = context.testData.getCensusPath(context, parametersTable['census_location']);
    if (this.templateType === 'Other Census Files (csv, xls, xlsx)') {
      context.testData.checkTableForRequiredFields(parametersTable, ['header_row']);
      this.headerRow = parametersTable['header_row'];
      this.columnsToSkip = parametersTable['columns_to_skip'];
      this.columnData = parametersTable['column_data'];
    }
  }
}
