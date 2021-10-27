@defaultClasses @quoteSquad @cami
Feature: Default Classes
  As a User
  I need to be able to work with default Classes created during the creation of a group
  So that the members of my group can be mapped if no Classes have been added during the creation of the group

  Scenario: New groups have classes created during census upload
    Given I login as a "userRole"
    When I have a group with census
    Then a default class is created

  Scenario Outline: Default classes are created for all product lines on the group
    Given I login as a "userRole"
    When I have a group with census with multiple <product> lines
    Then a default class is created for each product line
    Examples:
      | product |
      | Medical |
      | Dental  |
      | Health  |
      | Life    |

  Scenario: Members uploaded manually get assigned to default class
    When I manually upload members to a group
    Then members get assigned to the default class
