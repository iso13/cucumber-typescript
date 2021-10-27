@principal @quotes @quoteCards @displayLTDQuoteSummary @wip
Feature: Display LTD Quote Summary
  As a Requester
  I should be able to see a quote summary on my LTD quote card
  So that I can find LTD quote information I need without looking into the quote

  Background:
    Given I login as a "Requester"

  @blocker
  Scenario: Total monthly cost, calculated Lives and CME should display for LTD quote, created based on LTD non-voluntary plan
    When I have a quote created based on plan
      | ltd plan 1 |
    And On "ltd plan 1" quote summary card I should be able to see the "numerical Lives and CME benefit values"
    And Total dollar amount should display on LTD quote summary card
    And I should see "Total Monthly Cost" text on LTD quote summary card

  @blocker
  Scenario: 'Premium determined upon enrollment' should display for LTD quote, created based on LTD voluntary plan
    When I have a quote created based on plan
      | ltd voluntary plan |
    Then Total dollar amount should not display on LTD quote summary card
    And I should see "Premium determined upon enrollment" text on voluntary LTD quote summary card
    And On "ltd voluntary plan" quote summary card I should be able to see the "voluntary benefit values"

  @blocker @dev @test
  Scenario: Composite rate should display for LTD quote card for a group with 10 or more employees
    And I have a group with census created with
      | group_data     | census_data             |
      | i have a group | Template_10EEs_1cl.xlsx |
    And I create new custom plan:
      | ltd plan 1 |
    When I create a quote based on the custom plans
    Then On "ltd plan 1" quote summary card I should be able to see the "composite rate"

  @blocker @dev @test
  Scenario: Age-banded rates should display for LTD quote card for a group with less than 10 employees
    And I have a group with census created with
      | group_data     | census_data            |
      | i have a group | Template_5EEs_1cl.xlsx |
    And I create new custom plan:
      | ltd plan 1 |
    And I create a quote based on the custom plans
    When I open 'View Rates' dialog for "LTD Rates (per $100 of CME)"
    Then On 'View Rates' dialog of "ltd plan 1" I should be able to see the "age-banded rate table"

  @critical
  Scenario: Precise set of parameters should display on LTD product line quote card
    When I have a quote created based on plan
      | ltd plan 1 |
    And On "ltd plan 1" quote summary card I should be able to see the "plan design benefits"
