@principal @quotes @selectingPlans @updateVisualElementsOfSelectPlans @wip
Feature: Update Visual Elements Of Select Plans
  As a Requester
  I want to see sufficient information about plans on Select Plans page
  So that I can make desired selection of plans to include them into quotes

  Background:
    Given I login as a "Requester"
    And I have a group with census

  Scenario: "Show Plan Summary" button should display a right-handed summary card (list of benefits) for a corresponding plan

  Scenario: "Show Class Descriptions" button should display the list of classes for the selected product line

  @major
  Scenario: A set of selected classes displays for each custom plan. Class selection is read-only

  @critical
  Scenario: Product lines should be in the correct order
    When I create a custom plan for each of the product lines
    And continue with quotes creation
    Then products on Select Plans page should display in the correct order
      | product_line    |
      | Dental          |
      | Vision          |
      | Group Term Life |
      | VTL             |
      | STD             |
      | LTD             |
      | CI              |
      | Accident        |
