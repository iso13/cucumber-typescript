@principal @planDesigner @deleteCustomPlans @critical @quote
Feature: Delete Custom Plans
  As a Requester
  I need the ability to delete plans
  So that I can remove plans that are no longer needed

  Background:
    Given I login as a "Requester"

  Scenario Outline: Delete previously saved plan for <product> product line
    And I have a custom plan created
      | <plan> |
    When I delete the custom plan
    Then the custom plan should be removed successfully
    Examples:
      | product          | plan            |
      | VTL              | vtl plan 1      |
      #| Dental           | dental plan 1   |
      | Critical Illness | ci plan 1       |
      | Accident         | accident plan 1 |

  @wip
  Scenario: Locked plans can not be deleted
