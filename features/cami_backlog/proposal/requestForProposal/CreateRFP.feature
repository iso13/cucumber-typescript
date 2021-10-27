@principal @createRFP @distributeSquad @cami
Feature: Create RFP
  As a User
  I should be able to see create Request for Proposal via
  Broker Portal so that I submit Request to appropriate user to create Proposal

  Background:
    Given I login as a "test"
    And I have a group with census created with
      | group_data     | census_data         |
      | i have a group | Tmpl_14EEs_4cl.xlsx |
    And I create an rfp
    And I sign out from the app

  @DISTRIBUTE-287
  Scenario: Create a Basic RFP with no allowed broker role
    When I login as a "requester"
    And I select the group from the list of groups
    Then I am not able to create an RFP

  Scenario: Create a Basic RFP and search for it
    When I login as a "qsl_underwriter"
    And Go to the listing RFPs page
    Then I am able to find the created RFP by using the searcher

  Scenario: Create a Basic RFP with an allowed broker role
    When I login as a "qsl_underwriter"
    And Go to the listing RFPs page
    Then I am able to find the created RFP manually
