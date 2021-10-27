@quote @createCustomPlanQuotes @cami
Feature: Create Quotes with Custom Plans
  As a User
  I want to be able to create quotes based on custom plans
  So that I can add my custom quotes to proposals and sell them to clients

  Background:
    Given I login as an "account manager"
    And I have a group with census

  @blocker @stepsAdded
  Scenario: Create a single quote containing single custom plan
    And I create new 'Dental' custom plan:
      | benefit_name | benefit_value |
      |              |               |
    When I select following plan for quoting:
      | <plan name> |
    And I proceed with selected contributions
    And I save the quote
    Then a quote named '<quote name>' should be successfully created

  @blocker @stepsAdded
  Scenario: Create multiple quotes each containing multiple custom plans for different product lines
    And I create new 'Dental' custom plan:
      | benefit_name                             | benefit_value |
      | Voluntary                                | No            |
      | Benefit Design Type                      | EPO           |
      | Prior Coverage                           | None          |
      | EPO Major Coinsurance                    | 80%           |
      | EPO Maximum All Units Except Orthodontia | $1,200        |
    And I create new 'Dental' custom plan:
      | benefit_name        | benefit_value                          |
      | Voluntary           | No                                     |
      | Benefit Design Type | Point-of-Service (POS)-Unscheduled/UCR |
      | Prior Coverage      | Preventive, Basic & Major              |
    And I create new 'Vision' custom plan:
      | benefit_name   | benefit_value                                 |
      | Prior Coverage | Prior Contributory or Non-Contributory Vision |
    And I create new 'Group Term Life' custom plan:
      | benefit_name      | benefit_value     |
      | Prior Coverage    | No Prior Coverage |
      | Flat Life Benefit | $15,000           |
    And I create new 'Group Term Life' custom plan:
      | benefit_name      | benefit_value |
      | Prior Coverage    | Unknown       |
      | Flat Life Benefit | $17,550       |
    And I create new 'Group Term Life' custom plan:
      | benefit_name      | benefit_value                                          |
      | Prior Coverage    | Group has current coverage and entered eligible census |
      | Flat Life Benefit | $35,000                                                |
    When I start generating quotes
    And I select following plans for quoting:
      | Dental 1          |
      | Dental 2          |
      | Vision 1          |
      | Group Term Life 1 |
      | Group Term Life 2 |
      | Group Term Life 3 |
    Then exactly '3' quotes should be successfully created
    And a quote named '<dental quote name>' should be successfully created
    And a quote named '<vision quote name>' should be successfully created
    And a quote named '<life quote name>' should be successfully created

  @critical
  Scenario: Create a single quote containing multiple custom plans of the same product line
    And I create new 'Dental' custom plan:
      | benefit_name | benefit_value |
      |              |               |
    When I select following plan for quoting:
      | <plan name> |
    And I proceed with selected contributions
    And I save the quote
    Then a quote named '<quote name>' should be successfully created

  @critical
  Scenario: Create multiple quotes each containing single custom plan (Multiple Quotes checkbox)
    And I create new 'Dental' custom plan:
      | benefit_name                             | benefit_value |
      | Voluntary                                | No            |
      | Benefit Design Type                      | EPO           |
      | Prior Coverage                           | None          |
      | EPO Major Coinsurance                    | 80%           |
      | EPO Maximum All Units Except Orthodontia | $1,200        |
    And I create new 'Dental' custom plan:
      | benefit_name        | benefit_value                          |
      | Voluntary           | No                                     |
      | Benefit Design Type | Point-of-Service (POS)-Unscheduled/UCR |
      | Prior Coverage      | Preventive, Basic & Major              |
    And I create new 'Vision' custom plan:
      | benefit_name   | benefit_value                                 |
      | Prior Coverage | Prior Contributory or Non-Contributory Vision |
    And I create new 'Group Term Life' custom plan:
      | benefit_name      | benefit_value     |
      | Prior Coverage    | No Prior Coverage |
      | Flat Life Benefit | $15,000           |
    And I create new 'Group Term Life' custom plan:
      | benefit_name      | benefit_value |
      | Prior Coverage    | Unknown       |
      | Flat Life Benefit | $17,550       |
    And I create new 'Group Term Life' custom plan:
      | benefit_name      | benefit_value                                          |
      | Prior Coverage    | Group has current coverage and entered eligible census |
      | Flat Life Benefit | $35,000                                                |
    When I start generating quotes
    And I select following plans for quoting:
      | Dental 1          |
      | Dental 2          |
      | Vision 1          |
      | Group Term Life 1 |
      | Group Term Life 2 |
      | Group Term Life 3 |
    Then exactly '3' quotes should be successfully created
    And a quote named '<dental quote name>' should be successfully created
    And a quote named '<vision quote name>' should be successfully created
    And a quote named '<life quote name>' should be successfully created

  @critical
  Scenario: Plans included on quotes should become locked
    When I have plan that has quotes
    Then the plan should be locked
