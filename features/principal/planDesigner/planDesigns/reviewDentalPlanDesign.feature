@principal @reviewDentalPlanDesign @planDesigner @critical @wip
Feature: Review Dental Plan Design
  As a Requester
  I want to be able to see correct set of benefits and set values for them
  So I can setup my Dental custom plan for further quoting

  Background:
    Given I loging as a "Requester"

  Scenario: Plan design should have a correct set of benefits

  Scenario: All benefits should be represented with a correct control (have correct type and format)

  Scenario: All benefits should have correct set of available values

  Scenario: All benefits should display in the precise/defined order

  Scenario: Plan design should have correct set of Basic benefits

  Scenario: Plan design should have correct set of Detailed benefits

  Scenario: All benefits should have correct default/readable values

  Scenario: Dependency logic for all benefits should apply correctly
  #description for the scenario is too generic though

  Scenario: Benefit presets for WA small groups

  Scenario: Benefit presets for non-CA nor WA groups
    And I have a group with census created with
      | group_data            | census_data             |
      | Group_NY_3571_10_All  | Template_10EEs_1cl.xlsx |
    When I start creating new "Dental" plan
    Then I should be able to select one of the following presets:
      | preset                                                 |
      | In-100/80/50, $1000,Non-80/80/50, $1000, 80th          |
      | 100/80/50, $1000, 90th                                 |
      | In-100/90/60, $1500, Non-100/80/50, $1500, 90th UCR    |
      | 100/80/50, $1000, 90th, Ortho                          |
      | In-100/90/60, $1500, Non-100/80/50, $1500, 90th, Ortho |

  Scenario: Benefit presets for CA groups
    And I have a group with census created with
      | group_data          | census_data         |
      | Group_CA_3571_10_D  | Tmpl_14EEs_4cl.xlsx |
    When I start creating new "Dental" plan
    Then I should be able to select one of the following presets:
      | preset                                                        |
      | POS-100/80/50, $1500, 90th                                    |
      | POS-EPO-100/90/60, $1500, In/Non-100/80/50, $1500, 90th       |
      | POS-100/80/50, $1500, 90th, Ortho                             |
      | POS-EPO-100/90/60, $1500, In/Non-100/80/50, $1500, 90th, Otho |
      | EPO-100/80/50, $1500, 90th                                    |
      | EPO-100/80/50, $1500, 90th, Ortho                             |
      | In-100/80/50, $1000,Non-80/80/50, $1000, 80th                 |
      | 100/80/50, $1000, 90th                                        |
      | In-100/90/60, $1500, Non-100/80/50, $1500, 90th UCR           |
      | 100/80/50, $1000, 90th, Ortho                                 |
      | In-100/90/60, $1500, Non-100/80/50, $1500, 90th, Ortho        |
