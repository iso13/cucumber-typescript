@principal @displayPrincipalLogo @settings
Feature: Display Principal Logo
  As an Engineer
  I want the Principal logo to be displayed in the app
  So it’s visible to requesters and gives a visual representation of the brand

  @critical
  Scenario: Principal logo on login page
    Given I launch the application
    Then the Principal logo should display on login page

  @critical
  Scenario: Principal logo on home page
    Given I login as a "Requester"
    Then the Principal logo should display on home page

  @major
  Scenario: Principal logo in the header of a page
    Given I login as a "Requester"
    Then the Principal logo should display in the top left corner of the page

  @critical
  Scenario: Principal logo on plan Summary card
    Given I login as a "Requester"
    And I have a group with census
    And I start creating new "Vision" plan
    When I select to view the plan Summary card
    Then the Principal logo should display on the plan Summary card
