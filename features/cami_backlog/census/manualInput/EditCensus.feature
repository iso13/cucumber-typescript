@editCensus @critical @cami
Feature: Edit Census
  As a User
  I need to be able to edit members information to my census
  So I can accurately quote a group for my client

  Scenario: Add an employee with a full set of data
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I manually add a member with the following data:
      | firstName | lastName | age | gender | coverageCodes | more? |
      | dummy     | member   | 33  | m      | EE            | ?     |
    Then the census should save successfully

  Scenario: Update an employee with a minimum required data
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I update '<memberName>' with the following data:
      | memberName   | age | gender |
      | dummy member | 33  | m      |
    Then the census should save successfully

  Scenario: Delete an employee
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I delete the member named '<memberName>'
    Then the member named '<memberName>' should not be on the census

  Scenario: Employee's age should be calculated based on the group's quote effective date
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    And I set the group field 'effective date' to value '2020-05-27'
    When I update '<memberName>' with the following data:
      | memberName   | dateOfBirth |
      | dummy member | 1990-10-22  |
    Then the member 'dummy member' should have 'age' of '27'
