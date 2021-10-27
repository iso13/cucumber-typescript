@createGroup @cami
Feature: Create Group
  As an User
  I need to be able to Create groups
  So I can manage those groups inside

  @blocker @stepsAdded
  Scenario: Create new group with the minimum required data
    Given I login as an "account manager"
    And I start new group creation
    And I assign a new group to a broker
    And I populate the group with data:
      | name       | zip   | sic  | number_of_ees | effective_date    |
      | Vlad Group | 94040 | 3571 | 10            | September 1, 2020 |
    And I add following product lines:
      | Dental |
      | Vision |
    When I try to save my group
    Then The group should be saved successfully

  Scenario: Create new group with a full set of data
    Given I login as an "userRole"
    When I create a Group with all group fields and census data
    Then The group should be saved successfully
