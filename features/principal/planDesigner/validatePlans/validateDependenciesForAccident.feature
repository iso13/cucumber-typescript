@principal @planDesigner @planValidations @validateDependenciesForAccident @critical @wip
Feature: Validate Dependencies For Accident
  As a Requester
  I need to see the available benefits in Plan Designer
  So that I can setup my Accident Plan and quote it correctly

  Scenario Outline: Set "Coverage Type" benefit value equal to "Off the job" for <SIC_code> SIC code
    Given I login as a "Requester"
    When I populate all group profile fields with valid data
    And I populate group profile "SIC Code" field with "<SIC_code>"
    And save the group
    Then the "Coverage Type" benefit of "Accident" plan design should be disabled
    And the "Coverage Type" benefit of "Accident" plan design should be set to "Off the job"
    And the "Coverage Type" benefit of "Accident" plan design should not contain "24 hour" option
    Examples:
      | SIC_code |
      | 0111     |
      | 0112     |
      | 0115     |
      | 0116     |
      | 0119     |
      | 0131     |
      | 0132     |
      | 0133     |
      | 0134     |
      | 0139     |
      | 0161     |
      | 0171     |
