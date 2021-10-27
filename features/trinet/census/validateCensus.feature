@trinet @validateCensus @carlos
Feature: Validate Census
  As a Broker
  I need to be notified if I am missing data from my census
  So that I can quote successfully for a group

  Background: I log in using Carrier admin user
    Given I login as a "carrier_admin"
    When I create a new group with "minimum group data" and owner as "TriNet Sales"

  @critical
  Scenario: Inform users when the census count does not match the number of eligible employees field on the group profile

  @blocker
  Scenario: Required fields on the census should show a message in red reading "Required" below the field when left empty
    And I click on input census manually and add click on add one member
    Then I verify the required census fields

  Scenario: Validate if zip code on census is an invalid zip then a message in red should display "Must be a valid zip code"

  Scenario: Zip code values should not be 00000. If the zip code is 00000 then a message in red should display "Must be a valid zip code"

  Scenario: Validate if the zip code on census belongs to a country out of US , message in red should display "Must be a valid zip code"

  Scenario: Zip code values must be 5-digit zip codes. If the zip code is not 5 digits then a message in red should display "Enter a 5-digit zip code"

  Scenario: Validate if DOB is not in the format MM/DD/YYYY, then a message in red should display "Must be in MM/DD/YYYY format"

  Scenario: Validate if Zip code for a member is out of state then red error message below the zip code with state abbreviation

  @critical
  Scenario: Work zip column should display in the Census UI

  @blocker @wip
  Scenario: Work zip should be considered as required field in the census UI
      | trigger action                             | result                                                    |
      | Attemp to save with work zip not populated | tooltip will display the message 'missing required field' |
      | work zip not populated                     | workzip is flagged in red                                 |

  @blocker @wip
  Scenario: Home zip code is taken as work zip code if work zip column is empty during a census upload

  @stretch @minor
  Scenario: A notification dialog should display if home zip values are mapped to work zip fields
