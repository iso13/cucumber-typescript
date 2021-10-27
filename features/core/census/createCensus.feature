@core @createCensus @wip @critical @ferChacon
Feature: Create census
  As a Broker
  I need to be able to add members and their information to my census
  So I can accurately quote a group for my client

  Scenario: Add an employee and their dependents with all their information
    Given I login as a "Broker" and I create a group with "Group A"
    And I manually add a census
    When I add members "Member A and Dependents" and save the census
    Then "Group A" should contain the newly created members
