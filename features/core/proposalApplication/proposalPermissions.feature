@core @proposalPermissions @permissions @wip
Feature: Proposal permissions
  As a QuotePad user
  I want access to my proposal limited
  So that only users in my organization and in the correct role can access my proposals

  @critical @jorge
  Scenario: A proposal created by a Broker should only be accessible to that Broker and their super users

  Scenario: A proposal created by super user should only be accessible to super users in that org and parent org

  Scenario: A Broker should only be able to view a proposal created by a super user after it has been released to Broker by a sales executive
