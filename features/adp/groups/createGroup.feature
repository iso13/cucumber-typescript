@adp @groupCreation @wip
Feature: Create Groups
  As a Service Team Producer
  I need to be able to create groups
  So I can manage those groups inside ADP

  Background:
    Given I login as a "Client_Manager_Producer"

  @blocker
  Scenario: Create a new group with the minimum required data
    When I create a new group with "minimum group data"
    Then A group should be successfully created

  Scenario: Create new group with a full set of data

  Scenario: Create a new group and add the contact information for the group
