@planDesigner @createCustomPlans @cami
Feature: Create Custom Plans
  As a User
  I want to be able to create custom plans
  So I can quote them and get correct rates

  * Saved plans on the left-hand side of plan designer should have a 'saved' icon
  * Unsaved changes on plan designer page should prompt a 'save changes' dialog upon leaving the page

  @blocker @stepsAdded
  Scenario: Create custom plan
    Given I login as a "userRole"
    And I have a group with census
    When I start creating new 'Dental' custom plan
    And I populate required benefit values:
      | benefit_name | benefit_value |
      |              |               |
    And I save the plan
    Then the plan should be saved successfully

  Scenario: Duplicate custom plan
    Given I login as a "userRole"
    And I have a custom plan
    When I duplicate the existing custom plan
    Then I should see the duplicated custom plan
