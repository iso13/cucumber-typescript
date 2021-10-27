@updateSetting @cami
Feature: Update Setting
  As a User
  I want the ability to update my user settings
  So that I can reconfigure my account details

  Scenario: Forgot password
    Given I launch the application
    When I forget my password
    Then I should receive an email to reset my password
    And I am able to login with the new password

  Scenario: Update contact settings
    Given I login as an "<user_role>"
    When I update my contact settings
    Then my information contact information should be updated

  Scenario: Change password
    Given I login as an "<user_role>"
    When I update my password
    Then I am able to login with the new password
