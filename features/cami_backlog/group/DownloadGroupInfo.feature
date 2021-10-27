@downloadGroup @cami
Feature: Download Group
  As an User
  I need to be able to download my group
  So I can provide the group data to clients

  * Download Group Information button on the group profile should download all group profile data in a summary CSV file
  * Download Group Information button on the group profile should download all group documents
  * Download Group Information button on the group profile should download the groups census with all member data available

  Scenario: Download group profile data as a csv
    Given I login as an "userRole"
    And I have a list of groups
    When I download the "group profile data"
    Then I should have a copy of the "group profile data"

  Scenario: Download group documents
    Given I login as an "userRole"
    And I have a list of groups
    When I download the "group documents"
    Then I should have a copy of the "group documents"

  Scenario: Download group census
    Given I login as an "userRole"
    And I have a list of groups
    When I download the "group census"
    Then I should have a copy of the "group census"
