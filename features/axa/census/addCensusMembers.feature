@axa @addCensusMembers @wip
Feature: Add census members
  As an Underwriter
  I need to be able to add members to my group's census
  So I can accurately quote a group for my client

  Background:
    Given I login as an "Underwriter"
    And I navigate on census page after group creation with no census

  Scenario: Add an employee with a single child dependent to my census

  Scenario: Add an employee with a spouse dependent to my census

  Scenario: Add an employee with a two child dependents to my census

  Scenario: Add an employee with a child and spouse dependent to my census

  Scenario: Add a waived employee to my census

  Scenario: Add a child dependent as a waived dependent

  Scenario: Add an employee to my census and verify the total EE and eligible EE count is correctly incremented

  Scenario: Add a waived employee to my census and verify the total EE and eligible EE count is correctly incremented

  @blocker
  Scenario: Add an employee with no dependent to my census
    When I add an employee with "TestFirstName" "TestLastName"
    Then Employee should add successfully
