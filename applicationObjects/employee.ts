export class Employee {
  private _firstName: string;
  private _lastName: string;
  private _dateOfBirth: string;
  private _zip: string;
  private _age: number;
  private _gender: string;
  private _medicalTier?: string;
  private _dentalTier?: string;
  private _visionTier?: string;
  private _salary?: number;
  private _jobTitle?: string;
  private _occupation?: string;
  private _occupationSpecialty?: string;
  private _salaryMode?: string;
  private _employmentStatus?: string;
  private _benefitProgram: number;

  constructor() {}

  public get firstName(): string {
    return this._firstName;
  }
  public set firstName(value: string) {
    this._firstName = value;
  }

  public get lastName(): string {
    return this._lastName;
  }
  public set lastName(value: string) {
    this._lastName = value;
  }

  public get dateOfBirth(): string {
    return this._dateOfBirth;
  }
  public set dateOfBirth(value: string) {
    this._dateOfBirth = value;
  }

  public get zip(): string {
    return this._zip;
  }
  public set zip(value: string) {
    this._zip = value;
  }

  public get age(): number {
    return this._age;
  }
  public set age(value: number) {
    this._age = value;
  }

  public get gender(): string {
    return this._gender;
  }
  public set gender(value: string) {
    this._gender = value;
  }

  public get medicalTier(): string {
    return this._medicalTier;
  }
  public set medicalTier(value: string) {
    this._medicalTier = value;
  }

  public get dentalTier(): string {
    return this._dentalTier;
  }
  public set dentalTier(value: string) {
    this._dentalTier = value;
  }

  public get visionTier(): string {
    return this._visionTier;
  }
  public set visionTier(value: string) {
    this._visionTier = value;
  }

  public get salary(): number {
    return this._salary;
  }
  public set salary(value: number) {
    this._salary = value;
  }

  public get jobTitle(): string {
    return this._jobTitle;
  }
  public set jobTitle(value: string) {
    this._jobTitle = value;
  }

  public get occupation(): string {
    return this._occupation;
  }
  public set occupation(value: string) {
    this._occupation = value;
  }

  public get occupationSpecialty(): string {
    return this._occupationSpecialty;
  }
  public set occupationSpecialty(value: string) {
    this._occupationSpecialty = value;
  }

  public get salaryMode(): string {
    return this._salaryMode;
  }
  public set salaryMode(value: string) {
    this._salaryMode = value;
  }

  public get employmentStatus(): string {
    return this._employmentStatus;
  }
  public set employmentStatus(value: string) {
    this._employmentStatus = value;
  }

  public get benefitProgram(): number {
    return this._benefitProgram;
  }
  public set benefitProgram(value: number) {
    this._benefitProgram = value;
  }
}
