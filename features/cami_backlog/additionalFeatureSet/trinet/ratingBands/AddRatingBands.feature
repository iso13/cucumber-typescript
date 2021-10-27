@addRatingBands @ratesSquad @trinet @wip
Feature: Add Rating Bands
  As a User
  I need to be able to set rating bands
  So I can supply the rates that will be used to quote a group for my client

  Scenario: User is able to set primary effective quarter, alternate effective quarter, current effective quarter

  Scenario: User has 8 prior and future effective quarters available

  Scenario: User is able to set and save primary and alternate expiration date

  Scenario: "Some Bands Not Set" dialog should appear with correct text when for a exchange and single/multiple quarter, all bands are not set

  Scenario: Message pop-up displays accurately when Carrier bands for effective quarter are set but not Quarter itself

  Scenario: Validate effective quarter bands can't be saved when bands for all carrier for that effective quarter are not set

  Scenario: User should be able to save rating bands for medical ,STD and life together for a exchange

  Scenario: User should be able to save rating bands for all exchanges together

  Scenario: User should be able to set all rating bands for exchange using the Default Bands dialog

  Scenario: PCR button should be disabled if rating bands for any effective quarters have not been set

  Scenario: PCR button should be disabled if Group effective date doesn't fall in any effective quarter date.

  Scenario: Set effective Quarter using allowed formats for Rate Band using PUT request

  Scenario: Validate effective Quarter set are returned using GET Band request

  Scenario: Validate Error Response ,when Setting effective Quarter using in-correct format

  Scenario: Validate Response when Quarter being set doesn't fall in 8 prior and future effective quarters range

  Scenario: Validate Response when User sets the same quarter for different Effective Quarters

  Scenario: Validate Response when User sets a quarter for which bands are not present in Request

  Scenario: Validate Response when User sets a quarter and bands Successfully

  Scenario: Validate Response when Posting Request with Incomplete/missing Carrier Bands or Effective Quarters

  Scenario: Validate User is able to set Expiration date Successfully

  Scenario: Validate Error Response when for Primary and Alternate Effective date are in incorrect format

  Scenario: Validate user should not be able to set an expiration date that is not in the future
