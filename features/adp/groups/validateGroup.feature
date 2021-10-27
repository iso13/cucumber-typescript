@adp @groupValidation @review @wip
Feature: Validate group
  As a Producer
  I need to be informed when I am missing group data
  So I can configure my group based on what is needed to successfully quote

  Scenario: I should not be able to save a group when the group name is missing. A red error message should be presented below the group name reading "Company name is required"

  Scenario: I should not be able to save a group when the zip code is missing. A red error message should be presented below the zip code reading "Zip code is required"

  Scenario: I should not be able to save a group when the zip code name is invalid. A red error message should be presented below the zip code reading "Enter a valid zip code"
