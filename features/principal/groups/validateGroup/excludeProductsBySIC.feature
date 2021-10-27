@principal @groups @validateGroup @excludeProductsBySIC @critical
Feature: Exclude Product Lines by Standard Industrial Classification (SIC) Code
  As a Requester
  I should not be able to select product lines that are unavailable for the industry (SIC code)
  So my quotes are accurate and I don't do excessive work which will be declined eventually

  Background:
    Given I login as a "Requester"
    And start creating new group

  Scenario Outline: Allow user to select all product lines without restrictions for <noRestrictionsSIC> SIC code
    When I populate SIC field with <noRestrictionsSIC> code
    Then Dental, STD, LTD, GTL, Vision, VTL, CI, Accident products should be available for selection
    Examples:
      | noRestrictionsSIC |
      | 0111              |
      | 0783              |
      | 1629              |
      | 2392              |
      | 3111              |

  Scenario Outline: Exclude all product lines as declined to quote for <allDeclinedSIC> SIC code
    When I populate SIC field with <allDeclinedSIC> code
    Then Dental, STD, LTD, GTL, Vision, VTL, CI, Accident products should not be available for selection

    Examples:
      | allDeclinedSIC |
      | 9999           |
      | 8811           |

  Scenario Outline: Exclude product line (<product>) as declined to quote for <sic> SIC code
    When I populate SIC field with <sic> code
    Then <product> product should not be available for selection

    Examples:
      | sic  | product  |
      | 3292 | GTL      |
      | 0913 | STD      |
      | 1021 | LTD      |
      | 0919 | Accident |
      | 3292 | VTL      |
      | 1021 | CI       |

  Scenario Outline: Exclude product line (<product>) as subject to underwriting guidelines for <sic> SIC code
    When I populate SIC field with <sic> code
    Then <product> product should not be available for selection

    Examples:
      | sic  | product  |
      | 6726 | Dental   |
      | 1041 | GTL      |
      | 7291 | STD      |
      | 7299 | LTD      |
      | 7291 | Accident |
      | 7299 | VTL      |
      | 7363 | CI       |
      | 6726 | Vision   |

  Scenario Outline: Exclude all product lines as subject to underwriting guidelines for <allDeclinedSIC> SIC code
    When I populate SIC field with <allDeclinedSIC> code
    Then Dental, STD, LTD, GTL, Vision, VTL, CI, Accident products should not be available for selection

    Examples:
      | allDeclinedSIC |
      | 9721           |
      | 7299           |
