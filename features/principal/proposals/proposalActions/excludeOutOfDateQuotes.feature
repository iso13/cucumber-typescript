@principal @proposals @excludeOutOfDateQuotes
Feature: Exclude Out Of Date Quotes

  As a Requester
  I want to be able to create a proposal only if the quotes are valid
  So that I can create new Proposals following the business rules.

  Background:
    Given I login as a "child_requester_1"
    And start creating new group
    And I set "child_requester_1" as owner of the group
    And I populate all group profile fields with valid data
    And I save a group
    And I upload a census "Tmpl_14EEs_4cl" selecting "Principal Census Template" as template type

  Scenario: "Quotes for Proposal" outdated by profile updates
    And I create few custom plans:
      | vtl plan 1      |
      #| dental plan 1   |
      | accident plan 1 |
    And I create new quotes based on the custom plans
    And I update the group profile info
    When I start creating a proposal
    Then none of the quotes should be selectable on proposal

  Scenario: "Quotes for Proposal" outdated by census updates
    And I create few custom plans:
      | vtl plan 1      |
      #| dental plan 1   |
      | accident plan 1 |
    And I create new quotes based on the custom plans
    And I update all data for the Employee "1"
    And I try to save the census
    When I start creating a proposal
    Then none of the quotes should be selectable on proposal

  Scenario: "Quotes for Proposal" outdated by class updates
    And I create few custom plans:
      | vtl plan 1      |
      #| dental plan 1   |
      | accident plan 1 |
    And I create new quotes based on the custom plans
    And I create new class:
      | number | description |
      | 999    | class name  |
    And I update the class to "999" for the Employee "1"
    And I try to save the census
    When I start creating a proposal
    Then none of the quotes should be selectable on proposal
