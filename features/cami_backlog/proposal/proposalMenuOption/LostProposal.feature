@lostProposal @distributeSquad @cami
Feature: Lost Proposal
  As a User
  I need to be able to mark my proposals as lost
  So that as a user I can track my lost business

  Background:
    Given I login as an "userRole"

  Scenario: Mark a proposal as lost
    When I have an existing proposal
    Then I should be able to mark the proposal as lost

  Scenario: Unmark a proposal
    When I have an existing proposal is marked as lost
    Then I should be able to unmark the proposal
