@retrieveProposalsThroughEmail @distributeSquad @cami
Feature: Retrieve Proposals Through Email
  As a User
  I want to be able to get an email with new proposal link
  So that I can check new proposals as soon as they get created

  Scenario: Broker gets a proposal email active session
    Given I am logged in favorite email client
    And I am the owner of a group
    When an active user creates a proposal for my group
    And I get the email link for the proposal
    Then the link leads me directly to the proposal on the broker portal

  Scenario: Broker gets a proposal email new session
    Given I am logged in favorite email client
    And I am the owner of a group
    When an active user creates a proposal for my group
    And I get the email link for the proposal
    And I login as a "Broker"
    Then the link leads me directly to the proposal on the broker portal

  Scenario: Broker do not get an email if he is not the group owner
    Given I am logged in favorite email client
    And I am not the owner of the group
    When an active user creates a proposal for the group
    Then the email is not sent to my account

  Scenario: Carrier Admin do not get an email if he is not the group owner
    Given I am logged in favorite email client
    And I am not the owner of the group
    When an active user creates a proposal for the group
    Then the email is not sent to my account

  Scenario: Broker do not get an email if setting for Retrieve Proposals is not active
    Given I am logged in favorite email client
    And setting for Retrieve Proposals is not active
    When an active user creates a proposal for the group
    Then the email is not sent to my account

  Scenario: Error should be shown if unauthorized users access proposal link
    Given I am logged in favorite email client
    And I am the owner of a group
    When an active user creates a proposal for my group
    And I get the email link for the proposal
    And I share the link to an unauthorized user
    Then the link leads unauthorized user to an elegant error message
