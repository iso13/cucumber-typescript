@trinet @contributeDollarCosts @wip @carlos
Feature: Contribute Dollar Costs
  As a broker
  I want to perform dollar based contributions for employers
  So that I can give clients an accurate cost breakdown

  @blocker
  Scenario: Dollar contribution strategy can be applied for any PCR quote due Contributions tab is visible

  @critical
  Scenario: Dollar contribution strategy is not visible for any BCR quote due Contributions tab is not visible

  @critical
  Scenario: Employer-Flat Dollar contribution strategy cannot be lower that 50% for Exchange I and II when DMFL are applied

  @critical
  Scenario: Employer-Flat Dollar contribution strategy cannot be lower that 75% for Exchange IV when DMFL are applied

  @critical
  Scenario: Minimum Employer-Flat $ contribution strategy is 50% for Exchange III when group is not Florida or Texas and DMFL are applied

  @critical
  Scenario: Minimum Employer-Flat $ contribution strategy is 70% for Exchange III when group is from Florida or Texas and DMFL is applied

  @critical
  Scenario: Employee-Flat Dollar contribution strategy cannot be greater that 50% for Exchange I and II when DMFL are applied

  @critical
  Scenario: Employee-Flat Dollar contribution strategy cannot be greater that 25% for Exchange IV when DMFL are applied

  @critical
  Scenario: Maximum Employee-Flat $ contribution strategy is 50% for Exchange III when group zip is not from Florida or Texas and DMFL are applied

  @critical
  Scenario: Employee-Flat Dollar contribution cannot be greater than 30% for Exchange III when either plans are for Florida and DMFL are applied

  @critical
  Scenario: Employee-Flat Dollar contribution strategy cannot be greater that 30% for Exchange III when either plans are for Texas and DMFL are applied

  Scenario: Dollar contribution strategy is applied correctly to Employees with EE, ES, EC, EF coverage for PCR Medical quotes

  Scenario: Dollar contribution strategy is applied correctly to Employees with EE, ES, EC, EF coverage for PCR Dental quotes

  Scenario: Dollar contribution strategy is applied correctly to Employees with EE, ES, EC, EF coverage for PCR Vision quotes

  Scenario: Dollar contribution strategy cannot be applied to any Life quote

  Scenario: Dollar contribution strategy is not applied to EEs with Non Eligible coverage

  Scenario: Dollar contribution strategy is applied to Employees with Full Time or Member/Partner employment status

  Scenario: Dollar contribution strategy is not applied to Employees with Temp and Part Time employment status

  Scenario: Dollar contribution strategy is applied when one Benefit Program exists

  Scenario: Dollar contribution strategy is applied individually when multiple Benefit Programs exist

  Scenario: For Single benefit group Employee-Flat Dollar or Employer-Flat Dollar contribution strategy can be set for PCR Medical quotes

  Scenario: For Single benefit group either Employee-Flat Dollar or Employer-Flat Dollar contribution strategy can be set for PCR Dental quotes

  Scenario: For Single benefit group either Employee-Flat Dollar or Employer-Flat Dollar contribution strategy can be set for PCR Vision quotes

  Scenario: For Multi benefit group either Employee-Flat Dollar or Employer-Flat Dollar contribution can be set on PCR quotes for a Benefit Programs

  Scenario: For quotes with multiple Benefit Programs both Employee-Flat Dollar and Employer-Flat Dollar contribution strategies can be set

  Scenario: For PCR Dental quotes with multiple Benefit Programs both Employee-Flat Dollar and Employer-Flat Dollar contribution strategies can be set

  Scenario: For PCR Vision quotes with multiple Benefit Programs both Employee-Flat Dollar and Employer-Flat Dollar contribution strategies can be set

  Scenario: High chart costs should be updated to accurately reflect costs for PCR Medical based on dollar contributions

  Scenario: High chart costs should be updated to accurately reflect costs for PCR Dental based on dollar contributions

  Scenario: High chart costs should be updated to accurately reflect costs for PCR Vision based on dollar contributions

  Scenario: High chart costs should be updated to accurately reflect costs for PCR Life based on dollar contributions

  Scenario: Dollar contribution strategy cannot be greater that maximum defined by Exchange when DMFL are applied
