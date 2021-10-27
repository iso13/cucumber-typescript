@deleteGroup @cami
Feature: Delete Group
  As an User
  I need to be able to Delete groups
  So I can manage groups not needed in Quotepad

  Scenario: Delete a group
    Given I login as an "userRole"
    And I have a list of groups
    When I delete a group
    Then the deleted group should not be available

  Scenario: Delete groups in bulk
    And I have a list of groups
    When I delete multiple groups
    Then the deleted groups should not be available
