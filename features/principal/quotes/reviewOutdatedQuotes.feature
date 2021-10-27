@principal @quotes @reviewOutdatedQuotes @wip
Feature: Review Outdated Quotes
  As a Requester
  I would like my quotes to be marked as outdated, once group/census info gets updated,
  So that I know they are invalid and should not be added on a proposal

  Background:
    Given I login as a "Requester"

  Scenario: Outdated quote is marked with warning icon after any change made to group info
    And I have a quote created based on plan
      | mcv plan1 |
    When I update group profile "Zip Code" value to "10009"
    Then the quote should be marked as outdated

  Scenario: Outdated quote is marked with warning icon after any change made to census info
    And I have a quote created based on plan
      | mcv plan1 |
    When I delete an employee
    Then the quote should be marked as outdated

  Scenario: Outdated quote is marked with warning icon on proposal creation page
    And I have a quote created based on plan
      | mcv plan1 |
    When I delete an employee
    And I start creation of a new proposal
    Then the quote should be marked as outdated on the first step of proposal creation
