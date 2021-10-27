@principal @groups @newGroupPageUI
Feature: New Group Page UI/UX
  As a Requester
  I need the New Group page to provide such user experience
  So that I can create my groups more efficiently

  Background:
    Given I login as a "Requester"
    And start creating new group

  @critical
  Scenario: New Group page location fields get autopopulated for a valid ZIP code
    When I input ZIP code "94040"
    Then city, state and county fields get filled in with "Mountain View", "CA" and "Santa Clara" values

  @critical
  Scenario Outline: New Group page allows to select a county for the multy-county "<ZIP>" ZIP code
    When I input ZIP code "<ZIP>"
    Then the "Select County" dialog pops up
    And Select County dropdown has "<counties>" counties available for selection
    Examples:
      | ZIP   | counties                 |
      | 78942 | Bastrop, Fayette, Lee    |
      | 60548 | Dekalb, Kendall, Lasalle |

  @wip
  Scenario: New Group page has a precise display order of product lines
    Then products on Group Profile should display in the correct order
      | Dental          |
      | Vision          |
      | Group Term Life |
      | VTL             |
      | STD             |
      | LTD             |
      | CI              |
      | Accident        |
