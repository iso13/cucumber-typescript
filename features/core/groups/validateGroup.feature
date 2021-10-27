@core @groupValidation @wip @jorge
Feature: Validate group
  As a Broker
  I need to be informed when I am missing group data
  So I can configure my group based on what is needed to successfully quote

  Background:
    Given I login as a "Broker"

  @critical
  Scenario: I should not be able to save a group when the group name is missing. A red error message should be presented below the group name reading "Company name is required"

  @critical
  Scenario: I should not be able to save a group when the zip code is missing. A red error message should be presented below the zip code reading "Zip code is required"
    When I create a new group with "zip code missing"
    Then I should not be able to save the group

  Scenario: I should not be able to save a group when the zip code name is invalid. A red error message should be presented below the zip code reading "Enter a valid zip code"

  Scenario: I should be informed that there must be a product selected to create a group
