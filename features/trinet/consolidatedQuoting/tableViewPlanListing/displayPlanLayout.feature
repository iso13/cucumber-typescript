@consolidatedQuoting @displayPlanLayout @poorna @wip
Feature: Display Plan Layout
  As a Carrier Admin
  I need to see the table view plan listing layout
  So I can see a consolidated plan list

  Background:
    Given I login as a "Carrier Admin"
    And I create a new group
    And I create a new proposal

  Scenario: Verify Current and Renewal Plans
    When I navigated to available plans page
    Then Current and Renewal Plans need with appending text "CURRENT PLAN" to plan name

  Scenario: Verify Current and Renewal Plans layout
    When I navigated to Selecte Plans page
    Then Current and Renewal Plans need to be displayed at the top of the table
