@principal @census @uploadCensus @otherCensusFile @validateOtherCensus @wip
Feature: Validate Other Census
  As a Requester
  I need to be notified if I am missing data and what rows/columns the data is missing from
  So that I can update my census and start quoting

  Background:
    Given I login as a "Requester"
    And I have created a new group

  @major
  Scenario Outline: Columns containing census data should be marked as "<validation_message>"
    When I upload Other census file
      | <valid_or_invalid_census> |
    Then I should be able to see those columns marked with "<validation_message>"
    Examples:
      | valid_or_invalid_census | validation_message |
      | validDataCensus.xlsx    | Validated!         |
      | invalidDataCensus.xlsx  | Invalid!           |

  @minor
  Scenario: Columns marked as "Invalid Data" should display the count of cells with invalid data

  Scenario: User should be able to see all data validation errors by clicking "Show All Data Errors"
    When I upload Other census file
      | invalidDataCensus.xls |
    Then I should be able to see Show All Data Errors option
    And see all data validation errors
