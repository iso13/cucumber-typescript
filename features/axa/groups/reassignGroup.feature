@axa @groupReassignment @wip
Feature: Group Reassignment
  As an Account ManagerUnderwriter or another super user
  I should be able to reassign a group to a new Broker
  So that I can have a new Broker take ownership of an old group

  Scenario: Reassignment should be an action from the groups list and when performed allows you to transfer the group to a new Broker

  @permissions
  Scenario: A Broker user should not be able to access the reassignment functionality

  Scenario: The group list should no longer show a group to the old Broker after reassignment

  Scenario: The group list should now show the reassigned group to the new Broker after reassignment

  Scenario: The old Broker should not have access to the group via URL after group reassignment

  Scenario: The old Broker should not have access to any of the groups census, plans, quotes or proposal data after reassignment

  Scenario: The super user should still have access to the group data after reassigning to a new Broker
