@core @createCustomPlans @planDesigner @wip
Feature: Create Custom Plans
  As a Broker
  I want the ability to create custom plans
  So I can replicate published carrier plans and sell them to my clients

  Background:
    Given I login as a "Broker"
    And I have a group and census
    And I navigate to the plan designer of "Group A"

  @critical @jorge
  Scenario: Create a life plan and save the plan
    And I add a custom life plan
    When I add life volume "100,000" and rate "50"
    And I save the dental plan as "Life Plan 1"
    Then "Life Plan 1" should be saved successfully

  @critical @jorge
  Scenario: Create a medical plan and save the plan
    And I add a custom medical plan
    When I add 4 tier rates "100,200,300,400"
    And I save the medical plan as "Medical Plan 1"
    Then "Medical Plan 1" should be saved successfully

  @critical @jorge
  Scenario: Create a dental plan and save the plan
    And I add a custom dental plan
    When I add 4 tier rates "100,200,300,400"
    And I save the dental plan as "Dental Plan 1"
    Then "Dental Plan 1" should be saved successfully

  @critical @jorge
  Scenario: Create a vision plan and save the plan
    And I add a custom vision plan
    When I add 3 tier rates "100,200,300"
    And I save the dental plan as "Vision Plan 1"
    Then "Vision Plan 1" should be saved successfully

  Scenario: A plan must have a plan name and can not be created unless all benefits have been set as well as rates and a carrier

  Scenario: Saved plans should be stored on the left hand side of plan designer with a saved icon beside the plan name

  Scenario: Plans created but not saved should not have a saved icon and I should be prompted to save the plan when leaving the page
