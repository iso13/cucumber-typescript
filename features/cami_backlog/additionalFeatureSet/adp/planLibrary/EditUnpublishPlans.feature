@editUnpublishPlans @planlibrary @adp @cami
Feature: Edit Unpublish Plans
  As a User
  I want the ability to edit un-published custom plans
  So I can make changes based on projects needs

  Scenario Outline: Edit un-published plan information for <product> plan
    Given I login as a "user"
    And I have an un-published plan
    When I edit the plan for each "<product>"
    Then I should see changes updated it the plan
    Examples:
      | product |
      | medical |
      | dental  |
      | vision  |
      | life    |

  Scenario: Delete un-published plan
    Given I login as a "userRole"
    And I have an un-published plan
    When I delete the un-published plan
    Then I should no longer see the un-published plan

  Scenario: Plans can be duplicated
    Given I login as a "userRole"
    And I have an un-published plan
    When I duplicate the un-published plan
    Then I should see a copy of the plan

  Scenario: Plans can be publish
    Given I login as a "userRole"
    And I have an un-published plan
    When I publish the un-published plan
    Then the plan can be used for quoting
