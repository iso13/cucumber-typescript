@createClasses @quoteSquad @cami
Feature: Create Classes
  As a User
  I need to be able to add new Classes
  So that I can map members to those programs

  Scenario: Create new class with a single product line
    Given I login as a "userRole"
    And I have a group with census

  Scenario: Create a new class for all product lines
    Given I login as a "userRole"
    And I have a group with census
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

  Scenario: Classes specified in an uploaded census get created correctly
    Given I login as a "userRole"
    And I have a group with census
