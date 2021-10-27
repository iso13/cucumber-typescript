@principal @groups @validateGroup @excludeProductsByState
Feature: Exclude Product Lines by Group State
  As a Requester
  I should not be able to select product lines that are unavailable for groups of specific states and with certain number of eligible employees
  So my quotes are accurate and I don't do excessive work which will be declined eventually

  Background:
    Given I login as a "Requester"
    And start creating new group

  @critical
  Scenario Outline: Allow user to select Critical Illness product line in <state>, if group has at least minimum required number of eligible employees (<number_of>)
    When I input ZIP code <ZIP>
    And I input <number_of> eligible employees
    Then CI product should be available for selection
    Examples:
      | number_of | ZIP   | state   |
      | 50        | 32818 | Florida |
      | 51        | 05401 | Vermont |

  @critical
  Scenario: Exclude Critical Illness product line from available products in vermont, if group doesn't have 50 employees
    When I input ZIP code "05402"
    And I input 50 eligible employees
    Then CI product should not be available for selection

  @major
  Scenario: Exclude Dental product line from available products in MT
    When I input ZIP code 59710
    Then Dental product should not be available for selection
