@trinet @proposalType @carlos @wip
Feature: Proposal Type selection
  As a Broker
  I want to select a proposal type
  So that I can begin building my proposal

  @blocker
  Scenario: Proposal type dropdown should be displayed and enabled in the Group Home Page and should contains the following options
    |Option|
    |Benefit Market snapshot|
    |Advanced Modeling Comparision|

  @blocker
  Scenario: Quick Benefits Comparision is not enabled (grayed out) when there is not a medical current/renewal quote in the group

  @blocker
  Scenario: Quick Benefits Comparision is enabled when medical current/renewal quote has been added in the group

  @critical
  Scenario: On hovering over disabled Quick Benefit Comparision option tool-tip type pop-up should display
