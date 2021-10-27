@trinet @addRatingBands @eduardo
Feature: Set Rating Bands
  As a Carrier Admin
  I need to be able to set rating bands
  So I can supply the rates that will be used to quote a group for my client

  Background:
    Given I login as a "carrier_admin"
    And I create a new group with "minimum group data" and owner as "Eric Brown"
    And I upload a census "TRINET_Exchange_II_XI.xlsx" selecting "Exchange II / XI RFP Template File" as template type

  @blocker @MSTR-1985 @MSTR-1984
  Scenario: Confirm you are able to set primary effective quarter, alternate effective quarter, current effective quarter
    When I set Primary Quarter "Q1 2019", Alternate Quarter "Q2 2019" and Current Quarter "Q3 2019"
    Then Verify Primary Quarter "Q1 2019", Alternate Quarter "Q2 2019" and Current Quarter "Q3 2019" are set

  @wip @critical
  Scenario: Confirm you have available 8 prior primary effective and 8 future primary effective quarters

  @wip @critical
  Scenario: Confirm you have available 8 prior alternate effective and 8 future alternate effective quarters

  @wip @critical
  Scenario: Confirm you have available 8 prior current effective and 8 future current effective quarters

  @wip @critical
  Scenario: Confirm you are able to set primary expiration date

  @wip @critical
  Scenario: Confirm you are able to set alternate expiration date

  @wip @critical
  Scenario: Confirm that if you set one exchange and a Primary Effective quarter and you do not set all the bands
  the "Some Bands Not Set" dialog should be present and contain the text "Primary carriers bands"

  @wip @critical
  Scenario: Confirm that if you set one exchange and an Alternate Effective quarter and you do not set all the bands
  the "Some Bands Not Set" dialog should be present and contain the text "Alternate carriers bands"

  @wip @critical
  Scenario: Confirm that if you set one exchange and a Current Effective quarter and you do not set all the bands
  the "Some Bands Not Set" dialog should be present and should contain the text "Current carriers bands"

  @wip @critical
  Scenario: Confirm that if you set one exchange and a Primary Effective quarter and Alternate Effective quarter
  and you do not set all the bands for both quarters, the dialog "Some Bands Not Set" should be present and should
  contain the text "Primary, Alternate carrier bands".

  @wip @critical
  Scenario: Confirm that if you set one exchange and a Current Effective quarter and Alternate Effective quarter
  and you do not set all the bands for both quarters, the "Some Bands Not Set" dialog should be present and
  should contain the text "Current, Alternate carrier bands".

  @wip
  Scenario: Confirm that if you set one exchange and some bands for a carrier in the Alternate Effective quarter column but you do not
  set the Alternate Effective quarter itself you should see the "Some Bands Not Set" dialog and dialog should contain the
  text "Please set effective quarters for Alternate Coverage Quarter"

  @wip @critical
  Scenario: Confirm that if you set one exchange and some bands for a carrier in the Current Effective quarter column but you do not
  set the Current Effective quarter itself, the "Some Bands Not Set" dialog should be presebt and should contain the
  text "Please set effective quarters for Current Coverage Quarter"

  @wip @critical
  Scenario: Validate primary effective quarter bands can't be saved when bands for all carrier for primary effective quarter are not set

  @wip @critical
  Scenario: Validate alternate effective quarter bands can't be saved when bands for all carrier for alternate effective quarter are not set

  @wip @critical
  Scenario: Validate current effective quarter bands can't be saved when bands for all carrier for current effective quarter are not set

  @wip @critical
  Scenario: Confirm you are able to save rating bands for medical and life for exchange I

  @wip @critical
  Scenario: Confirm you are able to save rating bands for medical and life  for exchange II

  @wip @critical
  Scenario: Confirm you are able to save rating bands for medical and life for exchange III

  @wip @critical
  Scenario: Confirm you are able to save rating bands for medical and life for exchange IV

  @wip @critical
  Scenario: Confirm you are able to save rating bands for life for exchange XI

  @wip @critical
  Scenario: Confirm you are able to save all the rating bands that you set for all exchanges.

  @blocker @MSTR-1985 @MSTR-1984 @MSTR-2280
  Scenario: Confirm you are able to set all rating bands for one exchange by using the Default Bands dialog
    When I set the band "5A" for all Medical carriers and "1" for the Life carrier in the primary quarter "Q1 2019" and Exchange "TriNet Exchange II"
    Then Verify the Medical band "5A" and the Life band "1" has been set for carriers

  @wip @critical
  Scenario: You should not be able to create a PCR Quotes(PCR button should be disabled) if have not been set rating bands
  for any of the effective quarters

  @wip @critical
  Scenario: You should not be able to create a PCR Quotes(PCR button should be disabled) if your Group Profile Quote effective date
does not match with your Rating Bands primary effective date or alternate effective date or current effective date.
