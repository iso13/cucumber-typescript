@principal @proposals @proposalActions @sellProposals
Feature: Sell Proposals
  As a Requester
  I want to mark my proposals as sold
  So that I can track my sold business

  Background:
    Given I login as a "Requester"

  @wip
  Scenario: Selling a proposal creates a copy of that proposal marked as Sold

  @major @QUOTE-367
  Scenario: Preventing any user from selling more than 1 quote for any particular product
    And I have a proposal
      | gtl plan 1 mvp2 |
      | gtl plan 2 mvp2 |
    When I mark a proposal as sold with following additional note "Note_Desc"
    Then "You may only select one quote per product line", error tool-tip popsup with the message
