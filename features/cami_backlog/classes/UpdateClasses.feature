@updateClasses @quoteSquad @cami
Feature: Update Classes
  As a User
  I need to be able to modify Classes number and descriptions
  So that I can modify Classes numbers and descriptions in case they need a modification

  Background:
    Given I login as a "userRole"
    And I have a group with census
    When I have a class

  @critical
  Scenario Outline: Update <property> of a class
    When I update a <property> for an existing class
    And save changes made to Classes page
    Then class <property> should be updated for all product lines
    Examples:
      | property    |
      | description |
      | number      |

  Scenario: The highest possible class number is 999
    When I update a number of the existing class to be 1000
    Then the error message about invalid class number should display

  Scenario: The longest possible class name contains 1024 characters
    When I update a name length of the existing class to be 1025
    Then the error message about invalid class name should display

  Scenario Outline: Duplication of class <property> is not allowed
    When I update a <property> of the existing class to be <value>
    Then the error message about duplicated class <property> should display
    And saving of classes should be impossible
    Examples:
      | property    | value                |
      | number      | 1                    |
      | description | All Active Employees |
