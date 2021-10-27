@updateGlobalPlan @globalPlan @cami
Feature: Update Global Plan
  As a User
  I want to be able to update global plans
  So that I can keep my plans updated

  Scenario: Update carrier selection for dental
    Given I login as a "userRole"
    When I open the global plan designer
    Then I should be able to update "carrier" selection for "dental"

  Scenario: Update carrier selection for vision
    Given I login as a "userRole"
    When I open the global plan designer
    Then I should be able to update "carrier" selection for "vision"

  Scenario: Update carrier selection for medical
    Given I login as a "userRole"
    When I open the global plan designer
    Then I should be able to update "carrier" selection for "medical"

  Scenario: Update carrier selection for life
    Given I login as a "userRole"
    When I open the global plan designer
    Then I should be able to update "carrier" selection for "life"

  Scenario: Update global plan names for dental
    Given I login as a "userRole"
    When I open the global plan designer
    Then I should be able to update "plan names" for "dental"

  Scenario: Update global plan names for medical
    Given I login as a "userRole"
    When I open the global plan designer
    Then I should be able to update "plan names" for "medical"

  Scenario: Update global plan names for vision
    Given I login as a "userRole"
    When I open the global plan designer
    Then I should be able to update "plan names" for "vision"

  Scenario: Update global plan names for life
    Given I login as a "userRole"
    When I open the global plan designer
    Then I should be able to update "plan names" for "life"
