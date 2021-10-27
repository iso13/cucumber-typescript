@principal @quotes @quoteCards @displayGTLQuoteSummary @wip
Feature: Display GTL Quote Summary
  As a Requester
  I should be able to see a quote summary on my GTL quote card
  So that I can find GTL quote information I need without looking into the quote

  Background:
    Given I login as a "Requester"

  @blocker
  Scenario: Life and AD&D rates should display for GTL product line quote card
    When I have a custom plan created
      | gtl plan 1 |
    And I create a quote based on the custom plan
    Then On "gtl plan 1" quote summary card I should be able to see the "life and ad&d rates"

  @blocker
  Scenario: Total cost should display for GTL product line quotes
    When I have a custom plan created
      | gtl plan 1 |
    And I create a quote based on the custom plan
    Then I should see "Total Monthly Cost" text on GTL quote summary card
    And Total dollar amount should display on GTL quote summary card

  @critical
  Scenario: Precise set of parameters should display on GTL product line (AD&D included) quote card
    When I have a custom plan created
      | gtl plan 1 |
    And I create a quote based on the custom plan
    Then On "gtl plan 1" quote summary card I should be able to see the "plan benefits"

  @critical
  Scenario: AD&D rate and parameters should not display on GTL product line (AD&D not included) quote card
    When I have a custom plan created
      | gtl plan no add |
    And I create a quote based on the custom plan
    Then On "gtl plan no add" quote summary card I should be able to see the "plan benefits"
    And On "gtl plan no add" quote summary card I should not be able to see the "unexpected add benefits"

  @critical
  Scenario Outline: Selected Live Coverage Type ("<should_see>") displays on GTL product line quote card
    When I have a custom plan created
      | <plan> |
    And I create a quote based on the custom plan
    Then On GTL quote summary card I should be able to see the following parameter:
      | <should_see> |
    And On GTL quote summary card I should not be able to see the following parameter:
      | <should_not_see> |
    Examples:
      | plan                     | should_see        | should_not_see    |
      | gtl plan 1               | Flat Life Benefit | Percent of Salary |
      | gtl plan percent benefit | Percent of Salary | Flat Life Benefit |
