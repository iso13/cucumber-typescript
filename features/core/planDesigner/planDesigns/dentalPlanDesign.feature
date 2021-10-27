@core @dentalPlanDesign @planDesigner @wip
Feature: Dental plan design
  As a Broker
  I want to have plan designs for dental
  So that I can create plans similar to published plans

  Background:
    Given I login as a "Broker"
    And I have a group and census
    And I navigate to the plan designer of "Group A"

  @critical @diego
  Scenario: Dental plan designs should have all the benefits and benefit types I need to create plans similar to published plans on the market
    When I add a custom dental plan
    Then "Dental plan design benefits" should be displayed and configurable

  Scenario: Benefit presets should be available to easily configure new dental plans
