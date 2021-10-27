@trinet @quoteCreation @visionQuotes @carlos
Feature: Create Vision Quotes
  As a Broker
  I want to create  BCR and PCR Vision Quotes for all Exchanges

  Background:
    Given I login as a "carrier_admin"
    When I create a new group with "create quote group" and owner as "Josh Broker"
    And I upload a census "TRINET_Exchange_II_XI" selecting "Exchange II / XI RFP Template File" as template type

  @blocker @MSTR-1401 @MSTR-1984 @MSTR-2280
  Scenario: Create PCR Vision Quote with all Plans selected on Exchange II
    When I set the band "5A" for all Medical carriers and "1" for the Life carrier and "2" for the Disability carrier and Exchange "TriNet Exchange II" in the current quarter
    And I navigate to "Quotes" page
    And I create a published "PCR" standard modeling quote with "published vision quote ExchangeII" from Quotes Home
    Then A published quote should be successfully created for my group

  @blocker @MSTR-1401 @MSTR-1984
  Scenario: Create BCR Vision Quote with all Plans selected on Exchange II
    When I create a published "BCR" standard modeling quote with "published vision quote ExchangeII"
    Then A published quote should be successfully created for my group

  @critical
  Scenario: Create PCR Vision Quote with narrow Plan filter set and few plans selected on Exchange I

  @wip
  Scenario: Create PCR Vision Quote with narrow Plan filter set and single plans selected on Exchange I

  @wip
  Scenario: Create PCR Vision Quote with all Plans selected on Exchange II

  @wip
  Scenario: Create PCR Vision Quote with narrow Plan filter set and few plans selected on Exchange II

  @wip
  Scenario: Create PCR Vision Quote with narrow Plan filter set and single plans selected on Exchange II

  @wip
  Scenario: Create PCR Vision Quote with all Plans selected on Exchange III

  @wip
  Scenario: Create PCR Vision Quote with narrow Plan filter set and few plans selected on Exchange III

  @wip
  Scenario: Create PCR Vision Quote with narrow Plan filter set and single plans selected on Exchange III

  @wip
  Scenario: Create PCR Vision Quote with all Plans selected on Exchange IV

  @wip
  Scenario: Create PCR Vision Quote with narrow Plan filter set and few plans selected on Exchange IV

  @wip
  Scenario: Create PCR Vision Quote with narrow Plan filter set and single plans selected on Exchange IV

  @wip
  Scenario: Create PCR Vision Quote with all Plans selected on Exchange XI

  @wip
  Scenario: Create PCR Vision Quote with narrow Plan filter set and few plans selected on Exchange XI

  @wip
  Scenario: Create PCR Vision Quote with narrow Plan filter set and single plans selected on Exchange XI

  @wip
  Scenario: Create BCR Vision Quote with all Plans selected on Exchange I

  @critical @wip
  Scenario: Create BCR Vision Quote with narrow Plan filter set and few plans selected on Exchange I

  @wip
  Scenario: Create BCR Vision Quote with narrow Plan filter set and single plans selected on Exchange I

  @wip
  Scenario: Create BCR Vision Quote with narrow Plan filter set and few plans selected on Exchange II

  @wip
  Scenario: Create BCR Vision Quote with narrow Plan filter set and single plans selected on Exchange II

  @wip
  Scenario: Create BCR Vision Quote with all Plans selected on Exchange III

  @wip
  Scenario: Create BCR Vision Quote with narrow Plan filter set and few plans selected on Exchange III

  @wip
  Scenario: Create BCR Vision Quote with narrow Plan filter set and single plans selected on Exchange III

  @wip
  Scenario: Create BCR Vision Quote with all Plans selected on Exchange IV

  @wip
  Scenario: Create BCR Vision Quote with narrow Plan filter set and few plans selected on Exchange IV

  @wip
  Scenario: Create BCR Vision Quote with narrow Plan filter set and single plans selected on Exchange IV

  @wip
  Scenario: Create BCR Vision Quote with all Plans selected on Exchange XI

  @wip
  Scenario: Create BCR Vision Quote with narrow Plan filter set and few plans selected on Exchange XI

  @wip
  Scenario: Create BCR Vision Quote with narrow Plan filter set and single plans selected on Exchange XI
