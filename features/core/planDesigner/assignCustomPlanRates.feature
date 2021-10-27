@core @assignCustomPlanRates @planDesigner @serviceLayer @wip
Feature: Assign custom plan rates
  As a Broker
  I want the ability to assign rates to my custom plans
  So that I can replicate published plans for sale to clients

  Background:
    Given I login as a "Broker"
    And I have a group and census
    And I navigate to the profile of "Group A"

  Scenario: Assign 4 tier rates to a dental plan

  Scenario: Assign 3 tier rates to a dental plan

  Scenario: Assign 4 tier rates to a vision plan

  Scenario: Assign 3 tier rates to a vision plan

  Scenario: Assign 4 tier rates to a medical plan

  Scenario: Assign a life rate with "Employee Basic Life per $1,000." This should include AD&D

  Scenario: Assign a life rate with "Employee Basic Life per $1,000" and add a separate AD&D rate

  Scenario: Assign and calculate ACA Age-Rates for medical 2017 in Oregon

  Scenario: Assign and calculate ACA Age-rates for medical 2018 in Oregon

  Scenario: Assign and calculate ACA Age-rates for medical 2019 in Oregon

  Scenario: Assign and calculate ACA Age-rates for medical 2017 in a default state
    And I update "Group A" data with "default state data"
    And I navigate to the plan designer of "Group A"
    When I add a custom medical plan
    And I set age banded rates for 2017
    And I set age 21 with rate 25.12
    Then Rate per age should be calculated based on the "default age band curve"

  Scenario: Assign and calculate ACA Age-rates for medical 2018 in a default state

  Scenario: Assign and calculate ACA Age-rates for medical 2019 in a default state

  Scenario: Assign and calculate ACA Age-rates for medical 2017 in Utah
    And I update "Group A" data with "Utah state data"
    And I navigate to the plan designer of "Group A"
    When I add a custom medical plan
    And I set age banded rates for 2017
    And I set age 50 with rate 100
    Then Rate per age should be calculated based on the "Utah age band curve"

  Scenario: Assign and calculate ACA Age-rates for medical 2018 in Utah

  Scenario: Assign and calculate ACA Age-rates for medical 2019 in Utah

  Scenario: Assign and calculate ACA Age-rates for medical 2017 in Minnesota

  Scenario: Assign and calculate ACA Age-rates for medical 2018 in Minnesota

  Scenario: Assign and calculate ACA Age-rates for medical 2019 in Minnesota

  Scenario: Assign and calculate ACA Age-rates for medical 2017 in Massachusetts

  Scenario: Assign and calculate ACA Age-rates for medical 2018 in Massachusetts

  Scenario: Assign and calculate ACA Age-rates for medical 2019 in Massachusetts

  Scenario: Assign and calculate ACA Age-rates for medical 2017 in DC

  Scenario: Assign and calculate ACA Age-rates for medical 2018 in DC

  Scenario: Assign and calculate ACA Age-rates for medical 2019 in DC

  Scenario: Assign and calculate ACA Age-rates for medical 2017 in New Jersey

  Scenario: Assign and calculate ACA Age-rates for medical 2018 in New Jersey

  Scenario: Assign and calculate ACA Age-rates for medical 2019 in New Jersey
