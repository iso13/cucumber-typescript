@otherCensusTemplateUpload @cami
Feature: Other Census Template Upload
  As an User
  I need to map fields from a census file
  So that I can quickly set up group census

  * Fields from the census file should be automatically mapped to QuotePad census fields where we can determine the mapping. The field should display "We found a match!"
  * If we don't want to map a field from the census then we should be able to skip individual fields. There should then be a checkbox to toggle displaying the skipped fields
  * Unmatched fields should be highlighted in red and display a message "Match your data"
  * If all fields have not been matched or skipped we should not be able to continue uploading the census
  * Date of birth and date of hire can set the date type being used (i.e. MM/DD/YY etc..)
  * Set the header row via both the drop-down and clicking from the sample row displayed
  * Set the mapping for each field in your census and confirm they upload successfully
  * Field should display "We found a match!", when Fields from the census file are automatically mapped to quotepad census fields
  * Sample data from the census file should be displayed when mapping so that a user can accurately map fields
  * Skipping column for unmapped fields should be possible
  * Skipped field can be viewed when checking checkbox - Show skipped data
  * Unmatched fields should be highlighted in red and display a message "Match your data"
  * If all fields have not been matched or skipped we should not be able to continue uploading the census
  * Date of birth and date of higher can set the date type being used such as MM/DD/YY etc.

  @blocker @stepsAdded
  Scenario: Set the mapping for each field in your census and confirm they upload successfully
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I upload '<CustomCensusFile>' census file as 'other' census
    And I select the '2' row to be a census header
    And I map census file columns to supported column names:
      | file_col | census_col |
      |          |            |
    And I map member tier values to pre-defined ones for Dental product:
      | map_from | map_to |
      | Emp      | EE     |
      | Emp + S  | ES     |
    And I map member tier values to pre-defined ones for Vision product:
      | map_from | map_to |
      | Emp      | EE     |
      | Emp + S  | ES     |
    Then the census should save successfully

  @critical
  Scenario: Set the header row via both the drop-down and clicking from the displayed sample row
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I upload '<CustomCensusFile>' census file as 'other' census
    And I click on row '2' to be the census header
    And I map census file columns to supported column names:
      | file_col | census_col |
      |          |            |
    And I map member tier values to pre-defined ones for Dental product:
      | map_from | map_to |
      | Emp      | EE     |
      | Emp + S  | ES     |
    And I map member tier values to pre-defined ones for Vision product:
      | map_from | map_to |
      | Emp      | EE     |
      | Emp + S  | ES     |
    Then the census should save successfully

  @critical
  Scenario: Sample data from the census file should be displayed when mapping so that a user can accurately map fields
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I upload '<CustomCensusFile>' census file as 'other' census
    And I select the '2' row to be a census header
    Then The sample data in the column matching dialog should display the following data:
      | column_name   | row | value      |
      | First Name    | 1   | Vlad1      |
      | Date of Birth | 1   | 11/06/1983 |
      | Gender        | 1   | male       |
