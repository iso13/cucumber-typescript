@principal @planDesigner @planValidations @validateDependenciesForDental @wip
Feature: Validate Dependencies For Dental
  As a Requester
  I need to see the available benefits in Plan Designer
  So that I can setup my Dental Plan and quote it correctly

  Background:
    Given I login as a "Requester"

  Scenario: Benefits limitations for SIC code 8021
    When I populate all group profile fields with valid data
    And I populate group profile "Zip Code" field with "90003"
    And I populate group profile "SIC Code" field with "8021"
    Then the "<benefitName>" benefit of "Dental" plan design should be "less than or equal to" "<value>"
      | benefitName                                      | value |
      | EPO Basic Coinsurance                            | 90%   |
      | EPO Major Coinsurance                            | 60%   |
      | EPO Maximum All Units Except Orthodontia         | $1500 |
      | EPO Orthodontia Lifetime Maximum                 | $1500 |
      | In-network Basic Coinsurance                     | 90%   |
      | In-network Major Coinsurance                     | 60%   |
      | In-network Maximum All Units Except Orthodontia  | $1500 |
      | In-network Orthodontia Lifetime Maximum          | $1500 |
      | Non-network Basic Coinsurance                    | 90%   |
      | Non-network Major Coinsurance                    | 60%   |
      | Non-network Maximum All Units Except Orthodontia | $1500 |
      | Non-network Orthodontia Lifetime Maximum         | $1500 |

  Scenario: Dental product line has 5 benefit plan designs for CA groups
    And I have a group with census created with
      | group_data     | census_data         |
      | i have a group | Tmpl_14EEs_4cl.xlsx |
    When I start creating new Dental custom plan
    Then "Benefit Design Type" benefit should have following options available for selection:
      | PPO Dental-Unscheduled/UCR               |
      | PPO Dental-Scheduled Fee/MAC             |
      | EPO                                      |
      | Point-of-Service (POS)-Unscheduled/UCR   |
      | Point-of-Service (POS)-Scheduled Fee/MAC |

  Scenario: Dental product line has 2 benefit plan designs for groups outside of CA
    And I have a group with census created with
      | group_data          | census_data         |
      | Group WA 3571 50 DV | Tmpl_14EEs_4cl.xlsx |
    When I start creating new Dental custom plan
    Then "Benefit Design Type" benefit should have following options available for selection:
      | PPO Dental-Unscheduled/UCR   |
      | PPO Dental-Scheduled Fee/MAC |

  Scenario: Dental 'Participation Percent' benefit displays for voluntary plan in WA state
    And I have a group with census created with
      | group_data          | census_data         |
      | Group_WA_3571_51_DV | Tmpl_14EEs_4cl.xlsx |
    When I populate all fields for Dental custom plan
      | dental voluntary plan 1 |
    Then the "Participation Percent" benefit of "Dental" plan design should be set to "60%"

  Scenario: Dental 'Participation Percent' benefit is hidden for non-voluntary plan in WA state
    And I have a group with census created with
      | group_data          | census_data         |
      | Group_WA_3571_51_DV | Tmpl_14EEs_4cl.xlsx |
    When I populate all fields for Dental custom plan
      | dental plan 1 |
    Then the "Participation Percent" benefit of "Dental" plan design should be hidden

  Scenario: Dental 'Participation Percent' benefit is hidden outside of WA state
    And I have a group
    When I populate all fields for Dental custom plan
      | dental  plan 1          |
    Then the "Participation Percent" benefit of "Dental" plan design should be hidden
