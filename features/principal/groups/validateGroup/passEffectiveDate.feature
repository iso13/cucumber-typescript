@principal @groups @validateGroup @excludeUsersFromSelling
Feature: Exclude Users From Selling
  As a Carrier
  I need to prevent specific users from selling quotes with Past Effective Dates

  Background:
    Given I login as a "child_underwriter"
    And start creating new group
    And I set "child requester2" as owner of the group
    And I populate all group profile fields with valid data
    And I set the effective date one year in the past
    And I save a group
    And I upload a census "Tmpl_14EEs_4cl" selecting "Principal Census Template" as template type
    And I sign out from the app

  @blocker @DISTRIBUTE-271
  Scenario: Try to create a quote on a group with Past Effective Dates on a disabled role
    Given I login as a 'child_requester_2'
    And I navigate to group list
    And I select the created group from the list of groups
    And I create few custom plans:
      | gtl plan 1 mvp2 |
    And I create a quote based on the custom plan
    Then I should not be allow to save the quote

  @blocker @DISTRIBUTE-271
  Scenario: Try to create a Proposal on a group with Past Effective Dates on a disabled role
    Given I login as a 'child_system_administrator'
    And I navigate to group list
    And I select the created group from the list of groups
    And I create few custom plans:
      | gtl plan 1 mvp2 |
    And I create a quote based on the custom plan
    And I sign out from the app
    And I login as a 'child_requester_2'
    And I navigate to group list
    And I select the created group from the list of groups
    When I start creating a proposal for the quote
    Then I should not be allow to save the proposal

  @blocker @DISTRIBUTE-271
  Scenario: Try to create a quote on a group with Past Effective Dates on a enabled role
    Given I login as a 'child_system_administrator'
    And I navigate to group list
    And I select the created group from the list of groups
    And I create few custom plans:
      | gtl plan 1 mvp2 |
    When I create a quote based on the custom plan
    Then A quote for the selected plan should be successfully created

  @minor
  Scenario: Try to create a Proposal on a group with Past Effective Dates on a enabled role
    Given I login as a 'child_system_administrator'
    And I navigate to group list
    And I select the created group from the list of groups
    And I create few custom plans:
      | dental plan 1 |
    When I create a quote based on the custom plan
    And I create a proposal for the quote
    Then A proposal should be successfully created
