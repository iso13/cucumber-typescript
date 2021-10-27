@core @editGroup @wip @jorge
Feature: Edit Groups
  As a Broker
  I need to be able to edit groups
  So I can update groups based on information received from my client

  Background:
    Given I login as a "Broker" and I create a group with "Group A"

  @critical
  Scenario: Update existing group changing minimum required data and confirm the data is saved
    When I update "Group A" data with "updated minimum data"
    And I save the group
    Then "Group A" should be successfully updated

  Scenario: Update existing group changing full data and confirm the data is saved

  Scenario: Update group contact info and confirm the data is saved
