@principal @groups @reassignGroup
Feature: Reassign Group
  As a Carrier Administrator
  I need to be able to reassign groups
  So I can update groups owners based on my org requirements

  Background:
    Given I login as a "qsl_carrier_administrator"
    And I create a new group with "i have a group" and owner as "qsl broker"
    And I upload a census "Tmpl_14EEs_4cl" selecting "Principal Census Template" as template type

  @critical
  Scenario: Reassign Group from groups profile
    And I navigate to the group "Profile" tab
    When I reassign group owner to "qsl broker_2" from groups profile
    Then the old owner "qsl broker" is added to owners history

  @critical @DISTRIBUTE-387
  Scenario: Reassign Group from groups list
    And I navigate to group list from a group
    When I reassign group owner to "qsl broker_2" from groups list
    And I select the created group from the list of groups
    And I navigate to the group "Profile" tab
    Then the old owner "qsl broker" is added to owners history

  @minor
  Scenario: Group can not be reassigned on groups list from unauthorized role
    And I sign out from the app
    When I login as a "qsl_requester2"
    And I navigate to group list
    Then group can not be reassigned on group list

  @minor
  Scenario: Group can not be reassigned on groups profile from unauthorized role
    And I sign out from the app
    When I login as a "qsl_requester2"
    And I navigate to group list
    And I select the created group from the list of groups
    And I navigate to the group "Profile" tab
    Then group can not be reassigned on profile
