@principal @quotes @quoteCards @displaySTDQuoteSummary @wip
Feature: Display STD Quote Summary
  As a Requester
  I should be able to see a quote summary on my STD quote card
  So that I can find STD quote information I need without looking into the quote

  Background:
    Given I login as a "Requester"

  @blocker
  Scenario: 'Premium determined upon enrollment' should display for STD quote, created based on STD voluntary plan
    When I have a quote created based on plan
      | std plan voluntary graded com |
    Then Total dollar amount should not display on STD quote summary card
    And I should see "Premium determined upon enrollment" text on voluntary STD quote summary card
    And On "std plan voluntary graded com" quote summary card I should be able to see the "voluntary benefit values"

  @blocker
  Scenario: Total monthly cost param of STD non-voluntary quote display calculated numerical values
    When I have a quote created based on plan
      | std plan 1 |
    Then Total dollar amount should display on STD quote summary card
    And I should see "Total Monthly Cost" text on STD quote summary card

  @critical
  Scenario: Precise set of parameters should display on STD product line quote card
    When I have a quote created based on plan
      | std plan voluntary graded com |
    Then On "std plan voluntary graded com" quote summary card I should be able to see the "plan design benefits"

  @blocker
  Scenario: Rate, Volume and Lives params of STD non-voluntary quote display calculated numerical values
    When I have a quote created based on plan
      | std plan 1 |
    Then On "std plan 1" quote summary card I should be able to see the "calculated Volume, Lives and Rate"
