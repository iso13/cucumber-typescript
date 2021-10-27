@censusUpload @MapFieldsOnOtherCensus @cami
Feature: Map Fields On Other Census
  As a User
  I need to be able to upload census file via Other Census upload
  So I can import all employees data into the LLH Software Suite

  @critical
  Scenario: Confirm other census can be imported to a group successfully
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I upload '<CustomCensusFile>' census file as 'other' census
    Then the census should save successfully

  Scenario: Set the header row via both the drop-down and clicking from the sample row displayed
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I upload '<CustomCensusFile>' census file as 'other' census
    Then the census should save successfully

  Scenario: Set the mapping for each field in your census and confirm they upload successfully
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I upload '<CustomCensusFile>' census file as 'other' census
    Then the census should save successfully

  Scenario: Field should display "We found a match!", when Fields from the census file are automatically mapped to quotepad census fields
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I upload '<CustomCensusFile>' census file as 'other' census
    Then the census should save successfully

  Scenario: Sample data from the census file should be displayed when mapping so that a user can accurately map fields
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I upload '<CustomCensusFile>' census file as 'other' census
    Then the census should save successfully

  Scenario: Skipping column for unmapped fields should be possible
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I upload '<CustomCensusFile>' census file as 'other' census
    Then the census should save successfully

  Scenario: Skipped field can be viewed when checking checkbox - Show skipped data
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I upload '<CustomCensusFile>' census file as 'other' census
    Then the census should save successfully

  Scenario: Unmatched fields should be highlighted in red and display a message "Match your data"
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I upload '<CustomCensusFile>' census file as 'other' census
    Then the census should save successfully

  Scenario: If all fields have not been matched or skipped we should not be able to continue uploading the census
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I upload '<CustomCensusFile>' census file as 'other' census
    Then the census should save successfully

  Scenario: Date of birth and date of higher can set the date type being used such as MM/DD/YY etc.
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I upload '<CustomCensusFile>' census file as 'other' census
    Then the census should save successfully
