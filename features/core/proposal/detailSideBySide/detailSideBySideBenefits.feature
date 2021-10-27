@core @proposal @detailSideBySide @detailSideBySideBenefits
Feature: Detail Side By Side Benefits
  As a Broker
  I want a detailed side by side of my plans on a quote
  So that I can provide additional information that a client may require about a plan

  Background:
    Given I login as a "Broker"

  @blocker @MSTR-1146 @MSTR-1415 @MSTR-1646
  Scenario: Detailed SBS benefits should display accurately according to the application quote SBS
    And I have a "medical" proposal
    When I open my proposal
    Then Benefit values should display the same values as those on the "published medical quote"

  @wip
  Scenario: Simple SBS should only show for medical quotes

  @wip
  Scenario: Current, renewal, and real time quote plans should all display on the side by side

  @wip
  Scenario: Current and renewal plans should be clearly marked and differentiated from real time quote plans

  @wip
  Scenario: Carrier/Market place logo should show for each plan

  @wip
  Scenario: Plan names should be clearly displayed at the top of the table for each plan

  @wip
  Scenario: Provider network should display for each plan

  @wip
  Scenario: Deductible Single In/Out should display for each plan

  @wip
  Scenario: Deductible Family In/Out should display for each plan

  @wip
  Scenario: OOP Max Single In/Out should display for each plan

  @wip
  Scenario: OOP Max Family In/Out should display for each plan

  @wip
  Scenario: Co-Insurance In/Out should display for each plan

  @wip
  Scenario: Doctor Visits / Specialist Visits should display for each plan

  @wip
  Scenario: Lab & X-Ray should display for each plan

  @wip
  Scenario: Emergency Room Visit should display for each plan

  @wip
  Scenario: Urgent Care Visit should display for each plan

  @wip
  Scenario: Hospital Outpatient (Facility/Surgery) should display for each plan

  @wip
  Scenario: Hospital Inpatient (Overnight) should display for each plan

  @wip
  Scenario: Rx Deductible (Non-Generic) should display for each plan

  @wip
  Scenario: Prescriptions (Rx Tier 1 / 2 / 3 / 4)  should display for each plan
