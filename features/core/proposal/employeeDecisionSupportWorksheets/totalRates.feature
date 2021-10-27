@core @proposal @employeeDecisionSupportWorksheets @totalRates @wip
Feature: Total rates
  As a Broker
  I want to have a rate breakdown on my employee decision support worksheets
  So that employees can make the most informed decision when enrolling

  Scenario: Each employee should have their own decision support worksheet and the worksheet should be broken up by product lines

  Scenario: Below each employees name on the worksheet there should be plan effective date and the payroll deduction method. The plan effective date will only show for medical

  Scenario: There should be values displayed in the top right of the medical page for medical, contribution strategy, target plan, and dependent rollover.

  Scenario: If current is 4 Tier-Composite and the real time quotes plans are ACA Age-Rated then current rates should show N/A for each member

  Scenario: If current is ACA Age-Rated and the real time quotes plans are 4 Tier-Composite then current rates should show a 4 tier break down of rates (age rated members have their rates added to sum a tier such as EC1)

  Scenario: For medical ACA Age-Rated rates should be broken down by members regardless of tier

  Scenario: For medical 4 Tier-Composite, rates should be displayed by tiers for each plan on the quote. Employee Only, Employee + Spouse, Employee + Child(ren), Family.

  Scenario: Dental, Vision, and Life should not have a rate breakdown
