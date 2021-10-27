@principal @groups @validateGroup @limitGroupZipCodes @critical
Feature: Limit Group Zip Codes to 50 US States and District of Columbia
  As a Requester
  I should be warned whenever I enter a ZIP code outside of the 50 US permitted states and/or Columbia district
  So that I don't create groups that are not allowed to quote

  Scenario Outline: Restrict user from saving a group outside of the 50 US permitted states and District of Columbia (<zip_code>)
    Given I login as a "Requester"
    And start creating new group
    When I populate all group profile fields with valid data
    And I input ZIP code <zip_code>
    Then <products> products should not be available for selection
    And group cannot be saved (Save button is disabled)

    Examples:
      | zip_code | products                                         |
      | 96799    | Dental, STD, LTD, GTL, Vision, VTL, CI, Accident |
      | 96929    | Dental, STD, LTD, GTL, Vision, VTL, CI, Accident |
      | 00820    | Dental, STD, LTD, GTL, Vision, VTL, CI, Accident |
      | 00920    | Dental, STD, LTD, GTL, Vision, VTL, CI, Accident |
