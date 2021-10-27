@adp @boundProposals @wip
Feature: Bound Proposals
  As a Order Expeditor
  I need to be able to mark a proposal in "Ready for Review" status as bound
  So that as a user I can track bound proposals

  Scenario: Mark a proposal in "Ready for Review" status as bound

  Scenario: Cannot mark a proposal in a different status from "Ready for Review" as bound

  @blocker
  Scenario: Cannot mark a proposal as bound when a bound proposal already exists in the group
