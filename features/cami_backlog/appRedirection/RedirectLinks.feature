@handleAppRedirection @cami
Feature: Handle App Redirection
  As a User
  I want to have my link to redirect me to a specific page in App
  So that I don't get in to the default page after login

  Scenario Outline: Redirect link in to a groups content
    Given I create a group and logout
    When I open the URL '<url>'
    And I login as a "userRole"
    Then I should be redirected to the <page> page
    Examples:
      | url           | page          |
      | /planDesigner | plan designer |
      | /quotes       | quotes        |
      | /proposals    | proposal page |
      | /preview      | proposal PDF  |
