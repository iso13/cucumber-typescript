@trinet @createMedicalCurrentAndRenewalQuotes @fernando
Feature: Create Current and Renewal Medical Quote
  As a Broker
  I need the ability to create current and renewal medical quotes
  So that I can show my clients the difference between their previous years and new plans this year

  Background:
    Given I login as a "carrier_admin"
    And I create a new group with "minimum group data" and owner as "TriNet Sales"
    And I upload a census "Exchange II - XI RFP Template File" selecting "Exchange II / XI RFP Template File" as template type
    And I navigate to current and renewal

  @blocker @MSTR-847 @MSTR-1984 @MSTR-812 @MSTR-2249 @MSTR-2319 @MSTR-2338 @MSTR-2352 @MSTR-2490
  Scenario: Create a current and renewal quote via custom plans for medical
    When I create a medical current custom quote with "medical current custom data"
    And I create a medical renewal custom quote with "medical renewal custom data"
    Then Medical current and renewal should be successfully created

  @wip @critical
  Scenario: Validate for 4 tier C/R quotes, plan tier costs are displayed correctly on modeling SBS tab along with correct rates and costs

  @wip @critical
  Scenario: Validate for ACA C/R quotes, plan total cost are displayed correctly on modeling SBS tab along with correct rates and costs

  @wip @critical
  Scenario: Confirm plans name, benefits, and rates display correctly for C/R quotes on sbs tab in a real time quote for medical

  @wip @critical
  Scenario: Confirm that employer percentage contribution strategy working correctly in the contribution-tab for a current quote

  @wip @critical
  Scenario: Confirm that employer flat-dollar contribution strategy working correctly in the contribution-tab for a current quote

  @wip @critical
  Scenario: Confirm that employee percentage contribution strategy working correctly in the contribution-tab for a current quote

  @wip @critical
  Scenario: Confirm that employee flat-dollar contribution strategy working correctly in the contribution-tab for a current quote

  @wip @critical
  Scenario: Confirm that $ funding cap contribution strategy working correctly in the contribution-tab for a current quote

  @wip @critical
  Scenario: Confirm that funding cap plan contribution strategy working correctly in the contribution-tab for a current quote

  @wip @critical
  Scenario: Confirm that employer percentage contribution strategy working correctly in the contribution-tab for a renewal quote

  @wip @critical
  Scenario: Confirm that employer flat-dollar contribution strategy working correctly in the contribution-tab for a renewal quote

  @wip @critical
  Scenario: Confirm that employee percentage contribution strategy working correctly in the contribution-tab for a renewal quote

  @wip @critical
  Scenario: Confirm that employee flat-dollar contribution strategy working correctly in the contribution-tab for a renewal quote

  @wip @critical
  Scenario: Confirm that $ funding cap contribution strategy working correctly in the contribution-tab for a renewal quote

  @wip @critical
  Scenario: Confirm that funding cap plan contribution strategy working correctly in the contribution-tab for a renewal quote

  @wip @critical
  Scenario: Confirm you are able to select any Custom Plan you created as base plan to be compared against any other custom plan

  @wip @critical
  Scenario: Confirm that you see by default the contributions for employer strategies is 100%

  @wip @critical
  Scenario: Confirm that you see by default the contributions for employee strategies is 0%

  @wip @critical
  Scenario: Confirm that you see by default the contributions for employer flat-dollar strategy is the total cost of the plan tier

  @wip @critical
  Scenario: Confirm that you see by default the contributions for employee flat-dollar strategy is 0

  @wip @critical
  Scenario: Confirm that you see the contributions set in the current quote are mapped to the contributions renewal quote

  @wip @critical
  Scenario: Confirm that you are able to save your plan comparison

  @wip @critical
  Scenario: Confirm that you are able to create a new plan comparison

  @wip @critical
  Scenario: Confirm that you are able to change your base plan comparison

  @wip @critical
  Scenario: Confirm that you are able to add a new plan to the plans comparison

  @wip @critical
  Scenario: Confirm that you are able to add all plan to your plans comparison

  @wip @critical
  Scenario: Confirm that you see your custom plan on the census-modeling tab plans drop down

  @wip @critical
  Scenario: Confirm that the census contributions costs are correct according to the selected Plan for employer percentage

  @wip @critical
  Scenario: Confirm that the census contributions costs are correct according to the selected Plan for employer flat-dollar

  @wip @critical
  Scenario: Confirm that the census contributions costs are correct according to the selected Plan for employee percentage

  @wip @critical
  Scenario: Confirm that the census contributions costs are correct according to the selected Plan for employee flat-dollar

  @wip @critical
  Scenario: Confirm that the census contributions costs are correct according to the selected Plan for $ funding cap

  @wip @critical
  Scenario: Confirm that the census contributions costs are correct according to the selected Plan for funding cap plan

  @wip @critical
  Scenario: Confirm that contributions are correct according to the selected Plan in the census page

  @wip @critical
  Scenario: Confirm that DMFL does not affect contributions in the Census page

  @wip @critical
  Scenario: Confirm that you are able to remove  current quotes

  @wip @critical
  Scenario: Confirm when you remove current quote renewal quote is also removed.
