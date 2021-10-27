@principal @proposals @proposalActions @deleteProposal @wip
Feature: Delete Proposal
  As a Requester
  I want to be able to delete proposals for all product lines
  So that created by mistake or outdated ones are not visiblie in the list

  Background:
    Given I login as a "Requester"
    And I have a proposal

  Scenario: Delete a proposal from all proposals list
    When I delete a proposal from all proposals list
    Then The proposal should not be displayed on the proposals list

  @major
  Scenario: Delete a proposal from in-group proposals list
    When I delete a proposal from in-group proposals list
    Then The proposal should not be displayed on the proposals list
