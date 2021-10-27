@principal @quotes @quoteCards @displayCIQuoteSummary @QUOTE-367 @quote
Feature: Display Critical Illness Quote Summary
  As a Requester
  I should be able to see a quote summary on my CI quote card
  So that I can find CI quote information I need without looking into the quote

  Background:
    Given I login as a "Requester"

  @blocker
  Scenario: Rates per age band should display for CI product line quote card
    When I have a quote created based on plan
      | ci plan 1 |
    And I open 'View Rates' dialog for "CI Rates (Per $1,000) "
    Then On 'View Rates' dialog of "ci plan 1" I should be able to see the "age-banded rate table"

  @critical
  Scenario: Precise set of parameters should display on CI product line quote card
    When I have a quote created based on plan
      | ci plan 1 |
    Then On "ci plan 1" quote summary card I should be able to see the "plan design benefits"

  @blocker
  Scenario: 'Premium determined upon enrollment' should display for CI product line quotes
    When I have a quote created based on plan
      | ci plan 1 |
    Then Total dollar amount should not display on Critical Illness quote summary card
    And I should see "Premium determined upon enrollment" text on Critical Illness quote summary card
