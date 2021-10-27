@linkGroups @cami
Feature: Link Groups
  As an User
  I need to be able to link groups and set dual activity
  So that I can easily identify similar groups or groups that are the same

  * When typing a group's name I should be prompted to select a name from a group that I already have access to.
  * Then I should be prompted to link the group if I do select a group from the dropdown
  * Linked groups should be easily identifiable in the groups list via a linked group icon
  * Dual Activity groups should be easily identifiable in the groups list via a dual activity icon
  * Creating a new group with a linked group should allow the user to transfer census/classes, plans to the new group from the linked group
  * A group can not be deleted from the group list if the group is linked or dual activity
  * Set dual activity for 1 linked group

  @critical
  Scenario: Link Groups
    Given I login as an "<string>"
    When I select a group
    Then I should be able to link the group to other groups

  Scenario: View linked groups
    Given I login as an "<string>"
    When I access my group
    Then I should be able to see my linked groups
    And the number of total groups

  Scenario: Search Linked groups
    Given I login as an "<string>"
    When I search for groups that are linked
    Then I should only see groups that I have access

  Scenario: Remove linked groups from a group profile
    Given I login as an "<string>"
    And I access my group
    When I remove the link from my group
    Then the linked group should no longer be visible
