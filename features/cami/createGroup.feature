@cami @groups @createGroup
Feature: Create Group
  As a Requester
  I need to be able to create groups
  So I can manage those groups inside QuotePad

  Background:
    Given I login as a "requester"

  @blocker
  Scenario: Create a new group
    When I associate the group with a broker
    And I fill in my group information
    Then I should be able to save a group

  @critical
  Scenario: Create a new group with the multi-county ZIP code
    When I associate the group with a broker
    And I fill in my group information with a multi-county zip
    Then I should be able to save a group
