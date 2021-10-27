@quoteCreation @trinet @dentalQuotes @carlos
Feature: Create Dental Quotes
  As a Broker
  I want to create  BCR and PCR Dental Quotes for all Exchanges

  Background:
    Given I login as a "carrier_admin"
    And I create a new group with "create quote group" and owner as "Josh Broker"
    And I upload a census "TRINET_Exchange_II_XI.xlsx" selecting "Exchange II / XI RFP Template File" as template type

  @blocker @MSTR-1401 @MSTR-1984 @MSTR-2280
  Scenario: Create PCR Dental Quote with all Plans selected on Exchange I
    When I set carriers bands "FA" for Medical and "1" for Life and "1" for Disability in quarters primary "Q1 2019" altenate "Q2 2019" current "Q3 2019" on Exchange "TriNet Exchange I"
    And I navigate to group home
    And I create a published "PCR" standard modeling quote with "published dental quote ExchangeI"
    Then A published quote should be successfully created for my group

  @critical @wip
  Scenario: Create PCR Dental Quote with narrow Plan filter set and few plans selected on Exchange I

  @wip
  Scenario: Create PCR Dental Quote with narrow Plan filter set and single plans selected on Exchange I

  @wip
  Scenario: Create PCR Dental Quote with all Plans selected on Exchange II

  @wip
  Scenario: Create PCR Dental Quote with narrow Plan filter set and few plans selected on Exchange II

  @wip
  Scenario: Create PCR Dental Quote with narrow Plan filter set and single plans selected on Exchange II

  @wip
  Scenario: Create PCR Dental Quote with all Plans selected on Exchange III

  @wip
  Scenario: Create PCR Dental Quote with narrow Plan filter set and few plans selected on Exchange III

  @wip
  Scenario: Create PCR Dental Quote with narrow Plan filter set and single plans selected on Exchange III

  @wip
  Scenario: Create PCR Dental Quote with all Plans selected on Exchange IV

  @wip
  Scenario: Create PCR Dental Quote with narrow Plan filter set and few plans selected on Exchange IV

  @wip
  Scenario: Create PCR Dental Quote with narrow Plan filter set and single plans selected on Exchange IV

  @wip
  Scenario: Create PCR Dental Quote with all Plans selected on Exchange XI

  @wip
  Scenario: Create PCR Dental Quote with narrow Plan filter set and few plans selected on Exchange XI

  @wip
  Scenario: Create PCR Dental Quote with narrow Plan filter set and single plans selected on Exchange XI

  @blocker @MSTR-1401 @MSTR-1984 @MSTR-2280
  Scenario: Create BCR Dental Quote with all Plans selected on Exchange I
    When I create a published "BCR" standard modeling quote with "published dental quote ExchangeI"
    Then A published quote should be successfully created for my group

  @critical @wip
  Scenario: Create BCR Dental Quote with narrow Plan filter set and few plans selected on Exchange I

  @wip
  Scenario: Create BCR Dental Quote with narrow Plan filter set and single plans selected on Exchange I

  @wip
  Scenario: Create BCR Dental Quote with all Plans selected on Exchange II

  @wip
  Scenario: Create BCR Dental Quote with narrow Plan filter set and few plans selected on Exchange II

  @wip
  Scenario: Create BCR Dental Quote with narrow Plan filter set and single plans selected on Exchange II

  @wip
  Scenario: Create BCR Dental Quote with all Plans selected on Exchange III

  @wip
  Scenario: Create BCR Dental Quote with narrow Plan filter set and few plans selected on Exchange III

  @wip
  Scenario: Create BCR Dental Quote with narrow Plan filter set and single plans selected on Exchange III

  @wip
  Scenario: Create BCR Dental Quote with all Plans selected on Exchange IV

  @wip
  Scenario: Create BCR Dental Quote with narrow Plan filter set and few plans selected on Exchange IV

  @wip
  Scenario: Create BCR Dental Quote with narrow Plan filter set and single plans selected on Exchange IV

  @wip
  Scenario: Create BCR Dental Quote with all Plans selected on Exchange XI

  @wip
  Scenario: Create BCR Dental Quote with narrow Plan filter set and few plans selected on Exchange XI

  @wip
  Scenario: Create BCR Dental Quote with narrow Plan filter set and single plans selected on Exchange XI
