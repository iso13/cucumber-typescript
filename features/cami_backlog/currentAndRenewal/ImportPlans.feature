@ImportPlans @cami
Feature: Import Plans
  As a User
  I need the ability to Import current and renewal plans
  So that I can import and use already existing Plan template

  Background:
    Given I login as a "<user_role>"

  Scenario Outline: Import product plan
    When I have an existing "<product>" plan
    Then I should be able to import the "<product>" plan
    Examples:
      | product |
      | medical |
      | dental  |
      | vision  |
      | life    |

  Scenario: Plans imported and altered should not affect the original plan
    When I have an existing "<product>" plan
    And I import a product plan
    Then the original plan should not change

  Scenario: Import several plans
    When I have an existing "<product>" plan
    And I import several product plans
    Then the original plan should not change
