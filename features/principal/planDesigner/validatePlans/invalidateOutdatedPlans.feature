@principal @planDesigner @validatePlans @invalidateOutdatedPlans @wip
Feature: Invalidate Outdated Plans
  As a Requester
  I want to be sure that outdated plans are marked as invalid
  So my quotes are created correctly and not declined in future

  Background:
    Given I login as a "Requester"

  Scenario Outline: <product_line> plan becomes outdated on census change
    And I have a quote created based on plan
      | <custom_plan> |
    When I add an employee to the Census
    And I hover over <product_line> plan on Plan Designer page
    Then the message "Plan is invalid due to group or census changes made. Please adjust your plan." should display
    Examples:
      | product_line | custom_plan     |
      | Dental       | dental plan 1   |
      | MCV          | mcv plan 1      |
      | GTL          | gtl plan 1      |
      | STD          | std plan 1      |
      | LTD          | ltd plan 1      |
      | VTL          | vtl plan 1      |
      | CI           | ci plan 1       |
      | Accident     | accident plan 1 |

  Scenario Outline: <product_line> plan becomes outdated on group profile change (ZIP code)
    And I have a custom plan created
      | <custom_plan> |
    When I update group profile "Zip Code" value to "50001"
    And I hover over <product_line> plan on Plan Designer page
    Then the message "Plan is invalid due to group or census changes made. Please adjust your plan." should display
    Examples:
      | product_line | custom_plan     |
      | Dental       | dental plan 1   |
      | MCV          | mcv plan 1      |
      | GTL          | gtl plan 1      |
      | STD          | std plan 1      |
      | LTD          | ltd plan 1      |
      | VTL          | vtl plan 1      |
      | CI           | ci plan 1       |
      | Accident     | accident plan 1 |

  Scenario Outline: <product_line> plan becomes outdated on group profile change (SIC code)
    And I have a custom plan created
      | <custom_plan> |
    When I update group profile "SIC Code" value to "0111"
    And I hover over <product_line> plan on Plan Designer page
    Then the message "Plan is invalid due to group or census changes made. Please adjust your plan." should display
    Examples:
      | product_line | custom_plan     |
      | Dental       | dental plan 1   |
      | MCV          | mcv plan 1      |
      | GTL          | gtl plan 1      |
      | STD          | std plan 1      |
      | LTD          | ltd plan 1      |
      | VTL          | vtl plan 1      |
      | CI           | ci plan 1       |
      | Accident     | accident plan 1 |

  Scenario Outline: Outdated locked <product_line> plan cannot be quoted
    And I have a quote created based on plan
      | <custom_plan> |
    When I update group profile "SIC Code" value to "0111"
    And I start generating a quote
    And I hover over <product_line> plan on Plan Designer page
    Then the message "Plan is invalid due to group or census changes made. Please adjust your plan." should display
    And the "<custom_plan>" should be unavailable for selection
    Examples:
      | product_line | custom_plan     |
      | Dental       | dental plan 1   |
      | MCV          | mcv plan 1      |
      | GTL          | gtl plan 1      |
      | STD          | std plan 1      |
      | LTD          | ltd plan 1      |
      | VTL          | vtl plan 1      |
      | CI           | ci plan 1       |
      | Accident     | accident plan 1 |

  Scenario Outline: Outdated unlocked <product_line> plan cannot be quoted
    And I have an outdated "<custom_plan>"
    When I start generating a quote
    And I hover over <product_line> plan on Select Plan page
    Then the message "Plan is invalid due to group or census changes made. Please adjust your plan." should display
    And the "<custom_plan>" should be unavailable for selection
    Examples:
      | product_line | custom_plan     |
      | Dental       | dental plan 1   |
      | MCV          | mcv plan 1      |
      | GTL          | gtl plan 1      |
      | STD          | std plan 1      |
      | LTD          | ltd plan 1      |
      | VTL          | vtl plan 1      |
      | CI           | ci plan 1       |
      | Accident     | accident plan 1 |

  Scenario Outline: Outdated unlocked <product_line> plan can be saved as valid
    And I have an outdated "<custom_plan>"
    When I select the "<custom_plan>" from the list of plans
    And I save the custom plan
    Then the custom plan should be saved successfully
    Examples:
      | product_line | custom_plan     |
      | Dental       | dental plan 1   |
      | MCV          | mcv plan 1      |
      | GTL          | gtl plan 1      |
      | STD          | std plan 1      |
      | LTD          | ltd plan 1      |
      | VTL          | vtl plan 1      |
      | CI           | ci plan 1       |
      | Accident     | accident plan 1 |

  Scenario Outline: Outdated locked <product_line> plan cannot be saved as valid
    And I have an outdated quote created based on "<custom_plan>"
    When I select the "<custom_plan>" from the list of plans
    Then I should not be able to save the plan
    Examples:
      | product_line | custom_plan     |
      | Dental       | dental plan 1   |
      | MCV          | mcv plan 1      |
      | GTL          | gtl plan 1      |
      | STD          | std plan 1      |
      | LTD          | ltd plan 1      |
      | VTL          | vtl plan 1      |
      | CI           | ci plan 1       |
      | Accident     | accident plan 1 |
