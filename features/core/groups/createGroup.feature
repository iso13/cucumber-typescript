@core @groupCreation @jorge
Feature: Create Groups
  As a Broker
  I need to be able to create groups
  So I can manage those groups inside QuotePad

  Background:
    Given I login as a "Broker"

  @blocker
  Scenario: Create a new group with the minimum required data
    When I create a new group with "minimum group data"
    Then A group should be successfully created

  @wip
  Scenario: Create new group with a full set of data

  @wip
  Scenario: Create a new group and add the contact information for the group

  @wip @critical
  Scenario: Create new group without filling in all the required fields
