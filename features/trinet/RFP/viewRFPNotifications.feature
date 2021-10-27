@trinet @viewRFPNotifications @critical @wip
Feature: View RFP Notifications
  As a Sales Executive
  I want to be able to view RFP notifications
  So that I do not have to waste time going through emails

  Scenario Outline: View RFP Notification section on application menu
    Given I login as a '<user>'
    When I go to the application menu
    Then a notification section is shown on the application menu
    Examples:
      | user                       |
      | qsl_sales_executive        |
      | qsl_sales_consultant       |
      | qsl_insurance_administrator|
      | qsl_insurance_support      |
      | qsl_account_manager        |

  Scenario Outline: Hide RFP Notification section on application menu
    Given I login as a '<user>'
    When I go to the application menu
    Then a notification section is not shown on the application menu
    Examples:
      | user                     |
      | qsl_insurance_services   |

  Scenario: RFP Notification increase on new RFP
    Given I login as a 'qsl_sales_executive'
    And I get the number of notifications
    And I sign out from the app on current menu
    And I login as a 'qsl_insurance_services'
    And I have a group with census created with
      | group_data     | census_data         |
      | i have a group | Tmpl_14EEs_4cl.xlsx |
    And I create an rfp
    And I sign out from the app
    When I login as a 'qsl_sales_executive'
    Then the number of notifications increase
