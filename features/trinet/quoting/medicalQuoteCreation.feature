@trinet @quoteCreation @medicalQuotes
Feature: Create Medical Quotes
  As a Broker
  I want to create BCR and PCR Medical Quotes for all Exchanges

  Background:
    Given I login as a "carrier_admin"
    And I create a new group with "create quote group" and owner as "Josh Broker"
    And I upload a census "Exchange II - XI_different_zipcodes.xlsx" selecting "Exchange II / XI RFP Template File" as template type

  @blocker @wip
  Scenario: Create PCR Medical Standard Modeling Quote with all Plans selected on Exchange I

  @blocker @wip
  Scenario: Create PCR Medical Standard Modeling Quote with all Plans selected on Exchange II

  @blocker @MSTR-1401 @MSTR-1984
  Scenario: Create BCR Medical Standard Modeling Quote with all Plans selected on Exchange I
    When I create a published "BCR" standard modeling quote with "published medical quote ExchangeI"
    Then A published quote should be successfully created for my group

  @blocker @MSTR-1422 @MSTR-1984
  Scenario: Create BCR Medical Standard Modeling Quote with few Plans selected on Exchange II
    When I create a published "BCR" standard modeling quote with "published medical quote ExchangeII"
    Then A published quote should be successfully created for my group

  @blocker @MSTR-1401
  Scenario: Create BCR Medical Market Snapshot Quote with all Plans selected on Exchange I
    When I create a published "BCR" Market Snapshot quote with "published medical quote ExchangeI"
    Then A published quote should be successfully created for my group

  @blocker @MSTR-1140 @MSTR-1401
  Scenario: Create BCR Medical Market Snapshot Quote with few Plans selected on Exchange II
    When I create a published "BCR" Market Snapshot quote with "published medical quote ExchangeII"
    Then A published quote should be successfully created for my group

  @critical @wip
  Scenario: Create PCR Medical Standard Modeling Quote with single Plan selected on Exchange I

  @critical @wip
  Scenario: Create PCR Medical Standard Modeling Quote with few Plans selected on Exchange II

  @wip
  Scenario: Create PCR Medical Standard Modeling Quote with all Plans selected on Exchange III

  @wip
  Scenario: Create PCR Medical Standard Modeling Quote with single Plan selected on Exchange III

  @wip
  Scenario: Create PCR Medical Standard Modeling Quote with all Plans selected on Exchange IV

  @wip
  Scenario: Create PCR Medical Standard Modeling Quote with single Plan selected on Exchange IV

  @wip
  Scenario: Create PCR Medical Market Snapshot  Quote with all Plans selected on Exchange I

  @wip
  Scenario: Create PCR Medical Market Snapshot Quote with single Plan selected on Exchange I

  @wip
  Scenario: Create PCR Medical Market Snapshot Quote with all Plans selected on Exchange II

  @wip
  Scenario: Create PCR Medical Market Snapshot Quote with single Plan selected on Exchange II

  @wip
  Scenario: Create PCR Medical Market Snapshot Quote with all Plans selected on Exchange III

  @wip
  Scenario: Create PCR Medical Market Snapshot Quote with single Plan selected on Exchange III

  @wip
  Scenario: Create PCR Medical Market Snapshot Quote with all Plans selected on Exchange IV

  @wip
  Scenario: Create PCR Medical Market Snapshot Quote with single Plan selected on Exchange IV

  @wip
  Scenario: Create BCR Medical Standard Modeling Quote with single Plan selected on Exchange I

  @blocker @wip
  Scenario: Create BCR Medical Standard Modeling Quote with all Plans selected on Exchange II

  @critical @wip
  Scenario: Create BCR Medical Standard Modeling Quote with single Plan selected on Exchange II

  @wip
  Scenario: Create BCR Medical Standard Modeling Quote with all Plans selected on Exchange III

  @wip
  Scenario: Create BCR Medical Standard Modeling Quote with single Plan selected on Exchange III

  @wip
  Scenario: Create BCR Medical Standard Modeling Quote with all Plans selected on Exchange IV

  @wip
  Scenario: Create BCR Medical Standard Modeling Quote with single Plan selected on Exchange IV

  @wip
  Scenario: Create BCR Medical Market Snapshot Quote with single Plan selected on Exchange I

  @wip
  Scenario: Create BCR Medical Market Snapshot Quote with single Plan selected on Exchange II

  @wip
  Scenario: Create BCR Medical Market Snapshot Quote with all Plans selected on Exchange III

  @wip
  Scenario: Create BCR Medical Market Snapshot Quote with single Plan selected on Exchange III

  @wip
  Scenario: Create BCR Medical Market Snapshot Quote with all Plans selected on Exchange IV

  @wip
  Scenario: Create BCR Medical Market Snapshot Quote with single Plan selected on Exchange IV
