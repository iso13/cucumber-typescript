@trinet @addCensusMembers @wip @carlos
Feature: Add census members
  As a Broker
  I need to be able to add members to my groups census
  So I can accurately quote a group for my client

  @critical
  Scenario: Add an employee with no dependent to my census

  @critical
  Scenario: Add an employee with a single child dependent to my census

  @critical
  Scenario: Add an employee with a spouse dependent to my census

  Scenario: Add an employee with a two child dependents to my census

  Scenario: Add an employee with a child and spouse dependent to my census

  Scenario: Add a member with employee only tier to my Census

  Scenario: Add a member with employee + spouse tier to my census

  Scenario: Add a a member with employee + child tier to my census

  Scenario: Add a a member with employee + children tier to my census

  Scenario: Add a family to my census

  @critical
  Scenario: Add a waived employee to my census

  @critical
  Scenario: Add a non-eligible employee to my census

  @critical
  Scenario: Add a employee with full time employment status to my census

  @critical
  Scenario: Add a employee with part time employment status to my census

  @critical
  Scenario: Add a employee with temp employment status to my census

  Scenario: Add a employee with  time employment status to my census

  Scenario: Add a child dependent as a waived dependent

  @critical
  Scenario: You should not be able to save Census information if the required fields have not been filled in and you should see a pop up
  with the title "Invalid or Missing data"

  Scenario: Add an employee to my census then the Total EEs count and the Eligible EEs count on the census should be incremented

  Scenario: Adding waived employee to census should increment Total EEs count but Eligible EEs count should not be incremented
