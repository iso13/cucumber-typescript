@groupOwnerList @cami
Feature: Group Owner List
  As an User
  I need to be able to see Group Owners
  So I can manage and assign owners to groups inside Quotepad

  @critical
  Scenario: I should have access to any group where I am as a primary group owner
    Given I login as an "userRole"
    And I have a list of groups
    When I view my group list
    Then I should only see groups assigned to my "userRole"

  @critical
  Scenario: I should have access to any group where I am as a secondary group owner
    Given I login as an "userRole"
    And I have a list of groups
    When I view my group list
    Then I should only see groups assigned to my "userRole"

  @critical
  Scenario: As a super admin I should have access to any group owned by primary or secondary
    Given I login as an "userRole"
    And I have a list of groups
    When I view my group list
    Then I should be see all groups as an Admin

  Scenario: As a BCT user I should be able to see all the groups I created
    Given I login as an "userRole"
    And I have a list of groups
    When I view my group list
    Then I should only see groups assigned to my "userRole"

  Scenario: As an account manager or any other super users I should have access to any group owned by a broker in my org
    Given I login as an "userRole"
    And I have a list of groups
    When I view my group list
    Then I should only see groups assigned to my "userRole"

  Scenario: As an account manager or any other super users I should have access to any group owned by a broker in a child org of mine
    Given I login as an "userRole"
    And I have a list of groups
    When I view my group list
    Then I should only see groups assigned to my "userRole"

  Scenario: As a broker I should not have access to any other brokers groups even if they are in my org
    Given I login as an "userRole"
    And I have a list of groups
    When I view my group list
    Then I should only see groups assigned to my "userRole"

  Scenario: As a CS user I should have access to any group in the Quotepad application
    Given I login as an "userRole"
    And I have a list of groups
    When I view my group list
    Then I should be see all groups as a "CS"
