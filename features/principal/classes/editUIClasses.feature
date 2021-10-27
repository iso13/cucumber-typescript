@principal @classes @editUIClasses @wip
Feature: Edit UI Classes
  As a Requester
  I want to see all the product lines with assigned classes and be able to manage them
  So that I can create plans and quotes for specifed groups of employees

  Background:
    Given I login as a "Requester"
    And I have a group with census

  Scenario: Product lines should be in the correct order
    Then products on Classes page should display in the correct order
      | Dental          |
      | Vision          |
      | Group Term Life |
      | VTL             |
      | STD             |
      | LTD             |
      | CI              |
      | Accident        |

  Scenario: TBD
