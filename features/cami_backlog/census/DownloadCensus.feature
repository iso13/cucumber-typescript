@downloadCensus @cami
Feature: Download Census
  As a User
  I should to be able to download census members
  So I can provide the group data to clients

  Scenario: User should be able to download census in xls
    Given I login as a "userRole"
    When I navigate to group '<existingTestGroup>'
    Then I should be able to download the census in "xls"

  Scenario: User should be able to download census in xlsx
    Given I login as a "userRole"
    When I navigate to group '<existingTestGroup>'
    Then I should be able to download the census in "xlsx"
