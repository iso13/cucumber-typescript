@editPublishPlans @planlibrary @adp @cami
Feature: Edit Publish Plans
  As a User
  I want the ability to edit publish custom plans
  So I can make changes based on projects needs

  Background:
    Given I login as a "userRole"
    And I have an existing plan for "<product>"

  Scenario Outline: Update published plan information for <product>
    When I update the published custom plan information
    Then I should see the updated information for "<product>"
    Examples:
      | product |
      | Medical |
      | Dental  |
      | Vision  |
      | Life    |

  Scenario Outline: Delete custom published plans for <product>
    When I delete the custom published plan
    Then I should no longer see the custom published plan for "<product>"
    Examples:
      | product |
      | Medical |
      | Dental  |
      | Vision  |
      | Life    |

  Scenario Outline: Duplicate custom publied plans for <product>
    When I duplicate the custom published plan
    Then I should no longer see the custom published plan for "<product>"
    Examples:
      | product |
      | Medical |
      | Dental  |
      | Vision  |
      | Life    |
