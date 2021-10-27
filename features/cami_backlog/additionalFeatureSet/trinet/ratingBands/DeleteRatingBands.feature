@deleteRatingBands @ratesSquad @trinet @wip @cami
Feature: Delete Rating Bands
  As a User
  I should be able to remove the rating bands that I set
  So I can generate quotes without rates or update rates

  @blocker
  Scenario: Clear all rating bands for an exchange
    Given I login as a "userRole"
    When I set the rate bands for "Exchange II"
    Then I should be able to clear all rating bands for all carriers

  Scenario: Only the rating bands for the exchange you cleared rating bands are removed

  Scenario: User cannot create PCR quote for exchange for which rates are cleared

  Scenario: Response when Deleting Bands without parameters

  Scenario: Response when Deleting Bands with effective date in parameters
  #Delete with effective date in Quarter
  #Delete with effective date and exchange id

  Scenario: Response for Deleting Bands with parameters
  #Delete with Effective date is not in any Effective Quarter
  #Effective date is not the initial quarter date and exchange id exist
  #Effective date is initial quarter date and exchange id doesn't exist
  #Effective date is initial quarter date and exchange id exist and carrier id doesn't exist

  Scenario: Validate Response Band(s) not found for different scenarios
  #when effective date format is incorrect in Request
  #when effective date doesn't exist
