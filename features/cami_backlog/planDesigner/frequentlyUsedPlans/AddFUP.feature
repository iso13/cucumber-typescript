@addFUP @cami
Feature: Add Frequently Used Plan
  As a User
  I want to be able to add my custom plans to a list of frequently used plans
  So that I can save time and reuse common custom plans later across groups

  Scenario: Add custom plan to a list of frequently used plans
    Given I login as an "<string>"
    And I have saved custom plan
    When I add the saved custom plan to FUP
    Then I should be able to see my custom plan in the FUP

  Scenario: Add new (unsaved) custom plan to a list of frequently used plans
    Given I login as an "<string>"
    And I have new custom plan
    When I add the new custom plan to FUP
    Then I should be able to see my custom plan in the FUP

  Scenario: Adding of a custom plan is not possible if plan is invalid
    Given I login as an "<string>"
    And I have a custom plan using an outdated FUP
    When I save the custom plan
    Then I should not be able to save the custom plan

  Scenario: Updating of a custom plan doesn't affect previously saved frequently used plan
    Given I login as an "<string>"
    And I have a custom plan which is already an FUP
    When I modify the custom plan
    Then the frequently used plan is not updated
