@principal @planDesigner @validatePlans @validatePlansByEE @quote
Feature: Validate Plans By Number of Assigned Employees
  As a Requester
  I want to be sure the minimum required number of eligible EEs, included into multiple classes, is assigned to my plan
  So my quotes are created correctly and not declined in future

  Background:
    Given I login as a "Requester"

  @blocker @QUOTE-385
  Scenario Outline: Validate <product_line> plan can be saved successfully (stand-alone coverage), if <min_number_of_ees> or more eligible EEs are assigned
    And I have a group with census created with
      | group_data   | census_data         |
      | <group_file> | Tmpl_14EEs_4cl.xlsx |
    When I populate all fields for <product_line> custom plan
      | <custom_plan> |
    And I unselect classes <class_numbers> to quote
    And I save a custom plan
    Then the custom plan should be saved successfully

    Examples:
      | product_line          | min_number_of_ees | group_file           | custom_plan                    | class_numbers |
      #| Dental                | 3                 | Group CA 3571 10 D   | dental plan 1                  | 2, 3, 4       |
      | Vision                | 5                 | Group CA 3571 10 Vis | mcv plan non contributory mvp2 | 1, 2, 4       |
      | Group Term Life       | 5                 | Group CA 3571 50 L   | gtl plan 1 mvp2                | 1, 2, 4       |
      | Short-Term Disability | 5                 | Group CA 3571 10 STD | std mvp2 plan 1                | 3, 4          |
      | Long-Term Disability  | 5                 | Group CA 3571 10 LTD | ltd mvp2 plan 1                | 3, 4          |
      | VTL                   | 5                 | Group CA 3571 10 VTL | vtl plan 1                     | 1, 2, 4       |

  @blocker @QUOTE-482
  Scenario Outline: Validate <product_line> plan cannot be saved (stand-alone coverage), if less than <min_number_of_ees> eligible EEs are assigned
    And I have a group with census created with
      | group_data   | census_data         |
      | <group_file> | Tmpl_14EEs_4cl.xlsx |
    When I populate all fields for <product_line> custom plan
      | <custom_plan> |
    And I unselect classes <class_numbers> to quote
    Then I should not be able to save the plan
    And Message about not meeting the requirement of minimum number of lives should display

    Examples:
      | product_line          | min_number_of_ees | group_file           | custom_plan                    | class_numbers |
      #| Dental                | 3                 | Group CA 3571 10 D   | dental plan 1                  | 1, 3, 4       |
      | Vision                | 5                 | Group CA 3571 10 Vis | mcv plan non contributory mvp2 | 1, 2, 3       |
      | Group Term Life       | 5                 | Group CA 3571 50 L   | gtl plan 1 mvp2                | 1, 2, 3       |
      | Short-Term Disability | 5                 | Group CA 3571 10 STD | std mvp2 plan 1                | 1, 2, 3       |
      | Long-Term Disability  | 5                 | Group CA 3571 10 LTD | ltd mvp2 plan 1                | 1, 2, 3       |
      | VTL                   | 5                 | Group CA 3571 10 VTL | vtl plan 1                     | 1, 2, 3       |

  @critical @PFG-1497 @QUOTE-385
  Scenario Outline: Validate <product_line> plan can be saved successfully (combined coverage), if <min_number_of_ees> or more eligible EEs are assigned
    And I have a group with census created with
      | group_data     | census_data         |
      | i have a group | Tmpl_14EEs_4cl.xlsx |
    When I populate all fields for <product_line> custom plan
      | <custom_plan> |
    And I unselect classes <class_numbers> to quote
    And I save a custom plan
    Then the custom plan should be saved successfully

    Examples:
      | product_line          | min_number_of_ees | custom_plan                    | class_numbers |
      #| Dental                | 3                 | dental plan 1                  | 2, 3, 4       |
      | Vision                | 3                 | mcv plan non contributory mvp2 | 2, 3, 4       |
      | Group Term Life       | 3                 | gtl plan 1 mvp2                | 2, 3, 4       |
      | Short-Term Disability | 3                 | std mvp2 plan 1                | 2, 3, 4       |
      | Long-Term Disability  | 3                 | ltd mvp2 plan 1                | 2, 3, 4       |
      | VTL                   | 5                 | vtl plan 1                     | 1, 2, 4       |
      | Critical Illness      | 5                 | ci plan 1                      | 1, 2, 4       |
      | Accident              | 5                 | accident plan 1                | 1, 2, 4       |

  @critical
  Scenario Outline: Validate <product_line> plan cannot be saved (combined coverage), if less than <min_number_of_ees> eligible EEs are assigned
    And I have a group with census created with
      | group_data     | census_data         |
      | i have a group | Tmpl_14EEs_4cl.xlsx |
    When I populate all fields for <product_line> custom plan
      | <custom_plan> |
    And I unselect classes <class_numbers> to quote
    Then I should not be able to save the plan
    And Message about not meeting the requirement of minimum number of lives should display

    Examples:
      | product_line          | min_number_of_ees | custom_plan                    | class_numbers |
      #| Dental                | 3                 | dental plan 1                  | 1, 3, 4       |
      | Vision                | 3                 | mcv plan non contributory mvp2 | 1, 3, 4       |
      | Group Term Life       | 3                 | gtl plan 1 mvp2                | 1, 3, 4       |
      | Short-Term Disability | 3                 | std mvp2 plan 1                | 1, 3, 4       |
      | Long-Term Disability  | 3                 | ltd mvp2 plan 1                | 1, 3, 4       |
      | VTL                   | 5                 | vtl plan 1                     | 1, 2, 3       |
      | Critical Illness      | 5                 | ci plan 1                      | 1, 2, 3       |
      | Accident              | 5                 | accident plan 1                | 1, 2, 3       |
