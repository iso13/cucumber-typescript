@deleteClasses @quoteSquad @cami
Feature: Delete Classes
  As a User
  I need to be able to delete Classes
  So that If I made a mistake or no longer need a Classes it will not display

  Background:
    Given I login as a "userRole"
    And I have a group with census

  Scenario: Delete existing empty class
    And I have an empty class in the group
    When I delete the empty class
    Then I should not see the empty class

  Scenario: Existing class with members assigned cannot be deleted
    And I have an empty class with members assigned in the group
    When I attempt to delete an empty class with members assigned
    Then I should not be able to delete a class with members assigned

  Scenario: Cannot delete a class when there is only one class on the group
    And I have a single class in the group
    When I attempt to delete a single class
    Then I should not be able to delete the class
