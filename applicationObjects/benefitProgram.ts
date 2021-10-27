export class BenefitProgram {
  private _number: number;
  private _description: string;
  private _wse: number;

  constructor() {}

  public get number(): number {
    return this._number;
  }
  public set number(value: number) {
    this._number = value;
  }

  public get description(): string {
    return this._description;
  }
  public set description(value: string) {
    this._description = value;
  }

  public get wse(): number {
    return this._wse;
  }
  public set wse(value: number) {
    this._wse = value;
  }
}
