@deleteProposal @distributeSquad @cami
Feature: Delete Proposal
  As an User
  I want to delete proposals
  So that out of date proposals or proposal I do not need are removed from the proposal list

  * Cannot delete a sold proposal

  Background:
    Given I login as a "userRole"

  @major
  Scenario: Delete a proposal from in-group proposals list
    When I delete a proposal from in-group proposals list
    Then The proposal should not be displayed on the proposals list

  Scenario: Delete a proposal from the proposal list
    When I delete a proposal from the proposals list
    Then The proposal should not be displayed on the proposals list
