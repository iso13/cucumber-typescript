@trinet @consolidatedQuoting @selectedPlans @wip
Feature: Selected Plans
  As a user, when creating or editing a proposal or my current / renewal
  I want a side-by-side comparison view of the plans for a particular benefit type
  So that I can view and compare all of the benefits across the plans in order to make good decisions on which plans to quote and present.

  @blocker
  Scenario: Selected Plans should display the plan cards for Medical, Dental, Vision, Life, STD and LTD

  Scenario: Selected Plans should display 'Total Cost' when quote is Medical, Dental, Vision or Life PCR and cost data is present

  Scenario: Selected Plans should not display 'Total Cost' when quote is Medical, Dental, Vision or Life BCR

  Scenario: Selected Plans should display 'Difference from Current %' for only PCR Market Snapshot quotes and current is set on group

  Scenario: Selected Plans should not display 'Difference from Current %' for PCR Market Snapshot quotes when current is not set on group

  Scenario: Selected Plans should not display 'Difference from Current %' when quote is Medical, Vision, Dental or Life PCR Standard Modeling

  Scenario: Selected Plans should not display 'Difference from Current %' when quote is Medical, Vision, Dental or Life BCR

  Scenario: x/y Employees on Selected Plans for SM Quote displays - WSEs mapped to plan to number of non-waiving WSEs eligible for benefit enrollment

  Scenario: x/y Employees on Selected Plans for MS Quote displays - non-waiving WSE eligible for plan to non-waiving WSE eligible for benefit enrollment

  Scenario: Selected Plans should display manual sorting bumpers for Medical, Dental, Vision and Life BCR/PCR

  Scenario: Selected Plans should display 'Change Position' manual plan sorting dropdown menu for Medical, Dental, Vision and Life BCR/PCR

  Scenario: Selected Plans should display Carrier-Plan name for Medical, Dental, Vision and Life BCR/PCR

  Scenario: Selected Plans should display 'Benefit Details' link to download the carrier document for Medical, Dental, Vision and Life BCR/PCR

  Scenario: Carrier document is downloaded on 'Benefit Details' link on Selected Plans for Medical, Dental, Vision and Life for BCR/PCR

  Scenario: Selected Plans should not display 'Add/Remove' buttons for Medical, Dental, Vision and Life BCR/PCR

  Scenario: Selected Plans should display the listing of plan benefits for Medical, Dental, Vision and Life BCR/PCR

  Scenario: Selected Plans should display the listing of plan benefits for Medical, Dental, Vision and Life BCR/PCR

  Scenario: Selected Plans should display 4 tier 'Plan Rates' for Medical, Vision and Life PCR when cost data is present

  Scenario: Selected Plans should display 3 tier 'Plan Rates' for Dental PCR when cost data is present

  Scenario: Selected Plans should display 'Age Rates' for Current/Renewal when cost data is present

  Scenario: Selected Plans should not display 'Plan Rates' for Medical, Dental, Vision and Life BCR

  Scenario: Selected Plans should display 'Total Volume' for Life, Std, Ltd BCR/PCR

  Scenario: Selected Plans should display 'Total Volume' for different to Life, Std, Ltd BCR/PCR

  @mstr-1365
  Scenario: Large Carrier logos should display on Selected Plans when viewing the SBS view in the quoting workflow for any product line

  @mstr-1365
  Scenario: Small Carrier logos should display on Selected Plans when viewing the table view in the quoting workflow for any product line
