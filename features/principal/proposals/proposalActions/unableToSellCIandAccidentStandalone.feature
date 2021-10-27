@principal @proposals @proposalActions @unableToSellCIandAccidentStandalone
Feature: Unable To Sell CI and Accident Standalone
  As a Requester
  I want to be able to sell a proposal only if Critical Illness and/or Accident
  are not the only quotes included on the proposal
  So that I can propose new quotes to my clients following the business rules.

  Background:
    Given I login as a "Requester"

  @major @PFGSUP-308 @wip
  Scenario: Attempting to sell Accident as stand alone
    And I have a proposal
      | accident plan 1 |
    And I mark a proposal as sold with following additional note "Note_Desc"
    When I select quotes to sell:
      | Accident |
    Then "Accident is not available as a standalone coverage.", error dialog with the message pops up

  @major @PFGSUP-308 @wip
  Scenario: Attempting to sell CI as stand alone
    And I have a proposal
      | ci plan 1 |
    And I mark a proposal as sold with following additional note "Note_Desc"
    When I select quotes to sell:
      | CI |
    Then "Critical Illness is not available as a standalone coverage.", error dialog with the message pops up

  @major @QUOTE-367
  Scenario: Attempting to sell CI and Accident together
    And I have a proposal
      | accident plan 1 |
      | ci plan 1       |
    And I mark a proposal as sold with following additional note "Note_Desc"
    When I select quotes to sell:
      | Accident |
      | CI       |
    Then the proposal will be successfully created in Sold status
    And I will be navigated to the proposals view

  @major @QUOTE-367
  Scenario: Attempting to sell Dental, CI, and Accident together
    And I have a proposal
      | accident plan 1 |
      | ci plan 1       |
      #| dental plan 1   |
    And I mark a proposal as sold with following additional note "Note_Desc"
    When I select quotes to sell:
      | Accident |
      | CI       |
      #| Dental   |
    Then the proposal will be successfully created in Sold status
    And I will be navigated to the proposals view

  @minor @wip
  Scenario: Attempting to sell Dental as stand alone
    And I have a proposal
      | dental plan 1 |
    And I mark a proposal as sold with following additional note "Note_Desc"
    When I select quotes to sell:
      | Dental |
    Then the proposal will be successfully created in Sold status
    And I will be navigated to the proposals view
