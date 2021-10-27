@importFUP @cami
Feature: Import Frequently Used Plan
  As a User
  I want to be able to import frequently used (FU) plans from the list to my group
  So that I can reuse custom plans across multiple groups

  Scenario: Import a frequently used plan from the list into my group
    Given I login as an "<string>"
    And I have a list of FUPs
    When I import a FUP into my group
    Then I should see the FUP within my group

  Scenario: Import multiple frequently used plans from the list into my group
    Given I login as an "<string>"
    And I have a list of FUPs
    When I import multiple FUPs into my group
    Then I should see the FUPs within my group
