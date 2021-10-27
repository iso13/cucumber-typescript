@core @addCensusMembers @editCensus @wip @diego
Feature: Edit census members
  As a Broker
  I need to be able to edit members on my group's census
  So I can accurately quote a group for my client

  Background:
    Given I login as a "Broker"
    And I have a group and census

  @critical
  Scenario: Update an employee's census information
    When I navigate to the census of "Group A"
    And I update "Employee A" with new information and save the census
    Then "Group A" should contain the new member data

  @critical
  Scenario: Update a dependent's census information and have that information accurately represented on quotes

  Scenario: Update an employee's zip code to a state outside the group state and verify that the Out-of-State EEs count has incremented

  Scenario: Employee and dependent's ages should be calculated based on the group's quote effective date
