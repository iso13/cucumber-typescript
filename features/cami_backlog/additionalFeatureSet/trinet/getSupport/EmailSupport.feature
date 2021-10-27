@getSupport @emailSupport @noScenario @trinet @cami
Feature: Email Support
  As a User
  I need to be able to access the support for group
  So I can understand how the application features work and to contact a customer success representative when blocked

  Scenario: Link users to email with pre-populated details
    Given I login as a "userRole"
    When I fill out a support ticket
    Then I should receive an email for support
