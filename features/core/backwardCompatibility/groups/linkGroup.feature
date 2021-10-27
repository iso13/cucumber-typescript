@core @backwardsCompatibility @linkGroup @wip
Feature: Link group
  As a Broker
  I need to be able to link groups and set dual activity
  So that I can easily identify similar groups or groups that are the same

  @critical
  Scenario: When typing a group's name I should be prompted to select a name from a group that I already have access to. I should be prompted to link the group if I do select a group from the dropdown

  Scenario: Search for groups I want to link from within the link group dialog. Only groups I have access to should show as an option.

  Scenario: Remove linked groups from a group profile

  Scenario: Creating a new group with a linked group should allow the user to transfer census/classes, plans to the new group from the linked group
