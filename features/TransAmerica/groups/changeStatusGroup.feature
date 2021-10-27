@transamerica @groups @changestatusgroup @critical @wip
Feature: Change status group
  As a Underwriter
  I need to be able to update status groups
  So I can see the new status

  Scenario Outline: Change Status Group with UW and internal_whole_sale Role
    Given I login as a "<role>"
    When I look for group and open its Actions "<group>"
    And I update the status to "<status>"
    Then I can see the new status to the group "<group>" and "<status>"
    Examples:
      | role                | group            | status           |
      | underwriter         | Automation Group | Release to Sales |
      | internal_whole_sale | Automation Group | Release to UW    |
