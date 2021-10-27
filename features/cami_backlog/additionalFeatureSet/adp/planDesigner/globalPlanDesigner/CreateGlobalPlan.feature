@createGlobalPlan @globalPlan @adp @blocker @stepsAdded @cami
Feature: Create Global Plan
  As a User
  I want to create a Global Plan
  So that I can create plans similar to published plans

  * Global plan should have all the benefits and benefit types as published plans on the market
  * Benefits presets should be available to configure Global Plans

  Scenario: Create global plan
    Given I login as a "userRole"
    And I navigate to global plan designer
    When I start creating new 'Dental' global plan
    And I populate benefit values:
      | benefit_name | benefit_value |
      |              |               |
    And I save the plan
    Then the plan should be saved successfully
