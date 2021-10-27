@principal @planDesigner @planValidations @validateDependenciesForGTL @critical @wip
Feature: Validate Dependencies For GTL
  As a Requester
  I need to see the available benefits in Plan Designer
  So that I can setup my GTL plan and quote it correctly

  Scenario Outline: Set "AD&D" benefit value equal to "Not Included" for <SIC_code> SIC code
    Given I login as a "Requester"
    When I populate all group profile fields with valid data
    And I populate group profile "SIC Code" field with "<SIC_code>"
    And save the group
    Then the "AD&D" benefit of "GTL" plan design should be disabled
    And the "AD&D" benefit of "GTL" plan design should be set to "Not Included"
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
