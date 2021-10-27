@principal @reviewLTDPlanDesign @planDesigner
Feature: Review LTD Plan Design
  As a Requester
  I want to be able to see correct set of benefits and set values for them
  So I can setup my LTD custom plan for further quoting

  Background:
    Given I login as a "Requester"

  Scenario: Plan design should have a correct set of benefits

  @critical @PFG-1384 @Quote-381
  Scenario: Plan should display the correct set of benefit values on a saved plan
    When I have a custom plan created
      | ltd mvp2 plan 2 |
    And I navigate back to "plans" page
    And I review the "Valid LTD MVP2 plan" saved plan
    Then "Flat" option should be selected in "commission_type" field
    And "Voluntary" option should be selected in "contribution_type" field

  @wip
  Scenario: All benefits should be represented with a correct control (have correct type and format)

  @wip
  Scenario: All benefits should have correct set of available values

  @wip
  Scenario: All benefits should display in the precise/defined order

  @wip
  Scenario: Plan design should have correct set of Basic benefits

  @wip
  Scenario: Plan design should have correct set of Detailed benefits

  @wip
  Scenario: All benefits should have correct default/readable values

  @wip
  Scenario: Dependency logic for all benefits should apply correctly
  #description for the scenario is too generic though

  @wip
  Scenario: Benefit presets should be available to configure new plan easily
