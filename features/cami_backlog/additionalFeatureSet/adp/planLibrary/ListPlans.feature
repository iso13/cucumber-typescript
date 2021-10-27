@listPlans @adp @cami
Feature: List Plans
  As a User
  I need to be able view a list of plans
  So that I can search for plans that I want to edit

  Scenario: Plans are searchable via plan name
    Given I login as a "userRole"
    And I have multiple plans
    When I search by a plan name
    Then I should see the results for the specific plan name

  Scenario Outline: Sort plans in ascending and descending order via the plan list header
    Given I login as a "userRole"
    And I have multiple plans
    When I sort the plans "<sort>"
    Then plans should be sorted "<sort>"
    Examples:
      | sort       |
      | ascending  |
      | descending |

  Scenario Outline: Filter plans by plan status
    Given I login as a "userRole"
    And I have multiple plans
    When I filter plans by "<status>"
    Then plans should be filtered by "<status>"
    Examples:
      | status |
      |        |

  Scenario Outline: Filter plans by plan type
    Given I login as a "userRole"
    And I have multiple plans
    When I filter plans by "<type>"
    Then plans should be filtered by "<type>"
    Examples:
      | type |
      |      |
