@quote @generalActions @deleteQuotes @cami
Feature: Delete Quotes
  As a User
  I should be able to delete quotes from my group
  So that if I made a mistake or no longer need a quote it will not display

  Background:
    Given I login as a "userRole"
    And I have an unlocked quote
  Scenario: Delete an unlocked quote from the All Quotes
    When I delete the unlocked quote
    Then the quote should be removed from All Quotes

  Scenario: Delete an unlocked quote from the group home page
    When I delete the unlocked quote
    Then the quote should be removed from group home page
