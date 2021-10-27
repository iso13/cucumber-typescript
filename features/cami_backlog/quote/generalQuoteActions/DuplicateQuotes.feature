@quote @duplicateQuotes @cami
Feature: Duplicate Quotes
  As a User
  I need to be able to duplicate quotes
  So that I can bypass the full workflow to present similar plan selections or contribution strategies

  Scenario: Duplicate quote
    Given I login as an "userRole"
    And I have an existing quotes
    When I duplicate the exiting quote
    Then I should have the enrolled cost breakdown
