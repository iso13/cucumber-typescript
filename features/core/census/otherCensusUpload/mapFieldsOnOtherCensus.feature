@core @censusUpload @otherCensus @ferChacon
Feature: Map Other Census
  As a Broker
  I need to be able to map my fields from a census file(xls, xlsx or csv) to fields in Quotepad
  So that I can quickly set up a group's census

  Background:
    Given I login as a "Broker"
    And I have a group

  @critical
  Scenario: Set the header row via both the drop-down and clicking from the displayed sample row

  @blocker
  Scenario: Set the mapping for each field in your census and confirm they upload successfully
    When I upload an Other Census using "I_have_a_census" file
    Then My census should be successfully created

  @wip
  Scenario: Fields from the census file should be automatically mapped to QuotePad census fields where we can determine the mapping. The field should display "We found a match!"

  @wip @critical
  Scenario: Sample data from the census file should be displayed when mapping so that a user can accurately map fields

  @wip
  Scenario: If we don't want to map a field from the census then we should be able to skip individual fields. There should then be a checkbox to toggle displaying the skipped fields

  @wip
  Scenario: Unmatched fields should be highlighted in red and display a message "Match your data"

  @wip
  Scenario: If all fields have not been matched or skipped we should not be able to continue uploading the census

  @wip
  Scenario: Date of birth and date of hire can set the date type being used (i.e. MM/DD/YY etc..)
