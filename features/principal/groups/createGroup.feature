@principal @groups @createGroup
Feature: Create Group
  As a Requester
  I need to be able to create groups
  So I can manage those groups inside QuotePad

  Background:
    Given I login as a "Requester"
    And start creating new group

  @blocker
  Scenario: Create a new group
    When I populate all group profile fields with valid data
    And I save a group
    Then A group should be successfully created

  @critical
  Scenario Outline: Create a new group with the multi-county ZIP code "<ZIP>" and selected county "<county>"
    And I populate all group profile fields with valid data
    And I input ZIP code "<ZIP>"
    When I select "<county>" county in the multi-county dialog
    And I save a group
    Then Selected "<county>" county should be saved for the group
    Examples:
      | ZIP   | county  |
      | 78942 | Fayette |
      | 60548 | Lasalle |
