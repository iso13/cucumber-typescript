@planDesigner @validatePlans @validatePlansByEE @cami
Feature: Validate Plans By Number of Assigned Employees
  As a User
  I want to be sure the minimum required number of eligible EEs, included into multiple classes, is assigned to my plan
  So my quotes are created correctly and not declined in future

  Scenario: Save Custom plan by EE (stand-alone coverage) is met
    Given I login as a "userRole"
    And I have existing custom plan (stand-alone coverage)
    When minimum number of EEs is met
    Then I should be able to save the plan

  Scenario: Save Custom plan by EE (stand-alone coverage) is not met
    Given I login as a "userRole"
    And I have existing custom plan with (stand-alone coverage)
    When minimum number of EEs is not met
    Then I should not be able to save the plan

  Scenario: Save Custom plan by EE (combined coverage) is met
    Given I login as a "userRole"
    And I have existing custom plan with (combined coverage)
    When minimum number of EEs is not met
    Then I should not be able to save the plan

  Scenario: Save Custom plan by EE (combined coverage) is not met
    Given I login as a "userRole"
    And I have existing custom plan with (combined coverage)
    When minimum number of EEs is not met
    Then I should not be able to save the plan
