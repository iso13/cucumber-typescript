@trinet @proposalPermissions @wip @critical @fernando
Feature: Proposal permissions
  As a quotepad user
  I want access to my proposal limited
  So that only users in my organization and in the correct role can access my proposals

  Scenario: A proposal created by a primary owner should be accessible to that primary owner, secondary consultant and admin users

  Scenario: A proposal created by a secondary consultant should be accessible by itself, primary owner and admin users

  Scenario: A proposal created by an admin user, should be accessible by admin, primary owner and secondary consultant

  Scenario: Proposals should be visible for the admin users, primary owners and secondary consultants defined for the group

  Scenario: Primary owner should not be able to delete or modify BCR proposals that are of an Exchange on which it has not been trained

  Scenario: Primary owner should not be able to delete or modify PCR proposals that are of an Exchange on which it has not been trained

  Scenario: Secondary Consultant should not be able to delete or modify BCR proposals that are of an Exchange on which it has not been trained

  Scenario: Secondary Consultant should not be able to delete or modify PCR proposals that are of an Exchange on which it has not been trained
