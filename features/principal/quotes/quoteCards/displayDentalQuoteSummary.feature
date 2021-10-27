@principal @quotes @quoteCards @displayDentalQuoteSummary @QUOTE-367 @quote @wip
Feature: Display Dental Quote Summary
  As a Requester
  I should be able to see a quote summary on my Dental quote card
  So that I can find dental quote information I need without looking into the quote

  Background:
    Given I login as a "Requester"

  @blocker @QUOTE-329
  Scenario: 'Premium determined upon enrollment' should display for Dental quote, created based on dental voluntary plan
    When I have a quote created based on plan
      | valid voluntary dental plan |
    Then Total dollar amount should not display on Dental quote summary card
    And I should see "Premium determined upon enrollment" text on voluntary Dental quote summary card

  @blocker
  Scenario: Total monthly cost should display for non-voluntary Dental product line quotes
    When I have a quote created based on plan
      | dental plan 1 |
    Then Total dollar amount should display on Dental quote summary card
    And I should see "Total Monthly Cost" text on Dental quote summary card

  @blocker
  Scenario: 4-tier rates should display for Dental product line quote card
    When I have a quote created based on plan
      | dental plan 1 |
    Then On "dental plan 1" quote summary card I should be able to see the "4-tier rates"

  @critical
  Scenario: Precise set of parameters should display on EPO Dental Quote Card
    When I have a quote created based on plan
      | dental plan EPO |
    Then On "dental plan EPO" quote summary card I should be able to see the "EPO plan benefits"

  @critical
  Scenario: Precise set of parameters should display on PPO Dental Quote Card
    When I have a quote created based on plan
      | dental plan 1 |
    Then On "dental plan 1" quote summary card I should be able to see the "PPO plan benefits"

  @critical
  Scenario: Precise set of parameters should display on POS Dental Quote Card
    When I have a quote created based on plan
      | dental plan POS |
    Then On "dental plan POS" quote summary card I should be able to see the "POS plan benefits"

  @major
  Scenario: Census lives count by tier should display on Dental Quote Card
