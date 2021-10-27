@principal @createCustomPlans @planDesigner @quote @major
Feature: Copy Custom Plan
  As a "user"
  I want to be able to copy plans
  So that I can verify benefits persist with dependencies

  @QUOTE-448
  Scenario Outline: Benefit dependency
    Given I login as a "Requester"
    And I have a group with census
    And I populate all fields for <product> custom plan
      | <custom_plan> |
    And I save a custom plan
    And the custom plan should be saved successfully
    When I copy plan
      | <custom_plan> |
    Then I can set the benefit "commission_type" radio with value "<benefitValue>"
      | <dependency> | <visible> | range |
    Examples:
      | product               | custom_plan     | dependency         | visible | benefitValue |
      | Short-Term Disability | std mvp2 plan 1 | commission_percent | false   | Graded       |
      | Short-Term Disability | std mvp2 plan 2 | commission_percent | true    | Flat         |

  @QUOTE-447
  Scenario Outline: Classes removal dependency check
    Given I login as a "Requester"
    And I have a group with census created with
      | group_data   | census_data         |
      | <group_file> | Tmpl_14EEs_4cl.xlsx |
    And I populate all fields for <product_line> custom plan
      | <custom_plan> |
    And I save a custom plan
    And the custom plan should be saved successfully
    And I copy plan
      | <custom_plan> |
    When I unselect all checked classes
    Then custom plan cannot be saved
    Examples:
      | product_line          | group_file           | custom_plan     |
      | Short-Term Disability | Group CA 3571 10 STD | std mvp2 plan 1 |
