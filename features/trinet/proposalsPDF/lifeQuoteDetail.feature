@trinet @lifeQuoteDetail @wip @fernando
Feature: Display Benefit Programs in "Life Quote Detail" page
  As a BCT user
  I want the "Life Quote Detail" page to show in the proposal output for BCR and PCR proposals
  So that I can show which plan each benefit program will be enrolled on

  @critical
  Scenario: Plans mapped to more than one Benefit Program, but not all , benefit program details of all the plan mapped should be listed

  @critical
  Scenario: For each plan that is mapped to all benefit programs on the group "All Programs" should display instead of
  benefit program number id, name and number of WSE's in each benefit program

  @critical
  Scenario: Plan that is mapped to all benefit programs on the group the total number of eligible WSE's should appears next to "All Programs"

  @critical
  Scenario: "None" should display for each plan that is not mapped to a benefit program

  @critical
  Scenario: Verify total costs displayed for all life plans should be normal market snapshot behavior (it should be based off of enrollment of
  every eligible WSE in the group) when there is only one benefit program on the group

  @critical
  Scenario: For PCR proposals ,for plans mapped to single benefit program, "Total Monthly Charge" is based off all WSE enrolled to the benefit program

  @critical
  Scenario: PCR proposals with plans mapped to multi benefit programs but not all, Total Monthly Charge is based off all WSE enrolled to benefit program

  @critical
  Scenario: PCR proposals with plan mapped to all benefit programs and plans not mapped to any, plan Total Monthly Charge is based off all eligible WSE

  @critical
  Scenario: Ensure "Employee Monthly Charge" is 0 for all the plans since contribution is 100% Employer based

  Scenario: Validate "Benefit Program" row should be displayed on "Life Quote Detail Page" beneath of "*BENEFITS" column

  Scenario: Validate the plans that are mapped to benefit programs should be the ONLY plans that are highlighted

  Scenario: For PCR proposals with multiple benefit programs, sorting should be correct based of WSE and total cost

  Scenario: For BCR proposals with multiple benefit programs, sorting of plan is based the number of eligible WSE's, most-to-least number of WSE's

  Scenario: Validate for BCR proposals, when there is only one benefit program  on the group, there should be no plans highlighted

  Scenario: For PCR proposals, when there is only one benefit program on the group, the lowest-cost option should be highlighted and left-anchored
