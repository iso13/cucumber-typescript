@validateCensusData @cami
Feature: Validate Census Data
  As a User
  I need to validate the census data
  So I can manage my census
  #I need to be notified for missing data and what rows/columns the data is missing from
  #So that I can update my census when adding census members or uploading census and start quoting

  @blocker @stepsAdded
  Scenario: Validate census data required fields
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I upload '<IncompleteCensusFile>' census file as 'template' census
    And I acknowledge census upload warnings
    And I save classes
    Then I should be prompted to add in required census fields:
      | missingFieldName1 |
      | missingFieldName2 |

  @critical
  Scenario: Validate census count does not match the number of eligible employees on the group profile
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    And I upload '10EEs.xlsx' census file as 'other' census
    When I navigate to the group profile page
    Then The value of the field 'Number of Eligible Employees' should not equal '10'

  Scenario: Validate census data home zip code is used for an empty work zip code
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    And I upload 'missing_zip.xlsx' census file as 'other' census
    When I navigate to the group profile page
    Then the home zip code is used

  Scenario: Validate census data with invalid zip codes
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    And I upload 'invalid_zip.xlsx' census file as 'other' census
    When I navigate to the group profile page
    Then I should receive a warning

  Scenario: Validate census data date of birth format
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    And I upload census file as 'other' census with various dates of birth
      | MM/DD/YYYY |
      | DD/MM/YYYY |
      | MM/DD/YY   |
    When I navigate to the group profile page
    Then the date of birth should be supported

  Scenario: Validate census data zip code with member out state
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    And I upload '10EEs.xlsx' census file as 'other' census
    When I navigate to the group profile page
    Then The value of the field 'Number of Eligible Employees' should not equal '10'

  #@blocker
  #Scenario: Required fields on the census should show a message in red reading "Required" below the field when left empty

  #Scenario: Validate if zip code on census is an invalid zip then a message in red should display "Must be a valid zip code"

  #Scenario: Zip code values should not be 00000. If the zip code is 00000 then a message in red should display "Must be a valid zip code"

  #Scenario: Validate if the zip code on census belongs to a country out of US , message in red should display "Must be a valid zip code"

  #Scenario: Zip code values must be 5-digit zip codes. If the zip code is not 5 digits then a message in red should display "Enter a 5-digit zip code"

  #Scenario: Validate if DOB is not in the format MM/DD/YYYY, then a message in red should display "Must be in MM/DD/YYYY format"

  #Scenario: Validate if Zip code for a member is out of state then red error message below the zip code with state abbreviation

  #@critical
  #Scenario: Work zip column should display in the Census UI

  #@blocker
  #Scenario: Work zip should be considered as required field in the census UI
  #| trigger action                             | result                                                    |
  #| Attemp to save with work zip not populated | tooltip will display the message 'missing required field' |
  #| work zip not populated                     | workzip is flagged in red                                 |

  #@blocker
  #Scenario: Home zip code is taken as work zip code if work zip column is empty during a census upload
