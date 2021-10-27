@deleteCensusMembers @cami
Feature: Delete Census Members
  As a User
  I should to be able to delete census members
  So I can accurately quote a group

  Scenario: Delete an employee with no dependent from my census
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    And I upload 'CustomCensus.xlsx' census file as 'Custom' census
    When I remove "employee with no dependent" census
    Then the census should be updated

  Scenario: Delete a child dependent from a EC1 employee from my census
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    And I upload 'CustomCensus.xlsx' census file as 'Custom' census
    When I remove "child dependent from a EC1 employee" census
    Then the census should be updated
    And the employee's tier is updated to EE

  Scenario: Delete a spouse dependent from a ES employee from my census
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    And I upload 'CustomCensus.xlsx' census file as 'Custom' census
    When I remove "spouse dependent from a ES employee" census
    Then the census should be updated
    And the employee's tier is updated to EE

  Scenario: Delete a spouse dependent from a EF employee from my census
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    And I upload 'CustomCensus.xlsx' census file as 'Custom' census
    When I remove "spouse dependent from a EF employee" census
    Then the census should be updated
    And the employees tier updated to EC2 or EC1
