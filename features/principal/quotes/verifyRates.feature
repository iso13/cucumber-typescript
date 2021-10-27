@principal @quotes @GTC @verifyRates @wip
Feature: Verify Rates
  As an Actuary
  I want to verify the quoted rates, volumes and total costs
  So that I can ensure the quoting calculations are correct

  Comments:
    1. Every test case is a collection of:
    - group data
    - census data
    - plan benefits (plan data)
    - expected calcualted parameters (rates, volumes and total costs)
    2. All that data is provided by client in Excel spreadsheets.
    Currently (10/10/2019) for Principal we have 2 excel files for Dental and
    all other (7) product lines, which gives us about 800 test cases (GTCs) in total
    3. Scenario below is product agnostic and represents the generic (!) workflow for rates testing.
    That workflow can slightly differ from product to product

  Scenario: Verify rates (execute Golden Test Case)
    Given I login as a "Requester"
    And I have a group with census created with
      | group_data           | census_data           |
      | test case group data | test case census data |
    And I have a custom plan created
      | test case plan |
    When I create a quote based on the custom plan
    Then On "test case plan" quote summary card I should be able to see the "calculated parameters"
