@boundProposals @adp @cami
Feature: Bound Proposals
  As a User
  I need to be able to mark a proposal status as bound
  So that as a user I can track bound proposals

  * Bound = Sold proposals

  @blocker
  Scenario: Cannot mark a proposal as bound when a bound proposal already exists in the group
    Given I login as a "userRole"
    When I have a proposal marked as "bound"
    Then I cannot mark any proposal as "bound"

  Scenario: Mark a proposal in "Ready for Review" status as bound
    Given I login as a "userRole"
    When I have a proposal marked as "bound"
    Then I can mark the proposal as "Ready for Review"

  Scenario: Cannot mark a proposal in a different status from "Ready for Review" as bound
    Given I login as a "userRole"
    When I have a proposal marked as "Ready for Review"
    Then I cannot mark the proposal to a different status
