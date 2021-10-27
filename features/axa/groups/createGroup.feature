@axa @groupCreation @wip
Feature: Group Creation
  As an Underwriter
  I need to be able to create groups
  So I can manage those groups inside Quotepad

  Background:
    Given I login as an "Underwriter"

  Scenario: Create new group with a full set of data

  Scenario: Create a new group and add the contact information for the group

  @blocker
  Scenario: Create a new group with the minimum required data
    When I create a new group with minimum group data
    Then A group should be successfully created
