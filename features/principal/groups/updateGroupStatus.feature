@principal @groups @updateGroupStatus @critical
Feature: Update Group Status
  As a Underwriter
  I need to be able to update the current group status
  So the group can be updated according to current status

  Background:
    Given I login as a "middle_system_administrator"
    And I create a new group with "i have a group" and owner as "broker"
    And I upload a census "Tmpl_14EEs_4cl" selecting "Principal Census Template" as template type
    And I sign out from the app

  Scenario Outline: Unable to change the status as not underwriter
    When I login as a '<user>'
    And I navigate to group list
    And I select the created group from the list of groups
    And I navigate to the group "Plans" tab
    Then I should not get the status updater
    Examples:
      | user                     |
      | middle_requester_1       |
      | middle_sales_executive   |
      | middle_customer_success  |

  Scenario Outline: Update status as underwriter
    When I login as a "middle_underwriter"
    And I navigate to group list
    And I select the created group from the list of groups
    And I navigate to the group "Plans" tab
    And I set the action to <actions>
    And I should get the status updated to <status>
    And I navigate to group list from a group
    Then I should get the status at grouplist updated to <status>
    Examples:
      | actions                                                                                                   | status              |
      | Release_to_UW                                                                                             | need_uw_review      |
      | Release_to_UW In_UW_Review                                                                                | in_uw_review        |
      | Release_to_UW In_UW_Review Release_to_Sales                                                               | sales_review        |
      | Release_to_UW In_UW_Review Release_to_Sales Release_to_Broker                                             | broker_review       |
      | Release_to_UW In_UW_Review Release_to_Sales Release_to_UW In_UW_Review Release_to_Sales Release_to_Broker | broker_review       |
      | Release_to_UW In_UW_Review Decline_to_Quote                                                               | sales_review        |
