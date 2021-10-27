@core @addCensusMembers @editCensus @wip @diego
Feature: Add census members
  As a Broker
  I need to be able to add members to my group's census
  So I can accurately quote a group for my client

  Background:
    Given I login as a "Broker" and I create a group with "Group A"
    And I manually add a census

  @critical
  Scenario: Add an employee with no dependent to my census

  @critical
  Scenario: Add an employee with a single child dependent to my census

  @critical
  Scenario: Add an employee with a spouse dependent to my census

  @critical
  Scenario: Add an employee with a two child dependents to my census

  @critical
  Scenario: Add an employee with a child and spouse dependent to my census
    When I add members "Member A and child plus spouse" and save the census
    Then "Group A" should contain the newly created members

  Scenario: Add a waived employee to my census

  Scenario: Add a child dependent as a waived dependent

  Scenario: Add an employee to my census and verify the total EE and eligible EE count is correctly incremented

  Scenario: Add a waived employee to my census and verify the total EE and eligible EE count is correctly incremented
