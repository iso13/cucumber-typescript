@principal @classes @editClasses
Feature: Edit Classes
  As a Requester
  I want edit or create classes on my group
  So that I can adjust plans and quotes for specific groups of employees

  Background:
    Given I login as a "Requester"
    And I have a group with census

  @critical
  Scenario: Create new class manually
    When I create new class:
      | number | description |
      | 999    | class name  |
    Then the class should be created for product lines:
      | product_line          | class_number | class_description |
      | Dental                | 999          | class name        |
      | Vision                | 999          | class name        |
      | Group Term Life       | 999          | class name        |
      | Voluntary Term Life   | 999          | class name        |
      | Short-Term Disability | 999          | class name        |
      | Long-Term Disability  | 999          | class name        |
      | Critical Illness      | 999          | class name        |
      | Accident              | 999          | class name        |
    And the class "999" should contain "0" employees

  @major @wip
  Scenario: Delete existing empty class
    When I have an empty class
    And I delete the empty class
    Then the class should be deleted for all product lines

  @critical @wip
  Scenario: Existing class with EEs cannot be deleted
    When I have an class that is not empty
    Then the class cannot be deleted

  @critical @wip
  Scenario Outline: Update <property> of a class
    When I update a <property> for an existing class
    And save changes made to Classes page
    Then class <property> should be updated for all product lines
    Examples:
      | property    |
      | description |
      | number      |

  @trivial @wip
  Scenario: The highest possible class number is 999
    When I update a number of the existing class to be 1000
    Then the error message about invalid class number should display

  @trivial @wip
  Scenario: The longest possible class name contains 1024 characters
    When I update a name length of the existing class to be 1025
    Then the error message about invalid class name should display

  @wip
  Scenario Outline: Duplication of class <property> is not allowed
    When I update a <property> of the existing class to be <value>
    Then the error message about duplicated class <property> should display
    And saving of classes should be impossible
    Examples:
      | property    | value                |
      | number      | 1                    |
      | description | All Active Employees |
