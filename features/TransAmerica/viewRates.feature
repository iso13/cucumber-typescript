@transamerica @viewRates @minor @quote
Feature: View Rates
  As a Underwriter
  I want the view the rates

  Background:
    Given I login as an "Underwriter"
    And I have a group without census and owner "Billy Banana"

  Scenario: View rates for custom plan
    When I populate all fields for <product> custom plan
      | critical events plan 1 |
    And I verify view rates is disabled
    Then I save a custom plan
    And I verify view rates is enabled
    And I view rates

  @wip
  Scenario: Verify view rates content in modal
