@planDesigner @searchPlanDesignBenefit @cami
Feature: Search Plan Design Benefit
  As a User
  I want to be able to search for a benefit for any plan design
  So that I can view, set or update its value easily

  * If "Show Errors" benefit view mode is enabled search returns results for erroneous benefits only
  * After search has been performed and the field is cleared, all benefits display again
  * Search field is getting cleared, when user starts another plan creation

  Scenario: Search returns results for both Basic and Detailed benefits
    Given I login as a "userRole"
    And I have existing plans
    When I search for the following plans "plan_search"
    Then I should see a list of plans
