@setFiltersToNarrowDownAvailablePlans @trinet @cami
Feature: Set Filters To Narrow Down Available Plans
  As a User
  I want to option to set filter or not for narrowing plan when creating quotes

  Scenario Outline: Validate the ability of filtering
    Given I login as a "Carrier Admin"
    And I create a new group
    And I create a new proposal
    When I select to filter by "<Filter Criteria>"
    Then plans should be filtered by "<Filter Criteria>"

    Examples:
      | Filter Criteria |
      | names           |
      | percentage      |
      | dollar amount   |
