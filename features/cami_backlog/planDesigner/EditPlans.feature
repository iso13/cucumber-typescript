@planDesigner @editCustomPlans @cami
Feature: Edit Custom Plans
  As a User
  I want the ability to edit custom plans
  So I can make changes based on client feedback or newly released carrier updates

  * 'Saved' icon should disappear for the existing plan that's being updated
  * Unsaved changes should prompt a 'save changes' dialog upon leaving the plan designer page

  Background:
    Given I login as a "userRole"

  Scenario: Update custom plan name
    And I have an existing custom plan
    When I update the plan name
    Then I should be able to save the plan

  Scenario: Update all benefit values for existing custom plan
    And I have an existing custom plan
    When I update all the benefit values
    Then I should be able to save the plan

  Scenario: Locked plans should be read-only and can not be updated
    And I have an existing locked plan
    When I update plan
    Then I should not be able to save the plan
