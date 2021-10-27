@principal @groups @editGroup @wip
Feature: Edit Group
  As a Requester
  I need to be able to edit groups
  So I can update groups based on information received from my client

  Background:
    Given I login as a "Requester"
    And I have created a new group
    And I navigate to "Group Profile" page for the group

  @critical
  Scenario: Edit existing group by changing all data and confirm the data is saved
    When I populate all group profile fields with valid data
    And save a group
    Then group saves successfully
    And required group info gets updated

  @minor
  Scenario: Edit existing group by adding the contact information for it
    When I navigate to "Contact" tab
    And I populate all the Contact Details fields
    And save a group
    Then all the entered contact details should be saved
