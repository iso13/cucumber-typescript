@principal @planDesigner @searchBenefit @wip
Feature: Search Benefit
  As a Requester
  I want to be able to search for a benefit for any plan design
  So that I can view, set or update its value easily

  Background:
    Given I login as a "Requester"
    And I have a group with census

  @major
  Scenario: Search returns results for both Basic and Detailed benefits
    When I start creating new "Vision" plan
    And I search for a benefit by putting "allowance" into Search field
    Then I should be able to see the following benefits displayed:
      | Frames Maximum Allowance  |
      | Contact Maximum Allowance |

  @critical
  Scenario: If "Show Errors" benefit view mode is enabled search returns results for erroneous benefits only
    When I start creating new "Dental" plan
    And I switch to Show Errors display mode
    And I search for a benefit by putting "coverage" into Search field
    Then I should be able to see the following benefits displayed:
      | Coverage Level |
      | Prior Coverage |
    But I should not be able to see following benefit displayed:
      | Orthodontia Coverage |

  Scenario: After search has been performed and the field is cleared, all benefits display again
    When I start creating new "Vision" plan
    And I search for a benefit by putting "allowance" into Search field
    And I clear the Search field
    Then I should be able to see basic "Vision" benefits

  Scenario: Search field is getting cleared, when user starts another plan creation
    When I start creating new "Vision" plan
    And I search for a benefit by putting "allowance" into Search field
    And I start creating new "Vision" plan
    Then Search field should be cleared
    And I should be able to see basic "Vision" benefits

  Scenario: Search field is getting cleared, when user selects another plan to view
    When I have a "Dental" custom plan
    And I start creating new "Vision" plan
    And I search for a benefit by putting "allowance" into Search field
    And I select "Dental" custom plan to view
      | customDental.json |
    Then Search field should be cleared
    And I should be able to see basic "Dental" benefits
