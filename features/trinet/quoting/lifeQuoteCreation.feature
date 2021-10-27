@quoteCreation @lifeQuotes @trinet @carlos
Feature: Create Life Quotes
  As a Broker
  I want to create  BCR and PCR Life Quotes for all Exchanges

  Background:
    Given I login as a "carrier_admin"
    And I create a new group with "minimum group data" and owner as "Eric Brown"
    And I upload a census "TRINET_Exchange_II_XI.xlsx" selecting "Exchange II / XI RFP Template File" as template type
    And I set the rate bands for my group using the following data "rateBands"

  @blocker @MSTR-1140 @MSTR-1984 @MSTR-2280 @MSTR-2457
  Scenario: Create PCR Life Market Snapshot Quote for all the exchanges with all Plans selected
    When I create a quote with the following data files
      | exchangeName | dataFileName                                    |
      | Exchange III | pcr_life_quote_data_exchangeIII_market_snapshot |
      | Exchange I   | pcr_life_quote_data_exchangeI_market_snapshot   |
      | Exchange II  | pcr_life_quote_data_exchangeII_market_snapshot  |
    Then A Life Market Snapshot quote card should be successfully displayed

  @blocker @MSTR-1140 @MSTR-1984 @MSTR-2280 @MSTR-2457
  Scenario: Create BCR Life Market Snapshot Quote for all the exchanges with all Plans selected
    When I create a quote with the following data files
      | exchangeName | dataFileName                                    |
      | Exchange I   | bcr_life_quote_data_exchangeI_market_snapshot   |
      | Exchange II  | bcr_life_quote_data_exchangeII_market_snapshot  |
      | Exchange III | bcr_life_quote_data_exchangeIII_market_snapshot |
      | Exchange IV  | bcr_life_quote_data_exchangeIV_market_snapshot  |
      | Exchange XI  | bcr_life_quote_data_exchangeXI_market_snapshot  |
    Then A Life Market Snapshot quote card should be successfully displayed

  @wip
  Scenario: Create PCR life Quote with a enrolled plan different then the lowest plan on the quote for Exchange I

  @critical @wip
  Scenario: Create PCR life Quote with narrow Plan filter set and few plans selected on Exchange II

  @wip
  Scenario: Create PCR life Quote with narrow Plan filter set and single plans selected on Exchange II

  @wip
  Scenario: Create PCR life Quote with a enrolled plan different then the lowest plan on the quote for Exchange II

  @wip
  Scenario: Create PCR life Quote with narrow Plan filter set and few plans selected on Exchange III

  @wip
  Scenario: Create PCR life Quote with narrow Plan filter set and single plans selected on Exchange III

  @wip
  Scenario: Create PCR life Quote with a enrolled plan different then the lowest plan on the quote for Exchange III

  @wip
  Scenario: Create PCR life Quote with narrow Plan filter set and few plans selected on Exchange IV

  @wip
  Scenario: Create PCR life Quote with narrow Plan filter set and single plans selected on Exchange IV

  @wip
  Scenario: Create PCR life Quote with a enrolled plan different then the lowest plan on the quote for Exchange IV

  @wip
  Scenario: Create PCR life Quote with narrow Plan filter set and few plans selected on Exchange XI

  @wip
  Scenario: Create PCR life Quote with narrow Plan filter set and single plans selected on Exchange XI

  @wip
  Scenario: Create PCR life Quote with a enrolled plan different then the lowest plan on the quote for Exchange XI

  @wip
  Scenario: Create BCR life Quote with narrow Plan filter set and few plans selected on Exchange I

  @critical @wip
  Scenario: Create BCR life Quote with narrow Plan filter set and single plans selected on Exchange I

  @wip
  Scenario: Create BCR life Quote with narrow Plan filter set and few plans selected on Exchange II

  @wip
  Scenario: Create BCR life Quote with narrow Plan filter set and single plans selected on Exchange II

  @wip
  Scenario: Create BCR life Quote with narrow Plan filter set and few plans selected on Exchange III

  @wip
  Scenario: Create BCR life Quote with narrow Plan filter set and single plans selected on Exchange III

  @wip
  Scenario: Create BCR life Quote with narrow Plan filter set and few plans selected on Exchange IV

  @wip
  Scenario: Create BCR life Quote with narrow Plan filter set and single plans selected on Exchange IV

  @wip
  Scenario: Create BCR life Quote with narrow Plan filter set and few plans selected on Exchange XI

  @wip
  Scenario: Create BCR life Quote with narrow Plan filter set and single plans selected on Exchange XI
