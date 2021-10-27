@underwriting @checkQuoteTiles @cami
Feature: Check Quotes Tiles
  As an User
  I want to see summary tiles for every quote on a group
  so that I can quickly understand what has been prepared on the case before it came to me

  #Use image comparison tool for validating display

  Background: I have a group with census
    Given I login as a "underwriter"

  @blocker
  Scenario: A single quote tile is displayed on the Underwriter Tab
    And I have a group with other census file and owner "<owner>"
    And I create few custom plans:
      | mcv plan 1 |
    When I create new quotes based on the custom plans
    Then the data on the quote tiles should be accurate

  Scenario: Multiple quotes display together on the Underwriter Tab
    And I have a group with other census file and owner "<owner>"
    And I create few custom plans:
      | mcv plan 1    |
      | dental plan 1 |
      | gtl plan 1    |
    When I create new quotes based on the custom plans
    Then the data on the quote tiles should be accurate

  @critical
  Scenario: Deleted quotes do not display on underwriting tab
    And I have a group with other census file and owner "<owner>"
    And I create few custom plans:
      | mcv plan 1    |
      | dental plan 1 |
      | gtl plan 1    |
    And I create new quotes based on the custom plans
    And the data on the quote tiles should be accurate
    When I delete one quote
    Then I validate the plan deleted should not be displayed on the underwriting tab
