@planDesigner @deleteCustomPlans @cami
Feature: Delete Custom Plans
  As a User
  I need the ability to delete plans
  So that I can remove plans that are no longer needed

  Scenario: Delete unlocked custom plan
    Given I login as an "<string>"
    And I have an unlocked custom plan
    When I delete the unlocked custom plan
    Then I should be able to delete the custom plan

  Scenario: Locked plans can not be deleted
    Given I login as an "<string>"
    And I have a locked custom plan
    When I try to delete the locked custom plan
    Then I should not be able to delete the custom plan
