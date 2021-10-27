@requoteQuotes @distributeSquad @cami
Feature: Requote Quotes
  As a User
  I want to requote a quote after a data change
  So that new quotes should display correct information after updates are done to group

  Scenario Outline: Requote a quote after a  <change> change
    Given I login as a "userRole"
    And I have an existing quote
    When I make a "<change>" change
    Then I should be able to requote
    Examples:
      | change         |
      | effective date |
      | census         |
      | class          |
