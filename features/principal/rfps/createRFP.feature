@principal @createRFP @critical
Feature: Create RFP
  As a Requester
  I want to be able to create an request for proposal
  So that an underwriter or an allowed user can see the RFP information that I entered

  Background:
    Given I login as a "qsl_requester"
    And I have a group with census created with
      | group_data     | census_data         |
      | i have a group | Tmpl_14EEs_4cl.xlsx |
    And I create an rfp
    And I sign out from the app

  @wip
  Scenario: Create a Basic RFP with an allowed broker role
    When I login as a "qsl_underwriter"
    And Go to the listing RFPs page
    Then I am able to find the created RFP manually

  Scenario: Create a Basic RFP and search for it
    When I login as a "qsl_underwriter"
    And Go to the listing RFPs page
    Then I am able to find the created RFP by using the searcher

  @DISTRIBUTE-287
  Scenario: Create a Basic RFP with no allowed broker role
    Given I login as a "requester"
    And I navigate to group list
    When I select the created group from the list of groups
    Then I am not able to create an RFP
