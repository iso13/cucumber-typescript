@deleteFUP @cami
Feature: Delete Frequently Used Plan
  As a User
  I want to be able to delete frequently used (FU) plans from the list
  So that plans I no longer use do not congest the UI

  Scenario: Delete FUP from the list
    Given I login as an "<string>"
    And I have a list of FUPs
    When I delete a FUP
    Then I should not see the FUP

  Scenario: Deleting of FUP doesn't affect group custom plan
    Given I login as an "<string>"
    And I have a list of FUPs
    When I delete a FUP
    Then The custom plan should not be deleted
