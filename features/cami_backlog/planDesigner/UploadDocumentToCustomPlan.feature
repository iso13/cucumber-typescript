@planDesigner @uploadDocumentToCustomPlan @cami
Feature: Upload Documents To Custom Plan
  As a User
  I want the ability to add benefit documents to my custom plans
  So that when presenting to clients I can provide all the details they need

  Background:
    Given I login as a "userRole"

  Scenario: SBC document can be attached to a custom plan
    And I have an existing custom plan
    When I attach an SBC document to the custom plan
    Then I should be able to see the SBC document within the plan

  Scenario: Uploaded document replaces the one, that's been attached before
    And I have an existing custom plan with an attacked SBC document
    When I attach an SBC document to the custom plan
    Then I should be able to see the new SBC document within the plan

  Scenario: SBC document can be removed from custom plan
    And I have an existing custom plan with an attacked SBC document
    When I remove the SBC document from the plan
    Then I should not be able to see the SBC document
