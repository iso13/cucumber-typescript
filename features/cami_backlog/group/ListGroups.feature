@listGroups @cami
Feature: List Groups
  As an User
  I need to be able view a list of groups that I have access to
  So that I can search for groups that I want to sell to

  * List of groups allows user to toggle the number of groups displayed per page
  * List of groups allows user to see the current number of existing groups
  * List of groups updates number of displayed groups based on current parameters of search and filter

  Background:
    Given I login as a "admin"

  Scenario: List of groups displays all basic information
    Then basic group info displays in the list of groups

  @critical
  Scenario: List of groups allows user to select a group
    When I select the group from the list of groups
    Then in-group home page displays for the selected group

  @critical
  Scenario: List of groups allows user to search groups with filters
    When I search the group in the list of groups by "<property_of_group>"
      | property_of_group |
      | Company Name      |
      | Requester's Name  |
      | Status            |
    Then the group displays in the filtered list of groups

  Scenario Outline: List of groups allows user to filter them by "<selected_status>" status
    When I filter groups by "<selected_status>" status
    Then I should be able to see groups with "<selected_status>" status
    Examples:
      | selected_status |
      | Started         |
      | Quoted          |
      | Pending         |
      | Sold            |

  Scenario Outline: List of groups allows user to filter them by "<groupType>" type
    When I filter groups by "<groupType>" group type
    Then I should be able to see groups with "<groupType>" group type
    Examples:
      | groupType      |
      | New Business   |
      | Cross Purchase |

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
      | Employees      | ascending  |
      | Employees      | descending |
      | Effective date | ascending  |
      | Effective date | descending |
      | Status         | ascending  |
      | Status         | descending |

  Scenario: List of groups allows user to delete a group
    When I "Delete" group from the list of groups
    Then the group doesn't display in the list
