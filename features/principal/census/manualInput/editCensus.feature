@principal @census @censusManual @editCensus @wip
Feature: Edit Census
  As a Requester
  I need to be able to add/edit members information to my census
  So I can accurately quote a group for my client

  Background:
    Given I login as a "Requester"
    And I have created a new group

  Scenario: Add an employee with a minimum required data
    When I add a new employee with minimum required data
    Then the added employee's info should be saved successfully

  @critical
  Scenario: Add an employee with a full set of data
    When I add a new employee with full data
    Then the added employee's info should be saved successfully

  @critical
  Scenario: Update an employee with a minimum required data
    When upload a valid census
    And I update minimum required data for an employee
    Then the added employee's info should be saved successfully

  Scenario: Update an employee with a full set of data
    When upload a valid census
    And I update all data for the "Employee 1"
    Then the added employee's info should be saved successfully

  @critical
  Scenario: Delete an employee
    When upload a valid census
    And I delete any employee
    Then the selected employee should be removed from census

  @critical
  Scenario: Employee's age should be calculated based on the group's quote effective date
    When I add a new employee with minimum required data
    And I update its DOB value to be 1 day "<different1>" than QED of the group
    And I remember the age of the employee
    And I update its DOB value to be 1 day "<different2>" than QED of the group
    Then employees age should "<change>" by 1
      | different1 | different2 | change   |
      | earlier    | later      | increase |
      | later      | earlier    | decrease |
