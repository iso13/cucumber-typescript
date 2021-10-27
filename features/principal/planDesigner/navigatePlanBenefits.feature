@principal @planDesigner @navigatePlanBenefits @wip
Feature: Navigate Plan Benefits
  As a Requester
  I want to be able to navigate through available benefits for any plan design
  So it's easier to find the benefit I need, or the one, that requires some action

  Background:
    Given I login as a "Requester"
    And I have a group with census

  Scenario: "Detailed Benefits" button displays by default, if all benefits have valid values
    When I start creating new "GTL" plan
    Then I should be able to see basic "GTL" benefits
    And I should be able to see Detailed Benefits button at the bottom of the page

  @major
  Scenario: "Show Errors" button displays by default, if some benefits require action to be taken
    When I start creating new "Vision" plan
    Then I should be able to see Show Errors button at the bottom of the page

  @critical
  Scenario: Show all (both basic and detailed) benefits of a plan
    When I start creating new "GTL" plan
    And I switch to Detailed Benefits display mode
    Then I should be able to see all "GTL" benefits

  Scenario: Show Basic benefits of a plan
    When I start creating new "GTL" plan
    And I switch to Detailed Benefits display mode
    And I switch to Basic Benefits display mode
    Then I should be able to see basic "GTL" benefits

  @critical
  Scenario Outline: Show <product> plan design benefits, that require action to be taken
    When I start creating new <product> plan
    And I switch to Show Errors display mode
    Then I should be able to see <benefits> displayed
    Examples:
      | product | benefits                                                               |
      | Dental  | "Voluntary", "Benefit Design Type", "Coverage Level", "Prior Coverage" |
      | Vision  | Prior Coverage                                                         |

  Scenario: "Show Errors" mode displays both basic and detailed invalidated benefits

  Scenario: When no invalid benefits left, benefit view mode switches to "Basic Benefits"
    When I start creating new "Vision" plan
    And I switch to Show Errors display mode
    And I set "No Prior Coverage" value for the "Prior Coverage" benefit
    Then I should be able to see Detailed Benefits button at the bottom of the page
    And I should be able to see basic "Vision" benefits

  @major
  Scenario: When no invalid benefits left, "Show Errors" button doesn't show up anymore
    When I start creating new "Vision" plan
    And I switch to Show Errors display mode
    And I set "No Prior Coverage" value for the "Prior Coverage" benefit
    And I switch to Detailed Benefits display mode
    And I switch to Basic Benefits display mode
    Then I should be able to see Detailed Benefits button at the bottom of the page again
