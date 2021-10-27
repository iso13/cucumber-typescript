@consolidatedQuoting @manageContributionPreset @backlog @poorna @wip
Feature: Manage Contribution Preset
  As a user
  I need to have the ability to set contribution strategy for employees and dependents using presets

  Background:
    Given I login as a "Carrier Admin"
    And I create a new group
    And I create a new proposal

  Scenario: Validate the ability to show contribution change message to user
    When user changed contribution dropdown selection from the side rail
    Then user is shown with a dialog indicating change "Confirm Contributions Change"

  Scenario: Validate the ability to change contribution selection
    When user changed contribution selection
    And user selects CONTINUE on dialog "Confirm Contributions Change"
    Then selected contribution preset should be applied to the quote

  Scenario: Validate the ability to cancel change of contribution selection
    When user changed contribution selection
    And user selects CANCEL on dialog "Confirm Contributions Change"
    Then contributions should NOT be changed / updated

  Scenario: Validate the ability to change contribution selection manually
    When user changed contribution selection
    And user inputs different contributions data
    Then selected contribution preset should shown as "CUSTOM" in the side rail

  Scenario: Validate the ability of auto-mapped contribution selection to "Match Current"
    When the contribution strategy has been auto-mapped from the current quote
    Then contribution dropdown should display "Match Current" as the selected value
