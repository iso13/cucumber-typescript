@principal @census @uploadCensus @otherCensusFile @mappingSpreadsheetColumns @wip
Feature: Map Other Census Fields
  As a Requester
  I need to be able to map my fields from a census file (xls, xlsx or csv) to fields in QuotePad
  So that I can quickly set up a group's census

  Background:
    Given I login as a "Requester"
    And I have created a new group
    And I upload Other census file
      | testCensus.xls |

  Scenario: Select a census sheet from multi-sheet Excel file

  Scenario: Set the header row via both the dropdown and by clicking the displayed preview row

  @critical
  Scenario: User should be able to proceed with census upload after all census columns are mapped to supported census field
    When all the columns are mapped to a supported field
    Then I should be able to proceed with other census upload

  @critical
  Scenario: User should be able to proceed with census upload after all unmapped census columns are skipped
    When all unmapped columns are skipped
    Then I should be able to proceed with other census upload

  @minor
  Scenario: If all fields have not been matched or skipped user should not be able to continue uploading the census
    When some columns are unmapped nor skipped
    Then I should not be able to proceed with other census upload

  @major
  Scenario: Fields from the census file should be automatically mapped to QuotePad census fields where we can determine the mapping.

  Scenario: Sample data from the census file should be displayed when mapping so that a user can accurately map fields

  @minor
  Scenario: Unmatched fields should be highlighted in red and display a message "Match your data"
    When some columns are unmapped nor skipped
    Then such columns should be marked with "red" color and have a message "Match your data!"
    And such columns should have a dropdown with no field name selected by default

  @critical
  Scenario: Date of birth and date of hire can set the date type being used (i.e. MM/DD/YY etc..)

  Scenario: User should be able to see skipped columns and map them manually
    When all unmapped columns are skipped
    Then I should be able to show all the skipped columns
    And all the columns are mapped to a supported field
    And I should be able to proceed with other census upload
