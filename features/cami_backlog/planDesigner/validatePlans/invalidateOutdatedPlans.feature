@planDesigner @validatePlans @invalidateOutdatedPlans @cami
Feature: Invalidate Outdated Custom Plans
  As a User
  I want to be sure that outdated plans are marked as invalid
  So my quotes are created correctly and not declined in future

  Scenario: Custom plan gets invalidated on census change
    Given I login as a "userRole"
    And I have existing custom plan
    When I update the census
    Then the plan should be invalidated

  Scenario: Custom plan gets invalidated on group profile change
    Given I login as a "userRole"
    And I have existing custom plan
    When I update the group profile
    Then the plan should be invalidated

  Scenario: Outdated locked custom plan cannot be quoted
    Given I login as a "userRole"
    And I have existing outdated locked custom plan
    When I quote the custom plan
    Then I should not be able to create a quote

  Scenario: Outdated unlocked custom plan cannot be saved
    Given I login as a "userRole"
    And I have existing outdated locked custom plan
    When I do not make o changes to the plan
    And I save the custom plan
    Then I should not be able to save the plan
