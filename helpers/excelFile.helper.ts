import * as pathUtils from 'path';
import { WorkBook, WorkSheet, CellObject, readFile, writeFile, utils as XLSXutils } from 'xlsx';

export default {
  async getExcelWorkbookFromFile(fileAbsolutePath: string): Promise<WorkBook> {
    return readFile(fileAbsolutePath);
  },

  async getExcelWorkbookFromAOA(aoa: Array<Array<any>>): Promise<WorkBook> {
    let wb: WorkBook = XLSXutils.book_new();
    let ws: WorkSheet = XLSXutils.aoa_to_sheet(aoa);
    XLSXutils.book_append_sheet(wb, ws);
    return wb;
  },

  async getCSVFromWorkBook(workbook: WorkBook): Promise<string> {
    let ws: WorkSheet = workbook.Sheets[workbook.SheetNames[0]];
    return XLSXutils.sheet_to_csv(ws);
  },

  async getJSONFromWorkBookSheet(workbook: WorkBook, sheetIdx: number): Promise<any> {
    let ws: WorkSheet = workbook.Sheets[workbook.SheetNames[sheetIdx]];
    return XLSXutils.sheet_to_json(ws);
  },

  async getJSONFromFirstXlsxSheet(filePath: string): Promise<string> {
    return await this.getJSONFromXlsxSheet(filePath, 0);
  },

  async getJSONFromXlsxSheet(filePath: string, sheetIdx: number): Promise<string> {
    let wb = await this.getExcelWorkbookFromFile(filePath);
    return await this.getJSONFromWorkBookSheet(wb, sheetIdx);
  },

  async writeWorkBookToFile(workbook: WorkBook, fileNameAndPath: string) {
    writeFile(workbook, fileNameAndPath);
  },

  async writeAOAToExcelFile(aoa: Array<Array<any>>, fileRelativePath: string) {
    const wb = await this.getExcelWorkbookFromAOA(aoa);
    const fileAbsolutePath: string = pathUtils.join(process.cwd() + fileRelativePath);
    await this.writeWorkBookToFile(wb, fileAbsolutePath);
  },

  getWorkSheetName(workBook: WorkBook, sheetIdx: number): string {
    if (sheetIdx >= workBook.SheetNames.length) {
      throw new Error(
        `Sheet index [` +
          sheetIdx +
          `] is out of bounds - workbook contains ` +
          workBook.SheetNames.length +
          ` sheets only`
      );
    }
    return workBook.SheetNames[sheetIdx];
  },

  getFormattedValueByCellReference(workBook: WorkBook, sheetIdx: number, cellRef: string): string {
    const wsName: string = this.getWorkSheetName(workBook, sheetIdx);
    const cellObject: CellObject = workBook.Sheets[wsName][cellRef];
    return cellObject ? cellObject.w.trim() : ``;
  },

  getFormattedValueByCellIndices(workBook: WorkBook, sheetIdx: number, row: number, col: number): string {
    const cellref: string = XLSXutils.encode_cell({ c: col, r: row });
    return this.getFormattedValueByCellReference(workBook, sheetIdx, cellref);
  }
};
