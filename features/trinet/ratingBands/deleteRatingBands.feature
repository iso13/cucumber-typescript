@trinet @deleteRatingBands @eduardo
Feature: Delete Rating Bands
  As a Admin Carrier
  I need to be able to removed the rating bands that I set
  So I can generate quotes without rates involved for my client

  Background:
    Given I login as a "carrier_admin"
    And I create a new group with "minimum group data" and owner as "Eric Brown"
    And I upload a census "TRINET_Exchange_II_XI.xlsx" selecting "Exchange II / XI RFP Template File" as template type

  @blocker @MSTR-1985 @MSTR-1984 @MSTR-2280
  Scenario: Confirm you are able to remove all rating bands for the exchange for which you used the clear button
    When I set the band "5A" for all Medical carriers and "1" for the Life carrier and "2" for the Disability carrier in the primary quarter "Q1 2019" and Exchange "TriNet Exchange II"
    And I clear all rating bands for the exchange "TriNet Exchange II"
    Then I verify all rating Bands for the selected exchange have been cleared
    | Carrier                   |
    | Blue Shield of California |
    | Kaiser Permanente         |
    | Aetna                     |
    | Florida Blue              |
    | Tufts                     |
    | Kaiser CO/GA              |

  @wip @critical
  Scenario: Confirm that only the rating bands for the exchange for which you applied the clear button were cleared
