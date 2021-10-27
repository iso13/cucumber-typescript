@principal @groups @validateGroup @validateGroupFields
Feature: Validate Group Fields
  As a Requester
  I need to be informed when I am missing group data
  So I can configure my group based on what is needed to successfully quote

  Background:
    Given I login as a "Requester"
    And I start creating new group

  @blocker @DISTRIBUTE-269
  Scenario Outline: Validate group missing "<field_name>" value, so user is not able to save a group (Save button is disabled)
    When I fill in all the group profile fields except the <field_name>
    Then red error message for group <field_name> field displays
    And group cannot be saved (Save button is disabled)
    Examples:
      | field_name                   |
      | Company Name                 |
      | Zip Code                     |
      | City                         |
      | Number of Eligible Employees |

  @critical
  Scenario: Validate group missing values, so user is not able to save a group (Error dialog displays)
    When I fill in all the group profile fields except the SIC Code
    And I save a group
    Then group cannot be saved, error dialog with the message "Group cannot be saved. SIC code is a required field." pops up

  @critical
  Scenario: Validate group info, so user is not able to save it without at least one product line selected
    When I populate some group profile fields with data
      | group without products |
    And I save a group
    Then group cannot be saved, error dialog with the message "Please select at least one product to quote!" pops up

  @major
  Scenario: Validate group Zip code, so user is not able to save invalid one
    When I populate all group profile fields with valid data
    And I input invalid ZIP code 11111
    Then state field gets filled in with empty value
    And group cannot be saved (Save button is disabled)

  @critical @DISTRIBUTE-269
  Scenario: Validate group quote effective date, so user is not able to select a date, that is in the past
    Then I cannot select a Quote Effective Date that is in the past
