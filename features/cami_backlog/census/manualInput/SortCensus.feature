@sortCensus @cami
Feature: Sort Census
  As an User
  I need to be able to sort my census by member data
  So I can see members data in order that best suits my workflow

  * Every column on the census by default should have a header displayed at the top of the census
  * Clicking toggle button shows/hides census header
  * User should be able to navigate between census tabs
  * Scenario: User should be able to download census in predefined format
  * Clicking Census Requirements button displays dialog that contains the list of requirements

  Background:
    Given I login as a "Requester"
    And I have a group with census with empty census values

  Scenario: Sort fields on census
    Then the fields should be sorted ascending
    And the fields should be sorted descending

  Scenario: Sort empty census fields
    Then empty census values should be sorted first/last in the list
