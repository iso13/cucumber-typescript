@consolidatedQuoting @viewAvailablePlans @poorna @wip
Feature: View Available Plans
  As a Carrier Admin
  I need to see the table view plan listing
  so that I can see plans on the screen without scrolling

  Background:
    Given I login as a "Carrier Admin"
    And I create a new group
    And I create a new proposal

  Scenario: Validate table plan view listing on the available plans page
    When I select table view from "Select View" from available plans page
    Then user is shown table view of all the available plans

  Scenario: Validate table plan view listing on the selected plans page
    When I select table view from "Select View" selected plans page
    Then user is shown table view of all the available plans

  Scenario: Validate selection of plans
    When I select plans to include in the proposal
    Then only selectd plans should be included in the proposal

  Scenario: Validate de-selection of plans
    When I de-select plans to include in the proposal
    Then unselected plans should NOT be included in the proposal
