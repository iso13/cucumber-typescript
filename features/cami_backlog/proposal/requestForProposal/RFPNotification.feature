@RFPNotification @distributeSquad @noScenario @cami
Feature: RFP Notification
  As a User
  I should be able to see simple notifications on the
  Broker Portal indicating that I have new RFPs that have come in.

  Scenario Outline: View RFP Notification section on application menu
    Given I login as a "<userRole>"
    When I go to the application menu
    Then a notification section is shown on the application menu
    Examples:
      | userRole                 |
      | qsl_sales_executive      |
      | qsl_general_agent        |
      | qsl_system_administrator |
      | qsl_regional_director    |
      | qsl_underwriter          |

  Scenario Outline: Hide RFP Notification section on application menu
    Given I login as a "<userRole>"
    When I go to the application menu
    Then a notification section is not shown on the application menu
    Examples:
      | userRole      |
      | qsl_requester |

  Scenario: RFP Notification increase on new RFP
    Given I login as a 'qsl_sales_executive'
    And I get the number of notifications
    And I sign out from the app on current menu
    And I login as a 'qsl_requester'
    And I have a group with census created with
      | group_data     | census_data         |
      | i have a group | Tmpl_14EEs_4cl.xlsx |
    And I create an rfp
    And I sign out from the app
    When I login as a 'qsl_sales_executive'
    Then the number of notifications increase
