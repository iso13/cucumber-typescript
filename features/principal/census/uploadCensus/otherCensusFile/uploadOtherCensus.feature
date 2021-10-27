@principal @census @uploadCensus @otherCensusFile @uploadOtherCensus
Feature: Upload Other Census
  As a Requester
  I need to be able to upload census file via Other Census upload
  So I can import all employees data into Quotepad

  Background:
    Given I login as a "Requester"

  @blocker @DISTRIBUTE-364
  Scenario: Upload Other census file, containing all valid data, and confirm it is imported correctly
    And I have created a new group
    And I upload an Other Census on Principal using "other_census_template_data"
    Then No census error dialogs should appear
    And I should be redirected to Plan Designer page

  @wip
  Scenario: If Dental and Vision products are not selected, other census file without election values should upload successfully
    When I start creating new group with required fields
    But I unselect "Dental, Vision" lines for quoting
    And save a group
    And I upload Other census file
      | censusNoDentalVisionElections.xlsx |
    Then there should be no error warnings pop up
    And my census can be saved successfully
