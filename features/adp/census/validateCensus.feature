@adp @validateCensus @wip
Feature: Validate Census
  As a Producer
  I need to be notified if I am missing data from my census
  So that I can quote successfully for a group

  Scenario: Inform users when the census count does not match the number of eligible employees field on the group profile

  Scenario: Required fields on the census should show a message in red reading "Required" below the field when left empty

  Scenario: Zip code values must be valid zip codes. If the zip code contains an invalid zip then a message in red should display "Must be a valid zip code"

  Scenario: Zip code values must be 5-digit zip codes. If the zip code is not 5 digits then a message in red should display "Enter a 5-digit zip code"

  Scenario: DOB values must be in the format MM/DD/YYYY. If the DOB is not int that format then a message in red should display "Must be in MM/DD/YYYY format"

  Scenario: Inform users when the Zip code for a member is out of state via a red error message below the zip code. The error message should contain state abbreviation
