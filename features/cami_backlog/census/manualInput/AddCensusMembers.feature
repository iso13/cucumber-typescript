@addCensusMembers @cami
Feature: Add Census Members
  As a User
  I need to be able to add members to my group's census
  So I can accurately quote a group for my client

  @critical
  Scenario: Add an employee with no dependent to census
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I manually add a member with the following data:
      | firstName | lastName | age | gender | coverageCodes | more? |
      | dummy     | member   | 33  | m      | EE            | ?     |
    Then the census should save successfully

  @critical
  Scenario: Add an employee with a single child dependent to census
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    And I manually add a member with the following data:
      | firstName | lastName | age | gender | coverageCodes | more? |
      | dummy     | member   | 33  | m      | EC            | ?     |
    When I manually add in a dependent of 'memberName' with the following data:
      | firstName | lastName  | age | gender | coverageCodes | more? |
      | dummy     | dependent | 5   | f      | CD            | ?     |
    Then the census should save successfully

  @critical
  Scenario: Add an employee with a spouse dependent to census
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    And I manually add a member with the following data:
      | firstName | lastName | age | gender | coverageCodes | more? |
      | dummy     | member   | 33  | m      | ES            | ?     |
    When I manually add in a dependent of 'memberName' with the following data:
      | firstName | lastName | age | gender | coverageCodes | more? |
      | dummy     | spouse   | 30  | f      | CS            | ?     |
    Then the census should save successfully

  @critical
  Scenario: Add a waived employee to census
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    And I manually add a member with the following data:
      | firstName | lastName | age | gender | coverageCodes | more? |
      | dummy     | member   | 33  | m      | WE            | ?     |
    Then the census should save successfully

  @critical
  Scenario: Add a non-eligible employee to census
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    And I manually add a member with the following data:
      | firstName | lastName | age | gender | coverageCodes | more? |
      | dummy     | member   | 33  | m      | NE            | ?     |
    Then the census should save successfully

  @critical
  Scenario: Add a employee with full time employment status to census
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    And I manually add a member with the following data:
      | firstName | lastName | age | gender | coverageCodes | employmentStatus |
      | dummy     | member   | 33  | m      | EE            | Full Time        |
    Then the census should save successfully

  @critical
  Scenario: Add a employee with part time employment status to census
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    And I manually add a member with the following data:
      | firstName | lastName | age | gender | coverageCodes | employmentStatus |
      | dummy     | member   | 33  | m      | EE            | Part Time        |
    Then the census should save successfully

  @critical
  Scenario: Add a employee with temp employment status to census
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    And I manually add a member with the following data:
      | firstName | lastName | age | gender | coverageCodes | employmentStatus |
      | dummy     | member   | 33  | m      | EE            | Temp             |
    Then the census should save successfully

  Scenario Outline: Add an employee with <census info> to census
    Given I login as a "userRole"
    And I have an existing group
    When I add update with new <census info>
    Then the census should save successfully
    Examples:
      | census info                   |
      | two child dependents          |
      | child and spouse dependent    |
      | employee with time employment |

  Scenario Outline: Add a member with <census info> to census
    Given I login as a "userRole"
    And I have an existing group
    When I add update with new <census info>
    Then the census should save successfully
    Examples:
      | census info              |
      | employee only tier       |
      | employee + spouse tier   |
      | employee + child tier    |
      | employee + children tier |

  Scenario: Add a family to census
    Given I login as a "userRole"
    And I have an existing group
    When I add a family to the census
    Then the census should save successfully

  Scenario: Add a child dependent as a waived dependent to census
    Given I login as a "userRole"
    And I have an existing group
    When I add child dependent as a waived dependent to census
    Then the census should save successfully
