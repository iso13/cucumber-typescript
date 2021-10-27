@principal @groups @listGroups
Feature: List of Groups
  As a QuotePad user
  I need to be able view a list of groups that I have access to
  So that I can search for groups that I want to sell to

  Background:
    Given I login as a "Requester"
    And I navigate to group list

  @minor
  Scenario: List of groups displays all basic information
    Then basic group info displays in the list of groups

  @critical @PFG-1496 @PFG-1495 @DISTRIBUTE-287
  Scenario: List of groups allows user to select a group
    When I select the group from the list of groups
    Then in-group home page displays for the selected group

  @critical
  Scenario Outline: List of groups allows user to search groups by their name, requester's name and status
    When I search for groups including "<value>" on their properties
    Then I should be able to see groups with "<value>" on their "<property_of_group>"
    Examples:
      | property_of_group |   value       |
      | Group             |   New         |
      | Broker            |   Harley      |
      | Status            |   started     |

  @critical
  Scenario Outline: List of groups allows user to filter them by "<selected_state>" status
    And I clean the search bar
    When I filter groups by "<selected_state>" status
    Then I should be able to see groups with "<status>" status
    Examples:
      | selected_state  | status   |
      | Started         | started  |
      | Quoted          | quoted   |
      | Pending         | pending  |
      | Rejected        | declined |

  @critical
  Scenario Outline: List of groups allows user to sort them by "<columnName>" column values in <sortOrder> order
    When I sort "<columnName>" column in "<sortOrder>" order
    Then I should be able to see groups sorted by "<columnName>" in "<sortOrder>" order
    Examples:
      | columnName     | sortOrder  |
      | Group          | descending |
      | Group          | ascending  |
      | Contact        | descending |
      | Contact        | ascending  |
      | Phone          | descending |
      | Phone          | ascending  |
      | Broker         | descending |
      | Broker         | ascending  |
      | Effective Date | descending |
      | Effective Date | ascending  |
      | Status         | descending |
      | Status         | ascending  |

  @critical
  Scenario: List of groups allows user to delete a group from it
    And I navigate to home
    And I have a group
    And I upload a census "Tmpl_14EEs_4cl" selecting "Principal Census Template" as template type
    And I navigate to group list from a group
    When I delete the created group from groups list
    Then the group doesn't display in the list

  @minor
  Scenario: List of groups allows user to see the current number of existing groups
    And I clean the search bar
    Then the number groups should match the default and be displayed on the label

  @minor
  Scenario Outline: List of groups allows user to toggle the number of groups displayed per page
    And I clean the search bar
    When I change the number of entries to "<value>"
    Then the number groups should match "<value>" and be displayed on the label
    Examples:
      | value |
      | 10    |
      | 50    |
      | 100   |

  @major
  Scenario: List of groups updates number of displayed groups based on current parameters of search and filter
    When I search for groups including "New"
    And I filter groups by "Started" status
    Then I should be able to see groups with "New" on their name
    And I should be able to see groups with "started" status

  @major
  Scenario: Paginator elements should be displayed by default
    And I clean the search bar
    Then the next and previuos elements should be shown

  @major
  Scenario: Groups should be nested on the group list if they contain the same group name, sic and zip code
    And I navigate to home
    And I have a group with census created with
      | group_data       | census_data         |
      | group duplicable | Tmpl_14EEs_4cl.xlsx |
    And I navigate to home
    And I have a group with census created with
      | group_data       | census_data         |
      | group duplicable | Tmpl_14EEs_4cl.xlsx |
    And I navigate to group list from a group
    When I search the created group from the list of groups
    Then I should see the group as nested
    And I should be able to expand the group and access it
    And in-group home page displays for the selected group
