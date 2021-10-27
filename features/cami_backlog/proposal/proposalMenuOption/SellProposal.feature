@sellProposal @distributeSquad @cami
Feature: Sell Proposal
  As a User
  I need to be able to mark my proposals as Sold
  So  I can mark which proposal is confirmed and sold to Client

  * Selling a proposal creates a copy of that proposal marked as Sold

  Scenario: Preventing any user from selling more than 1 quote for any particular product
    Given I login as a "Requester"
    And I have a proposal
      | mcv plan 1           |
      | mcv plan 1 voluntary |
      | dental plan 1        |
      | dental plan POS      |
    When I mark a proposal as sold
    Then I will be prevented from selecting more than one quote to the sold proposals for the same product line
