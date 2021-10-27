@core @groupPermissions @permissions @serviceLayer @wip @jorge
Feature: Group permissions
  As a QuotePad user
  Access to my groups should be restricted to a subset of users
  So that my groups information is not exposed to users that should not have access

  @critical
  Scenario: As a Broker I should be able to see all the groups I created

  Scenario: As an Account Manager or any other super users I should have access to any group owned by a Broker in my org

  Scenario: As an Account Manager or any other super users I should have access to any group owned by a Broker in a child org of mine

  @critical
  Scenario: As a Broker I should not have access to any other Brokers groups even if they are in my org

  Scenario: As a CS user I should have access to any group in the QuotePad application
