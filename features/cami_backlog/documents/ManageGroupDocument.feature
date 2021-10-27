@documents @manageGroupDocument @cami
Feature: Manage Group Documents
  As a User
  I need to be able to upload documents to a group
  So I can more precisely manage that group

  Background:
    Given I login as a "<user_role>"
    And I have a group

  Scenario: Upload a document to groups
    When I upload a document to the group
    Then I should be able to see the document added to the group

  Scenario: Upload multiple group documents
    When I upload multiple documents to the group
    Then I should be able to see the documents added to the group

  Scenario: Download group document
    When I download a document to the group
    Then I should be able to see the documents

  Scenario: Download group documents in bulk
    When I download multiple documents to the group
    Then I should be able to see the documents
