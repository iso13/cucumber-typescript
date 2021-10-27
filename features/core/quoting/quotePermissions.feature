@core @quotePermissions @permissions @wip
Feature: Quote permissions
  As a QuotePad user
  I want to have quote access limited based on permissions and status
  So that only users I want to view quotes can access them

  @critical @diego
  Scenario: A quote created by a Broker should only be accessible to that Broker and their super users

  Scenario: A quote created by super user should only be accessible to super users in that org and parent org

  Scenario: A Broker should only be able to view a quote created by a super user after it has been released to Broker by a sales executive
