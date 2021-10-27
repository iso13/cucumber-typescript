@principal @proposals @proposalActions @createProposal
Feature: Create Proposal
  As a Requester
  I want to create proposal(s) for all product lines
  So that I can propose new quotes to my clients

  Background:
    Given I login as a "Requester"

  @blocker @PFG-1407 @PFG-1408 @PFG-1475 @QUOTE-339 @QUOTE-367 @QUOTE-385
  Scenario Outline: Create a proposal with a <product> quote
    When I have a quote created based on plan
      | <custom plan> |
    And I create a proposal for the quote
    Then A proposal should be successfully created
    Examples:
      | product              | custom plan                    |
      | Vision               | mcv plan non contributory mvp2 |
      | Long-Term Disability | ltd mvp2 plan 1                |
      | Group Term Life      | gtl plan 1 mvp2                |
      | VTL                  | vtl plan 1                     |
      #| Dental               | dental plan 1                  |
      | Accident             | accident plan 1                |
      | Critical Illness     | ci plan 1                      |

  @wip
  Scenario: "Quotes for Proposal" side bar and "Recommended Quotes" dialog don't show up
    Given I have an "MCV" quote
    When I start creation of a new proposal
    And I select the quote to add to new proposal
    Then Quotes for Proposal side bar should not display
    And Recommended Quotes dialog should not display
    And I should be able to review quotes before saving a proposal

  @wip
  Scenario: Quote cart button doesn't display
    Given I have an "MCV" quote
    When I start creation of a new proposal
    Then Quotes cart button should not display
