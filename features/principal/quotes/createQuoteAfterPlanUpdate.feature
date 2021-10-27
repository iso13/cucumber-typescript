@principal @quotes @quoteCards @createQuoteAfterPlanUpdate @critical @QUOTE-367 @quote @wip
Feature: Create Quote After Plan Updated
  As a Requester
  I should be able to create a valid quote for a plan, that has been edited,
  So that the quote reflects the latest changes

  Scenario: Create a dental quote based on updated plan
    Given I login as a "Requester"
    And I have a group with census created with
      | group_data         | census_data             |
      | Group_CA_3571_10_D | Template_10EEs_1cl.xlsx |
    And I create new custom plan:
      | dental plan EPO 100 80 50 |
    When I select the preset "PPO: 100/80/50, $1000, 90th, Ortho"
    And I save a custom plan
    And I create a quote based on the custom plans
    Then On "dental plan EPO 100 80 50" quote summary card I should be able to see the "4-tier rates"
