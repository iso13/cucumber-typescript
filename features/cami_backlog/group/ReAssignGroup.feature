@reassignGroup @critical @cami
Feature: Reassign Group
  As an User
  I should be able to reassign a group to a new Broker
  So that I new User can take ownership of an old group

  * Reassignment should be an action from the groups list and when performed allows you to transfer the group to a new broker
  * The group list should no longer show a group to the old broker after reassignment
  * The group list should now show the reassigned group to the new broker after reassignment
  * The old broker should not have access to the group via URL after group reassignment
  * The old broker should not have access to any of the groups census, plans, quotes or proposal data after reassignment
  * The super admin should be able to assign a new Primary
  * The super admin should be able to assign a new Secondary
  * Headers displayed should be "First Name" and "Last Name"

  Scenario: Primary owner of a group should not be able to access a group where it was previously removed as owner
    Given I login as an "<user_role>"
    When I access a group where I am no longer an "owner"
    Then I should not be able to access the group

  Scenario: Secondary owner of a group should not be able to access a group where it was previously removed as owner
    Given I login as an "<user_role>"
    When I access a group where I am no longer an "owner"
    Then I should not be able to access the group

  Scenario: A broker user should not be able to access the reassignment functionality
    Given I login as an "<user_role>"
    When I access a group where I am no longer an "owner"
    Then I should not be able to access the group

  Scenario: The super user should still have access to the group data after reassigning to a new broker
    Given I login as an "<user_role>"
    When I access a group where I am no longer an "owner"
    Then I should still be able to access the group
