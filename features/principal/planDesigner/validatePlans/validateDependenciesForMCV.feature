@principal @planDesigner @planValidations @validateDependenciesForMCV @wip
Feature: Validate Dependencies For MCV
  As a Requester
  I need to see the available benefits in Plan Designer
  So that I can setup my MCV Plan and quote it correctly

  Background:
    Given I login as a "Requester"

  Scenario Outline: Set "Participation Percent" benefit value equal to <ben_value> for "<plan>" plan
    And I have a group with census created with
      | group_data     | census_data         |
      | I have a group | Tmpl_14EEs_4cl.xlsx |
    When I populate all fields for MCV custom plan "<plan>"
    Then the "Participation Percent" benefit of "MCV" plan design should be set to "<ben_value>"
    Examples:
      | plan                 | ben_value |
      | mcv plan 1           | 100%      |
      | mcv plan 1 voluntary | 50%       |

  Scenario Outline: Set "Employer Contribution" benefit value equal to <ben_value> for <plan> plan
    And I have a group with census created with
      | group_data     | census_data         |
      | I have a group | Tmpl_14EEs_4cl.xlsx |
    When I populate all fields for MCV custom plan "<plan>"
    Then the "Participation Percent" benefit of "MCV" plan design should be set to "<ben_value>"
    Examples:
      | plan                 | ben_value |
      | mcv plan 1           | 100%      |
      | mcv plan 1 voluntary | 0%        |
