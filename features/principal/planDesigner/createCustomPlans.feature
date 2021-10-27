@principal @createCustomPlans @planDesigner @quote
Feature: Create Custom Plans
  As a Requester or GFS User
  I want to be able to create custom plans for all product lines
  So I can quote it and get correct rates

  @blocker @QUOTE-385
  Scenario Outline: Create a <product> plan
    Given I login as a "Requester"
    And I have a group with census
    When I populate all fields for <product> custom plan
      | <plan> |
    And I save a custom plan
    Then the custom plan should be saved successfully
    Examples:
      | product               | plan                           |
      | VTL                   | vtl plan 1                     |
      #| Dental                | dental plan 1                  |
      | Critical Illness      | ci plan 1                      |
      | Accident              | accident plan 1                |
      | Group Term Life       | gtl plan 1 mvp2                |
      | Group Term Life       | gtl plan 2 mvp2                |
      | Vision                | mcv plan non contributory mvp2 |
      | Long-Term Disability  | ltd mvp2 plan 1                |
      | Long-Term Disability  | ltd mvp2 plan 2                |
      | Short-Term Disability | std mvp2 plan 1                |

  @blocker @mvp2
  Scenario Outline: Create a <product> plan
    Given I login as a "gfs_level1"
    And I have a group with census
    When I populate all fields for <product> custom plan
      | <plan> |
    And I save a custom plan
    Then the custom plan should be saved successfully
    Examples:
      | product              | plan                              |
      | Group Term Life      | gtl plan contributory mvp2        |
      | Vision               | mcv plan contributory graded mvp2 |
      | Long-Term Disability | ltd plan bonus up mvp2            |

  @minor @wip
  Scenario: Saved plans on the left-hand side of plan designer should have a 'saved' icon

  @major @wip
  Scenario: Product lines on the left-hand side should be in the correct order
    Then products on Plan Designer page should display in the correct order
      | Dental          |
      | Vision          |
      | Group Term Life |
      | VTL             |
      | STD             |
      | LTD             |
      | CI              |
      | Accident        |

  @wip
  Scenario: Unsaved changes on plan designer page should prompt a 'save changes' dialog upon leaving the page

  @wip
  Scenario: SBC document can be uploaded/attached to a custom plan

  @QUOTE-447
  Scenario Outline: Classes removal dependency check
    Given I login as a "Requester"
    And I have a group with census created with
      | group_data   | census_data         |
      | <group_file> | Tmpl_14EEs_4cl.xlsx |
    And I populate all fields for <product_line> custom plan
      | <custom_plan> |
    When I unselect all checked classes
    Then custom plan cannot be saved
    Examples:
      | product_line          | group_file           | custom_plan     |
      | Short-Term Disability | Group CA 3571 10 STD | std mvp2 plan 1 |

  @QUOTE-447
  Scenario Outline: Classes removal dependency check
    Given I login as a "Requester"
    And I have a group with census
    And I populate all fields for <product_line> custom plan
      | <custom_plan> |
    When I unselect all checked classes
    # When the only class in the group cannot be unchecked
    And I save a custom plan
    Then the custom plan should be saved successfully
    Examples:
      | product_line          | custom_plan     |
      | Short-Term Disability | std mvp2 plan 1 |
