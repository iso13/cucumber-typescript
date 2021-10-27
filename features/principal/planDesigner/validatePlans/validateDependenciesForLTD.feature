@principal @planDesigner @planValidations @validateDependenciesForLTD @critical @wip
Feature: Validate Dependencies For LTD
  As a Requester
  I need to see the available benefits in Plan Designer
  So that I can setup my LTD plan and quote it correctly

  Scenario Outline: Set "Voluntary" benefit value equal to "No" for <SIC_code> SIC code
    Given I login as a "Requester"
    When I populate all group profile fields with valid data
    And I populate group profile "SIC Code" field with "<SIC_code>"
    And I save the group
    Then the "Voluntary" benefit of "LTD" plan design should be disabled
    And the "Voluntary" benefit of "LTD" plan design should be set to "No"
    Examples:
      | SIC_code |
      | 0111     |
      | 0191     |
      | 0252     |
      | 0711     |
      | 0751     |
      | 1796     |
      | 1799     |
      | 8721     |
      | 1622     |
      | 6411     |
      | 0271     |
      | 1791     |

  Scenario Outline: Previously created plans are marked invalid, if user changes a group to <SIC_code> SIC code, where different business rules apply
    When I have a custom plan created
      | ltd plan 1 |
    And I update group profile "SIC Code" field with "<SIC_code>"
    Then Previously created plan is marked invalid
    Examples:
      | SIC_code |
      | 0111     |
      | 0191     |
      | 0252     |
      | 0711     |
      | 0751     |
