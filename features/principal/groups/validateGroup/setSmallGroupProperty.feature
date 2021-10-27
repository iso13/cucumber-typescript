@principal @groups @validateGroup @setSmallGroupProperty
Feature: Set Small Group Property
  As a Requester
  I need to declare if my WA group falls under the definition of small one
  So that I can get the correct plan presets for my group

  Background:
    Given I login as a "Requester"

  @critical
  Scenario: Ask small group question only for WA groups with Dental, Vision product lines selected, and that have 50 or less EEs on census
    When I have a group with census created with
      | group_data          | census_data                  |
      | Group WA 3571 50 DV | Tmpl_50EEs_3cl_all_data.xlsx |
    Then the small group question modal should be displayed

  @critical
  Scenario: Ask small group question, when group state gets updated from any other state to WA
    And I have a group with census created with
      | group_data          | census_data                  |
      | Group CA 3571 50 DV | Tmpl_50EEs_3cl_all_data.xlsx |
    When I update group profile "Zip Code" value to "98001"
    And I save the group
    Then the small group question modal should be displayed

  @critical
  Scenario: Ask small group question, when number of eligible employees drops below 51 for WA group
    When I have a group with census created with
      | group_data          | census_data                  |
      | Group WA 3571 50 DV | Tmpl_51EEs_3cl_all_data.xlsx |
    And I delete employees from census, so there are only "50" employees left
    Then the small group question modal should be displayed

  @critical
  Scenario Outline: Ask small group question, when <product_line> product is added to WA group coverage
    And I have a group with census created with
      | group_data         | census_data                  |
      | Group WA 3571 50 L | Tmpl_50EEs_3cl_all_data.xlsx |
    When I select <product_line> line
    And I save the group
    Then the small group question modal should be displayed
    Examples:
      | product_line |
      | Dental       |
      | Vision       |

  @wip
  Scenario: Set small group property to 'true', when user answers 'Yes'
    When I have a group with census created with
      | Group_WA_3571_50_DV | Tmpl_50EEs_3cl_all_data.xlsx |
    And I answer "Yes" to the small group question
    Then group property "additional_fields.is_small_group" gets "true" value

  @wip
  Scenario: Set small group property to 'false', when user answers 'No'
    When I have a group with census created with
      | Group_WA_3571_50_DV | Tmpl_50EEs_3cl_all_data.xlsx |
    And I answer "No" to the small group question
    Then group property "additional_fields.is_small_group" gets "false" value

  @wip
  Scenario: Set small group property to 'false' automatically, when there are more than 50 EEs on census for WA group
    When I have a group with census created with
      | Group_WA_3571_51_DV | Tmpl_51EEs_3cl_all_data.xlsx |
    Then group property "additional_fields.is_small_group" gets "false" value

  @minor @wip
  Scenario: Clear small group property value, when group state is updated from WA to any other state
    When I have a group with census created with
      | Group_WA_3571_50_DV | Tmpl_50EEs_3cl_all_data.xlsx |
    And I answer "Yes" to the small group question
    And I change group profile "Zip Code" to "94103"
    And I save the group
    Then group property "additional_fields.is_small_group" gets "null" value

  @minor @wip
  Scenario: Clear small group property value, when user de-selects both Dental and Vision products
    When I have a group with census created with
      | Group_WA_3571_50_DV | Tmpl_50EEs_3cl_all_data.xlsx |
    And I answer "Yes" to the small group question
    And I unselect "Dental, Vision" lines for quoting
    And I save the group
    Then group property "additional_fields.is_small_group" gets "null" value
