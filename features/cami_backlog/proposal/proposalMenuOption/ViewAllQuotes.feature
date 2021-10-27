@viewAllQuotes @distributeSquad @cami
Feature: View All Quotes
  As a User
  I need to be able to view quotes on my proposals
  So that I can have quick access to quotes of the proposal

  Scenario: View quotes on a proposal
    Given I login as an "userRole"
    And I have an existing proposal with quotes
    When I view the proposal
    Then I should have all quotes available on the proposal
