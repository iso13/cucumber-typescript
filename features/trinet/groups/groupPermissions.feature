@trinet @groupPermissions @permissions @wip @carlos
Feature: Group permissions
  As a BCT user
  Access to my groups should be restricted to a subset of users
  So that my groups information is not exposed to users that should not have access

  @critical
  Scenario: I should have access to any group where I am as a primary group owner

  @critical
  Scenario: I should have access to any group where I am as a secondary group owner

  @critical
  Scenario: As a super admin I should have access to any group owned by primary or secondary

  Scenario: As a BCT user I should be able to see all the groups I created

  Scenario: As an account manager or any other super users I should have access to any group owned by a broker in my org

  Scenario: As an account manager or any other super users I should have access to any group owned by a broker in a child org of mine

  Scenario: As a broker I should not have access to any other brokers groups even if they are in my org

  Scenario: As a CS user I should have access to any group in the Quotepad application
