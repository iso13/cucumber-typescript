@login @platformSquad @blocker @stepsAdded @cami
Feature: Login
  As a User
  I would like to log into the application
  So I have access to the application features

  Scenario: Login with a valid user
    Given I login as an "userRole"
    Then I should see the home page

  Scenario: Login with OAuth2
    Given I login as an "userRole" via Oauth2
    Then I should see the home page

  Scenario: Login with invalid credentials
    Given I login as an "userRole"
    Then I should see an Invalid Login error message

  Scenario: Login with credentials that have been revoked
    Given I login as an "userRole"
    Then I should see an Invalid Login error message

#TBD Scenario: Login with OpenID

#TBD Scenario: Login with Google Auth
