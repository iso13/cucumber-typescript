@trinet @defaultBenefitProgram @fernando
Feature: Set Default Benefit Program
  As a Carrier Admin
  I need to be able to work with default benefit programs created during the creation of a group
  So that the members of my group can be mapped if no benefit programs have been added during the creation of the group

  Background:
    Given I login as a "carrier_admin"
    And I create a new group with "create quote group" and owner as "Josh Broker"

  @wip @critical
  Scenario: Default benefit program is present for all the product lines enabled in the group

  @blocker @MSTR-1984
  Scenario: Default benefit program number should be 1
    When I upload a census "TRINET_Exchange_II_XI" selecting "Exchange II / XI RFP Template File" as template type and save and continue
    Then Default benefit program number should be "1"

  @wip
  Scenario: Default benefit program description should be labeled as "All Active Full Time Employees"

  @wip @critical
  Scenario: Benefit program number assigned by default should be the minimum benefit program number available between 1 and 999

  @blocker @MSTR-1984
  Scenario: By default all members on census should be assigned to the default benefit program
    When I upload a census "TRINET_Exchange_II_XI" selecting "Exchange II / XI RFP Template File" as template type and save and continue
    And I accept default benefit program
    And I click "Benefit Program" on Census
    Then By default all members on census should be assigned to the default benefit program

  @wip
  Scenario: By default columns in "All Benefit Types" section should be displayed in the following order (Number, Description, WSE)
