@consolidatedQuoting @sortPlansView @poorna @wip
Feature: Sort Plans View
  As a Carrier Admin
  I need to have ability to sort plan listing
  so I can see on the screen without scrolling

  Background:
    Given I login as a "Carrier Admin"
    And I create a new group
    And I create a new proposal

  Scenario: Validate sorting of plans ascending
    When I sort plans ascending
    Then plans are sorted in ascending order

  Scenario: Validate sorting of plans descending
    When I sort plans descending
    Then plans are sorted in descending order
