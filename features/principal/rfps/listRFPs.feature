@principal @listRFPs
Feature: List RFPs
  As a Carrier Sales person
  I want to be able to see all RFPs that have come in
  So that I do not I do not waste time going through past and present RFPs via emails

  Background:
    Given I login as a "qsl_requester"
    And I have a group with census created with
      | group_data     | census_data         |
      | i have a group | Tmpl_14EEs_4cl.xlsx |
    And I create an rfp
    And I sign out from the app

  @critical
  Scenario Outline: View RFP Listing page
    When I login as a '<user>'
    And  Go to the listing RFPs page
    Then User is able to see the RFPs listing page
    And I sign out from the app
    Examples:
      | user                     |
      | qsl_sales_executive      |
      | qsl_underwriter          |
      | qsl_system_administrator |
      | qsl_general_agent        |
      | qsl_regional_director    |

  @DISTRIBUTE-320
  Scenario: View RFPs by created date in descending order
    Given I login as a "qsl_requester"
    And I create few rfps
      | group_data         | census_data         |
      | Group CA 3571 50 L | Tmpl_14EEs_4cl.xlsx |
      | Group CA 3571 50 L | Tmpl_14EEs_4cl.xlsx |
    And I sign out from the app
    When I login as a "qsl_sales_executive"
    And  Go to the listing RFPs page
    Then The Rfps are listed by created date in descending order
