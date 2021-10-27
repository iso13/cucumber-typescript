@transamerica @quotes @createProductQuoteWOCensus @blocker @quote
Feature: Create Product Quotes without census
  As an Underwriter
  I want to be able to create quotes without census based on custom plans
  So that I can add my custom quotes to proposals and sell them to clients

  Background:
    Given I login as an "Underwriter"
    And I have a group without census and owner "Billy Banana"

  Scenario Outline: Create a successful <product> quote
    And I create new custom plan:
      | <custom plan> |
    When I create a transamerica quote based on the custom plan
    Then A quote for the selected plan should be successfully created
    Examples:
      | product              | custom plan            |
      | Critical Events Plan | critical events plan 1 |
      | Accident Plan        | accident advance plan 1|

  @wip
  Scenario: Create a <product> quote with census
