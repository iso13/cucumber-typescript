@createClasses @assignMembersToClass @quoteSquad @cami
Feature: Assign Members To Classes
  As a User
  I need to be able to assign members to classes
  So that I can manage my census more effectively

  * Members uploaded via census upload get assigned correct class
  * Assign a member to a class that does not exist on the group

  Scenario: Assign a new member to a class
    Given I login as a "userRole"
    And I have a group with census
    When I create new class
    Then I should be able to assign new member to the class

  Scenario: Reassign a member from one class to another
    Given I login as a "userRole"
    And I have a group with census
    When I create new class
    Then I should be able to reassign member to the class

  Scenario: Assign a member to different classes for different product lines
    Given I login as a "userRole"
    And I have a group with census
    When I create new class
    Then I should be able to reassign member to the class
