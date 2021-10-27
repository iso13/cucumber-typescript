@principal @reviewMCVPlanDesign @planDesigner @critical @quote
Feature: Review MCV Plan Design
  As a Requester
  I want to be able to see correct set of benefits and set values for them
  So I can setup my Managed Care Vision custom plan for further quoting

  Background:
    Given I login as a "Requester"

  @QUOTE-450
  Scenario: Plan design should have a correct set of benefits
    When I have a custom plan created
      | mcv plan 1 voluntary |
    And I navigate back to "plans" page
    And I review the "MCV Voluntary Plan" saved plan
    Then "Voluntary" option should be selected in "contribution" field

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
