@transamerica @groups @listGroups @dev
Feature: List of Groups
  As a QuotePad user
  I need to be able view a list of groups that I have access to
  So that I can search for groups that I want to sell to

  Background: User login on the portal
    Given I login as a "underwriter"

  @minor @wip
  Scenario Outline: List of groups allows user to sort them by "<columnName>" column values in <sortOrder> order
    When I sort "<columnName>" column in "<sortOrder>" order
    Then I should be able to see groups sorted by "<columnName>" in "<sortOrder>" order
    Examples:
      | columnName     | sortOrder  |
      | Group          | ascending  |
      | Group          | descending |
      | Contact        | ascending  |
      | Contact        | descending |
      | Phone          | ascending  |
      | Phone          | descending |
      | Email          | ascending  |
      | Email          | descending |
      | Sales Exec     | ascending  |
      | Sales Exec     | descending |
      | Broker         | ascending  |
      | Broker         | descending |
      | Employees      | ascending  |
      | Employees      | descending |
      | Effective date | ascending  |
      | Effective date | descending |
      | Due date       | ascending  |
      | Due date       | descending |
      | Status         | ascending  |
      | Status         | descending |

  @major
  Scenario: Due date column value match with due date of the group
    And start creating new group
    And I populate all group profile fields with valid data
    When I get the due date from the group profile
    And I save the group
    And I navigate to the "Groups" tab
    Then The due date column value match with the group profile due date
