@principal @reviewGTLPlanDesign @planDesigner
Feature: Review GTL Plan Design
  As a Requester
  I want to be able to see correct set of benefits and set values for them
  So I can setup my GTL custom plan for further quoting

  @wip
  Scenario: Plan design should have a correct set of benefits

  @critical
  Scenario Outline: Plan should display the correct set of benefit values on a saved plan
    Given I login as a "gfs_level1"
    When I have a custom plan created
      | <plans> |
    And I navigate back to "plans" page
    And I review the "GTL Contributory_MVP2 plan" saved plan
    Then plan should display correct set of benefit values for the "<reviewSavedPlans>"
    Examples:
      | plans                      | reviewSavedPlans                    |
      | gtl plan contributory mvp2 | gtl mvp2 review saved plan benefits |

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
