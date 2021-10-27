@principal @planDesigner @planValidations @validateDependenciesForVTL @critical @wip
Feature: Validate Dependencies For VTL
  As a Requester
  I need to see the available benefits in Plan Designer
  So that I can setup my VTL plan and quote it correctly

  Background:
    Given I login as a "Requester"

  Scenario Outline: Set "AD&D" benefit value equal to "Not Included" for <SIC_code> SIC code
    When I populate all group profile fields with valid data
    And I populate group profile "SIC Code" field with "<SIC_code>"
    And save the group
    Then the "AD&D" benefit of "VTL" plan design should be disabled
    And the "AD&D" benefit of "VTL" plan design should be set to "Not Included"
    Examples:
      | SIC_code |
      | 0811     |
      | 0831     |
      | 0851     |
      | 0912     |
      | 0913     |
      | 0919     |
      | 0921     |
      | 0971     |
      | 2411     |
      | 2421     |
      | 2426     |
      | 2429     |

  Scenario Outline: Validate "Employee Guarantee Issue-Under Age 70" value, if number of employees is between <min_number_of_ees> and <max_number_of_ees>
    And I have a group with census created with
      | group_data           | census_data   |
      | Group_CA_3571_10_VTL | <census_file> |
    When I start creating new "VTL" custom plan
    Then the "Employee Guarantee Issue-Under Age 70" benefit of "VTL" plan design should be set to <gi_value>

    Examples:
      | min_number_of_ees | max_number_of_ees | gi_value | census_file                  |
      | 5                 | 9                 | $20,000  | Template_5EEs_1cl.xlsx       |
      | 10                | 24                | $70,000  | Tmpl_14EEs_4cl.xlsx          |
      | 25                | 100               | $100,000 | Tmpl_50EEs_3cl_all_data.xlsx |

  Scenario Outline: Validate "Spouse Guarantee Issue-Under Age 70" value, if number of employees is between <min_number_of_ees> and <max_number_of_ees>
    And I have a group with census created with
      | group_data           | census_data   |
      | Group_CA_3571_10_VTL | <census_file> |
    When I start creating a new "VTL" custom plan
    Then the "Spouse Guarantee Issue-Under Age 70" benefit of "VTL" plan design should be set to <gi_value>

    Examples:
      | min_number_of_ees | max_number_of_ees | gi_value | census_file                  |
      | 5                 | 9                 | $10,000  | Template_5EEs_1cl.xlsx       |
      | 10                | 24                | $20,000  | Tmpl_14EEs_4cl.xlsx          |
      | 25                | 100               | $25,000  | Tmpl_50EEs_3cl_all_data.xlsx |
