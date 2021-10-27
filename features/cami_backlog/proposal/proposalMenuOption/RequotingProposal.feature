@requotingProposal @distributeSquad @cami
Feature: Requoting Proposal
  As a User
  I need to be able to requote my proposals
  So that I can quickly update quotes and proposals without having to create quotes and proposals from scratch

  Background:
    Given I login as a "userRole"
    And I have an existing proposal

  Scenario Outline: Requote a proposal after a <change> in a quote
    When I make a "<change>" change in the quote
    Then I should be able to requote a proposal
    Examples:
      | change         |
      | effective date |
      | census         |
      | class          |

  Scenario: Requote a proposal with multiple quotes
