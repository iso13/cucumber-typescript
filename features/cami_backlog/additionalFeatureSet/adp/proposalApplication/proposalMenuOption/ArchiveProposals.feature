@archiveProposals @adp @cami
Feature: Archive Proposals
  As a User
  I want to archive proposals
  So that out of date proposals or proposal I do not need are removed from the proposal list

  Scenario: Archive a proposal from the proposal list
    Given I login as an "userRole"
    And I have an existing proposal
    When I archive the proposal
    Then the proposal will no longer be available

  Scenario: Archive a proposal and confirm that quotes on the proposal are unlocked if they are not on another quote

  Scenario Outline: Archive is not available for proposals in <state> status
    Given I login as an "userRole"
    And I have an existing proposal
    When I archive a proposal with "<state>" status
    Then the proposal will not be archived

    Examples:
      | state      |
      | bound      |
      | rejected   |
      | renewed    |
      | remarketed |
      | upsold     |
