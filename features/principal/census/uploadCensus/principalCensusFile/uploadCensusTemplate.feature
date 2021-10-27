@principal @census @uploadCensus @principalCensusFile @uploadCensusTemplate
Feature: Upload Census Template
  As a Requester
  I need to be able to upload Principal census file into my group
  So I can import all employees and their dependents data into Quotepad

  Background:
    Given I login as a "Requester"

  @blocker @DISTRIBUTE-364
  Scenario: Upload a file, containing all valid data, and confirm it is imported correctly
    Given I have created a new group
    When I upload Principal census file
    Then No census error dialogs should appear
    And I should be redirected to Plan Designer page

  @wip
  Scenario: If Dental and Vision products are not selected, Principal census file without election values should upload successfully
    When I start creating new group with required fields
    But I unselect "Dental, Vision" lines for quoting
    And save a group
    And I upload Principal census file
      | censusNoDentalVisionElections.xlsx |
    Then there should be no error warnings pop up
    And my census can be saved successfully
