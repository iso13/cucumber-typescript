@core @proposal @costComparison @wip
Feature: Cost comparison
  As a Broker
  I want to compare the costs of plans in a market
  So that I can get insight into the cost of all plans available

  Scenario: Cost comparison pages should only show for medical market snapshots

  Scenario: 'Premium Contribution', 'Census: EE x | DEP x | Lives: x' and 'Effective Date' should all be displayed at the top of the page for the quote

  Scenario: The number of plans on the quote should be displayed at the top of the page

  Scenario: If there is a current quote then that should be displayed with the quotes costs at the top of the list(all others are broken down by plan but current should use the quote costs)

  Scenario: The name of each plan on the quote should be displayed in the table. The plan name should include marketplace and carrier name

  Scenario: The in and-out of network deductible values should be displayed for each plan

  Scenario: ER and EE difference should be displayed for each plan

  Scenario: Eligible employee breakdown should be displayed for each plan

  @critical @jorge
  Scenario: ER, EE and Total Cost should be displayed for each plan(including current quote)

  Scenario: The % difference in total cost should be displayed for each plan
