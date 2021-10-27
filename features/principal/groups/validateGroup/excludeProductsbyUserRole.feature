@principal @groups @validateGroup @excludeProductsbyUserRole @blocker
Feature: Exclude Products by User Role
  As a User
  I should not be able to select product lines that are unavailable for my role
  So I cannot quote such products

  Scenario: Requester attempts to create a group with VTL with 3 lives
    Given I login as a "child_requester_1"
    And start creating new group
    And I populate some group profile fields with data
      | group without products |
    When I input 3 eligible employees
    Then Dental, STD, LTD, GTL, Vision, CI, Accident products should be available for selection
    And VTL products should not be available for selection

  Scenario: Underwriter attempts to create a group with VTL with 3 lives
    Given I login as a "child_underwriter"
    And start creating new group
    And I set "child requester" as owner of the group
    And I populate some group profile fields with data
      | group without products |
    When I input 3 eligible employees
    Then Dental, STD, LTD, GTL, VTL, Vision, CI, Accident products should be available for selection
    And none of the products should not be available for selection

  Scenario: Requester attempts to create a group with SIC 1094
    Given I login as a "child_requester_1"
    And start creating new group
    And I populate some group profile fields with data
      | group without products |
    When I populate SIC field with 1094 code
    Then Dental, LTD, VTL, Vision, CI, Accident products should be available for selection
    And STD, GTL products should not be available for selection

  Scenario: Underwriter attempts to create a group with SIC 1094
    Given I login as a "child_underwriter"
    And start creating new group
    And I set "child requester" as owner of the group
    And I populate some group profile fields with data
      | group without products |
    When I populate SIC field with 1094 code
    Then Dental, STD, LTD, GTL, VTL, Vision, CI, Accident products should be available for selection
    And none of the products should not be available for selection
