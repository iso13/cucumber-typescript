@principal @quotes @quoteCards @displayVTLQuoteSummary @QUOTE-367 @quote
Feature: Display VTL Quote Summary
  As a Requester
  I should be able to see a quote summary on my VTL quote card
  So that I can find VTL quote information I need without looking into the quote

  Background:
    Given I login as a "Requester"

  @critical
  Scenario: Precise set of parameters should display on VTL product line quote card
    When I have a quote created based on plan
      | vtl plan 1 |
    Then On "vtl plan 1" quote summary card I should be able to see the "plan design benefits"

  @blocker
  Scenario: 'Premium determined upon enrollment' should display for VTL quote, created based on VTL plan
    When I have a quote created based on plan
      | vtl plan 1 |
    Then Total dollar amount should not display on VTL quote summary card
    And I should see "Premium determined upon enrollment" text on VTL quote summary card

  @blocker
  Scenario: Age-banded rates table displays on "View Rates" modal
    When I have a quote created based on plan
      | vtl plan 1 |
    And I open 'View Rates' dialog for "VTL Rates (Per $1,000)"
    Then On 'View Rates' dialog of "vtl plan 1" I should be able to see the "age-banded rate table"

  @critical
  Scenario: Child Benefits options and premiums display on "View Rates" modal
    When I have a quote created based on plan
      | vtl plan 1 |
    And I open 'View Rates' dialog for "VTL Rates (Per $1,000)"
    Then On 'View Rates' dialog of "vtl plan 1" I should be able to see the "child benefit rate table"
