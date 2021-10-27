@rejectProposals @adp @blocker @cami
Feature: Reject Proposals
  As an User
  I need to be able to mark proposals status as rejected and add mandatory comments

  * Cannot mark a proposal in a different status from "Ready for Review" as rejected

  Scenario: Mark a proposal in "Ready for Review" status as rejected
    Given I login as a "userRole"
    And I have a proposal
    When I mark the proposal as "Ready for Review"
    Then I can reject and comment on the proposal
