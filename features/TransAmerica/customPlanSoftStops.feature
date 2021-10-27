@transamerica @planDesigner @quote @major
Feature: Create Custom Plans with softStop warnings
  As a Broker
  I want to be able to create custom plans for all product lines
  and be warned when it requires UW review
  So I can decide to continue to quote or not

  Background:
    Given I login as a "Underwriter"
    And I have a group without census and owner "Billy Banana"

  Scenario: Warning prompt pops up, continue to save
    When I populate all fields for <product> custom plan
      | accident advance plan di rider |
    And I attempt to save a custom plan
    Then I should see a warning prompt with message "This plan requires underwriting review because of the DI Rider"
    And I "continue" on softstop warning
    And the custom plan should be saved successfully

  Scenario: Warning prompt pops up, do not save
    When I populate all fields for <product> custom plan
      | accident advance plan di rider |
    And I attempt to save a custom plan
    Then I should see a warning prompt with message "This plan requires underwriting review because of the DI Rider"
    And I "cancel" on softstop warning
    And custom plan is not saved
