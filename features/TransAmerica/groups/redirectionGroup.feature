@transamerica @redirectionGroup @major
Feature: Group next page redirection
  As a user
  I don't want to be redirected to upload a census
  So that I can get a quote done

  Scenario Outline: Create a group and I am redirected to Home page
    Given I login as a "<user>"
    And start creating new group
    And I fill out group profile fields with an agent
    When I save a group
    Then I am redirected to the group home page
    Examples:
      | user                 |
      | internal_whole_saler |
      | underwriter          |
