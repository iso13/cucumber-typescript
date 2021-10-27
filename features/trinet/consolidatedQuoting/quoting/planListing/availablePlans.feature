@trinet @consolidatedQuoting @availablePlans @wip
Feature: View Available Plans
  As a user, when creating or editing a proposal or my current / renewal
  I want a side-by-side comparison view of the plans for a particular benefit type
  So that I can view and compare all of the benefits across the plans in order to make good decisions on which plans to quote and present.

  @blocker
  Scenario: Available Plans should display the plan cards for Medical, Dental, Vision, Life, STD and LTD

  Scenario: Available Plans should display 'Total Cost' when quote is Medical, Dental, Vision or Life PCR and cost data is present

  Scenario: Available Plans should not display 'Total Cost' when quote is Medical, Dental, Vision or Life BCR

  Scenario: When Current is set , Available Plans on quote should display 'Difference from Current %' for Medical PCR quote

  Scenario: When Current is not set , Available Plans on quote should not display 'Difference from Current %' for Medical PCR quote

  Scenario: Available Plans should not display 'Difference from Current %' when quote is Medical, Vision, Dental or Life BCR

  Scenario: Available Plans should display non-waiving WSE's mapped to a plan v/s total Employee in format as 'x/y Employees' for all BCR/PCR quotes

  Scenario: Available Plans should not display manual sorting bumpers for Medical, Dental, Vision and Life BCR/PCR

  Scenario: Available Plans should not display 'Change Position' manual plan sorting dropdown menu for Medical, Dental, Vision and Life BCR/PCR

  Scenario: Available Plans should display Carrier-Plan name for Medical, Dental, Vision and Life BCR/PCR

  Scenario: Available Plans should display 'Benefit Details' link to download the carrier document for Medical, Dental, Vision and Life BCR/PCR

  Scenario: Validate Carrier document is downloaded after click on 'Benefit Details' link on Available Plans for all BCR/PCR

  Scenario: Available Plans should display 'Add/Remove' buttons for Medical, Dental, Vision and Life BCR/PCR

  Scenario: Available Plans should display the listing of plan benefits for Medical, Dental, Vision and Life BCR/PCR

  Scenario: Available Plans should display 4 tier 'Plan Rates' for Medical, Vision and Life PCR when cost data is present

  Scenario: Available Plans should display 3 tier 'Plan Rates' for Dental PCR when cost data is present

  Scenario: Selected Plans should display 'Age Rates' for Current/Renewal when cost data is present

  Scenario: Available Plans should not display 'Plan Rates' for Medical, Dental, Vision and Life BCR

  Scenario: Available Plans should display 'Total Volume' for Life, Std, Ltd BCR/PCR

  Scenario: Available Plans should display 'Total Volume' for different to Life, Std, Ltd BCR/PCR

  @mstr-1365
  Scenario: Large Carrier logos should display on Available Plans when viewing the SBS view in the quoting workflow for any product line

  @mstr-1365
  Scenario: Small Carrier logos should display on Available Plans when viewing the table view in the quoting workflow for any product line
