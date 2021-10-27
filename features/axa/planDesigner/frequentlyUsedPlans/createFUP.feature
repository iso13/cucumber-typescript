@axa @createFUP @fup
Feature: Create FUP
  As an Underwriter
  I want to create frequently used plans
  So that I can save time and reuse common custom plans across groups

  Background:
    Given I login as an "Underwriter"
    And I am on plan design
      | template_type |
      | AXA Census    |

  @wip
  Scenario: Newly added plans should be displayed at the top of the frequently used plans list

  @wip
  Scenario: Newly added plans should be available to all groups and not just the group the plan was created in

  @wip
  Scenario: Plans that are not valid (missing benefits, rates etc..) can not be added to the frequently used plans list

  @blocker
  Scenario: Add a Dental, Vision, Basic Life, STD, LTD, Supplemental Life, Voluntary Life plan to frequently used plans
    When I add FUP plan for
      | custom dental quote data   |
      | custom vision quote data   |
      | custom life quote data     |
      | custom std quote data      |
      | custom ltd quote data      |
      | custom supplife quote data |
      | custom vollife quote data  |
    Then FUP should added successfully
      | custom dental quote data   |
      | custom vision quote data   |
      | custom life quote data     |
      | custom std quote data      |
      | custom ltd quote data      |
      | custom supplife quote data |
      | custom vollife quote data  |
