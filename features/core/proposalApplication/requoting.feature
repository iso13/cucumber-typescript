@core @requote
Feature: Requoting
  As a Broker
  I need to be able to requote my proposals
  So that I can quickly update quotes and proposals without having to create quotes and proposals from scratch

  Background:
    Given I login as a "Broker"

  @blocker @MSTR-1415 @MSTR-1335 @MSTR-1646
  Scenario: Requote a proposal with single product line
    And I have a "medical" proposal
    When I requote my proposal
    Then A requoted proposal should be successfully created for my group

  @wip @critical @diego
  Scenario: Requote a proposal with multiple product lines

  @wip
  Scenario: Requote a proposal with custom medical quotes

  @wip
  Scenario: Requote a proposal with custom dental quotes

  @wip
  Scenario: Requote a proposal with custom vision quotes

  @wip
  Scenario: Requote a proposal with custom life quotes

  @wip
  Scenario: Requote a proposal with published medical quotes

  @wip
  Scenario: Requote a proposal with published dental quotes

  @wip
  Scenario: Requote a proposal with published vision quotes

  @wip
  Scenario: Requote a proposal with published life quotes

  @wip
  Scenario: Create a proposal with out of date quotes

  @wip
  Scenario: Add a new employee to a census and requote

  @wip
  Scenario: Add a new dependent to a census and requote

  @wip
  Scenario: Remove an employee from the census and requote

  @wip
  Scenario: Remove a dependent from the census and requote

  @wip
  Scenario: Change a covered member to waived and requote

  @wip
  Scenario: Change a waived dependent to covered and requote

  @wip
  Scenario: Update the group zip location and requote

  @wip
  Scenario: Update a members DOB and requote

  @wip
  Scenario: Add current and renewal to a group and requote

  @wip
  Scenario: Delete current and renewal from a group and requote

  @wip
  Scenario: Delete and add a new current quote to the group and requote

  @wip
  Scenario: Set all members to an out of state zip and force a requoting error

  @wip
  Scenario: Edit rates during a requote and confirm the rates are saved

  @wip
  Scenario: Requote a quote with edited rates and confirm the rates are saved and not overwritten
