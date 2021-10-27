@consolidatedQuoting @filterPlans @poorna @wip
Feature: Filter Plans
  As a Carrier Admin
  I need to have ability to filter plans
  So I can see list of filterd plans

  Scenario Outline: Validate the ability of filtering
    Given I login as a "Carrier Admin"
    And I create a new group
    And I create a new proposal
    When I select to filter by "<Filter Criteria>"
    Then plans should be filtered by "<Filter Criteria>"

    Examples:
      | Filter Criteria |
      | names           |
      | percentage      |
      | dollar amount   |
