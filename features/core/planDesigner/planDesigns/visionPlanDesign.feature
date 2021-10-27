@core @visionPlanDesign @planDesigner @wip
Feature: Vision plan design
  As a Broker
  I want to have plan designs for vision
  So that I can create plans similar to published plans

  Background:
    Given I login as a "Broker"
    And I have a group and census
    And I navigate to the plan designer of "Group A"

  @critical @diego
  Scenario: Vision plan designs should have all the benefits and benefit types I need to create plans similar to published plans on the market
    When I add a custom vision plan
    Then "Vision plan design benefits" should be displayed and configurable

  Scenario: Benefits presets should be available to easily configure new vision plans
