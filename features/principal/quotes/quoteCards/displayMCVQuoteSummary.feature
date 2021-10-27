@principal @quotes @quoteCards @displayMCVQuoteSummary @blocker @wip
Feature: Display MCV Quote Summary
  As a Requester
  I should be able to see a quote summary on my MCV quote card
  So that I can find MCV quote information I need without looking into the plan

  Background:
    Given I login as a "Requester"

  Scenario: 4-tier rates should display for MCV product line quote card
    When I have a custom plan created
      | mcv plan 1 |
    And I create a quote based on the custom plan
    Then On "mcv plan 1" quote summary card I should be able to see the "4-tier rates"

  Scenario: Total cost should display for non-voluntary MCV product line quotes
    When I have a custom plan created
      | mcv plan 1 |
    And I create a quote based on the custom plan
    Then I should see "Total Monthly Cost" text on MCV quote summary card
    And Total dollar amount should display on MCV quote summary card

  Scenario: 'Premium determined upon enrollment' should display for MCV quote, created based on Voluntary plan
    When I have a custom plan created
      | mcv plan 1 voluntary |
    And I create a quote based on the custom plan
    Then I should see "Premium determined upon enrollment" text on voluntary MCV quote summary card
    And Total dollar amount should not display on voluntary MCV quote summary card
