@trinet @groupReassignment @carlos @wip
Feature: Reassign group
  As an account manager or another super user
  I should be able to reassign a group to a new broker
  So that I can have a new broker take ownership of an old group

  @critical
  Scenario: Primary owner of a group should not be able to access a group where it was previously removed as owner

  @critical
  Scenario: Secondary owner of a group should not be able to access a group where it was previously removed as owner

  @critical
  Scenario: A broker user should not be able to access the reassignment functionality

  @critical
  Scenario: The super user should still have access to the group data after reassigning to a new broker

  Scenario: Reassignment should be an action from the groups list and when performed allows you to transfer the group to a new broker

  Scenario: The group list should no longer show a group to the old broker after reassignment

  Scenario: The group list should now show the reassigned group to the new broker after reassignment

  Scenario: The old broker should not have access to the group via URL after group reassignment

  Scenario: The old broker should not have access to any of the groups census, plans, quotes or proposal data after reassignment

  Scenario: The super admin should be able to assign a new Primary

  Scenario: The super admin should be able to assign a new Secondary

  Scenario: Headers displayed should be "First Name" and "Last Name"
