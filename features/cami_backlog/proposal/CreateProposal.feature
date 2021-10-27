@createProposal @distributeSquad @cami
Feature: Create Proposal
  As a User
  I want to create proposals
  So that I can propose new quotes for the upcoming year to my clients

  Background:
    Given I login as a "account manager"
    And I have a group with census

  @blocker @stepsAdded
  Scenario: Create a proposal with a quote
    And I have a quote created for product:
      | Dental |
    When I start creating new proposal
    And I add my quotes to a new proposal:
      | <dental quote name> |
    And I generate new PDF proposal
    And I save new PDF proposal
    Then New proposal should be successfully created

  Scenario: Create a proposal with multiple quotes
    And I have a quote created for product:
      | Dental |
    When I start creating new proposal
    And I add my quotes to a new proposal:
      | <dental quote name>  |
      | <medical quote name> |
      | <vision quote name>  |
    And I generate new PDF proposal
    And I save new PDF proposal
    Then New proposal should be successfully created

  Scenario: Create a proposal quotes of multiple product lines
    And I have a quote created for product:
      | Dental  |
      | Medical |
    When I start creating new proposal
    And I add my quotes to a new proposal:
      | <dental quote name>  |
      | <medical quote name> |
    And I generate new PDF proposal
    And I save new PDF proposal
    Then New proposal should be successfully created

  Scenario: Create a proposal with an out-of-date quote
    And I have a quote created for product with an out-of-date:
      | Dental |
    When I start creating new proposal
    And I add my quotes to a new proposal:
      | <dental quote name>  |
      | <medical quote name> |
      | <vision quote name>  |
    And I generate new PDF proposal
    And I save new PDF proposal
    Then New proposal should be successfully created

  Scenario: Create a proposal with a benefit-comparison quote
    And I have a quote created for product with a benefit-comparison:
      | Dental |
    When I start creating new proposal
    And I add my quotes to a new proposal:
      | <dental quote name>  |
      | <medical quote name> |
      | <vision quote name>  |
    And I generate new PDF proposal
    And I save new PDF proposal
    Then New proposal should be successfully created

  Scenario: Create a proposal with current and renewal quotes
    And I have a quote created for product with a current and renewal:
      | Dental |
    When I start creating new proposal
    And I add my quotes to a new proposal:
      | <dental quote name>  |
      | <medical quote name> |
      | <vision quote name>  |
    And I generate new PDF proposal
    And I save new PDF proposal
    Then New proposal should be successfully created
