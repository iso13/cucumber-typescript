@principal @quotes @createProductQuotes @quote
Feature: Create Product Quotes
  As a Requester
  I want to be able to create quotes based on custom plans
  So that I can add my custom quotes to proposals and sell them to clients

  Background:
    Given I login as a "Requester"

  @blocker @PFG-1407 @PFG-1408 @PFG-1475 @QUOTE-339 @QUOTE-367 @PFG-1504 @QUOTE-385
  Scenario Outline: Create a successful <product> quote
    And I have a custom plan created
      | <custom plan> |
    When I create a quote based on the custom plan
    Then A quote for the selected plan should be successfully created
    Examples:
      | product               | custom plan                    |
      | VTL                   | vtl plan 1                     |
      #| Dental                | dental plan 1                  |
      | Accident              | accident plan 1                |
      | Critical Illness      | ci plan 1                      |
      | Group Term Life       | gtl plan 1 mvp2                |
      | Vision                | mcv plan non contributory mvp2 |
      | Long-Term Disability  | ltd mvp2 plan 1                |

    @wip
    Examples:
      | product               | custom plan                    |
      | Short-Term Disability | std mvp2 plan 1                |

  @wip
  Scenario: Create a single quote containing single custom plan

  @critical
  Scenario: Create multiple quotes each containing single custom plan (Multiple Quotes checkbox)
    And I have a group with census
    And I create few custom plans:
      | vtl plan 1      |
      #| dental plan 1   |
      | accident plan 1 |
    When I create new quotes based on the custom plans
    Then every plan should have corresponding quote created

  @critical
  Scenario: Plans included on quotes should become locked
    And I have a group with census
    And I create few custom plans:
      | vtl plan 1      |
      #| dental plan 1   |
      | accident plan 1 |
    When I create new quotes based on the custom plans
    Then every plan should have corresponding quote created
    And each of the quoted plans should be locked
