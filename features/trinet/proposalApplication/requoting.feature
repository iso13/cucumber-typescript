@trinet @requote @wip @fernando
Feature: Requoting
  As a Broker
  I need to be able to requote my proposals
  So that I can quickly update quotes and proposals without having to create quotes and proposals from scratch

  @blocker
  Scenario: Requote a PCR proposal standard modeling with multiple product lines

  @blocker
  Scenario: Requote a BCR proposal market snapshot with multiple product lines

  @blocker
  Scenario: Add a new member to a benefit program and requote a PCR standard modeling proposal

  @blocker
  Scenario: Add a new employee to census and requote

  @blocker
  Scenario: Add current and renewal to a group and requote

  @blocker
  Scenario: Requote from BCR market snapshot proposal to PCR

  @critical
  Scenario: Requote a PCR proposal market snapshot with multiple product lines

  @critical
  Scenario: Requote a BCR proposal standard modeling with single product line

  @critical
  Scenario: Requote a BCR proposal standard modeling with multiple product lines

  @critical
  Scenario: Requote a BCR proposal market snapshot with single product line

  @critical
  Scenario: Requote from PCR standard modeling proposal to BCR

  @critical
  Scenario: Requote from PCR market snapshot proposal to BCR

  @critical
  Scenario: When requoting a proposal from BCR to PCR "Benefit Programs Side-by-Side Cost Breakdown" should display in the
  proposal output only when there are more than one benefit program

  @critical
  Scenario: Changes done to members that affect coverate tier or benefi assignment of members should be reflected on requote from
  PCR to PCR

  @critical
  Scenario: "Benefit Programs Side-by-Side Cost Breakdown" report should not display when requoting from PCR to BCR

  @critical
  Scenario: On adding current and renewal and requoting from PCR to PCR "Benefit Programs Side-by-Side Cost Breakdown" report should display for
  PCR standard modeling quotes in the proposal

  @critical
  Scenario: "Benefit Programs Side-by-Side Cost Breakdown" report should display without current/renewal quotes for PCR standard modeling quotes in
  the proposal when current quotes are removed before to requote an exsiting proposal from PCR to PCR

  Scenario: Add a new benefit program and requote

  Scenario: Remove a new benefit program and requote

  Scenario: Add a new dependent to a census and requote

  Scenario: Remove an employee from the census and requote

  Scenario: Remove a dependent from the census and requote

  Scenario: Change a covered member to waived and requote

  Scenario: Change a waived dependent to covered and requote

  Scenario: Change a covered member to non-eligible and requote

  Scenario: Change a non-eligible dependent to covered and requote

  Scenario: Change the status of a member from full time status member to temp and requote

  Scenario: Change the status of a member from temp status member to full time and requote

  Scenario: Change the status of a member from full time status member to part time and requote

  Scenario: Change the status of a member from part time status member to full time and requote

  Scenario: Update the group zip location and requote

  Scenario: Delete current and renewal from a group and requote

  Scenario: Delete and add a new current quote to the group and requote

  Scenario: Set all members to an out of state zip and requote

  Scenario: Change the benefit program number for a member and requote

  Scenario: Number of WSE's mapped to a benefit program should be updated in "Life Quote Detail" page after re-quoting if census was updated

  Scenario: On Updating id or description of a benefit program and re-quoting , Life Quote should be updated for that Benefit program id and description

  Scenario: Un-select recommended quotes during requote a proposal

  Scenario: Add a new member to a benefit program and requote a PCR market snapshot proposal

  Scenario: Add a new member to a benefit program and requote a BCR standard modeling proposal

  Scenario: Add a new member to a benefit program and requote a BCR market snapshot proposal

  Scenario: Add a new benefit program, map members and requote a PCR standard modeling proposal

  Scenario: Add a new benefit program, map members and requote a PCR market snapshot proposal

  Scenario: Add a new benefit program, map members and requote a BCR standard modeling proposal

  Scenario: Add a new benefit program, map members and requote a PCR market snapshot proposal

  Scenario: Add a new benefit program to the group and requote

  Scenario: Remove a benefit program from the group and requote

  Scenario: Requote from BCR standard modeling proposal to PCR
