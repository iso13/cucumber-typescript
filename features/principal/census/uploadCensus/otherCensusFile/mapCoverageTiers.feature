@principal @census @uploadCensus @otherCensusFile @mapCoverageTiers @distribute
Feature: Map Coverage Tiers
  As a Requester
  I need to be able to map my custom coverage tiers used as my brokerage to QuotePad coverage tiers
  So that I can correctly assign employee coverage tiers when quoting

  Background:
    Given I login as a "Requester"
    And I have created a new group

  @critical
  Scenario: All census coverage codes from file should be displayed correctly in mapping dialog
    When I select an Other Census "Other_15EEs_noCl_MDV_1" file to upload
    And I match the census file data in the matching dialog
    Then I should see the coverage codes from census file for Dental and Vision product lines

  @wip
  Scenario: All coverage tiers should be mapped for valid census upload

  @major
  Scenario Outline: Coverage tiers mapping dialog should popup for <product_lines> product line(s)
    When I select an Other Census "<census_file>" file to upload
    And I match the census file data in the matching dialog
    Then I should see a dialog for mapping of coverage tiers for "<product_lines>" product lines
    Examples:
      | census_file            | product_lines  |
      | Other_15EEs_noCl_MDV_2 | Dental         |
      | Other_15EEs_noCl_MDV_1 | Dental, Vision |

  @wip
  Scenario: Coverage tiers should automatically detect and map recognized fields
