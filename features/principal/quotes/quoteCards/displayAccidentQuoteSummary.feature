@principal @quotes @quoteCards @displayAccidentQuoteSummary @QUOTE-367 @quote
Feature: Display Accident Quote Summary
  As a Requester
  I should be able to see a quote summary on my Accident quote card
  So that I can find accident quote information I need without looking into the quote

  Background:
    Given I login as a "Requester"

  @blocker
  Scenario: 'Premium determined upon enrollment' should display for Accident quote, created based on accident plan
    When I have a quote created based on plan
      | accident plan 1 |
    Then Total dollar amount should not display on Accident quote summary card
    And I should see "Premium determined upon enrollment" text on Accident quote summary card

  @blocker
  Scenario: 4-tier rates should display for Accident product line quote card
    When I have a quote created based on plan
      | accident plan 1 |
    Then On "accident plan 1" quote summary card I should be able to see the "4-tier rates"

  @critical
  Scenario: Precise set of parameters should display on Accident Quote Card
    When I have a quote created based on plan
      | accident plan 1 |
    Then On "accident plan 1" quote summary card I should be able to see the "plan design benefits"
