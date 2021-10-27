@principal @handleLinkRedirect @wip
Feature: Handle Link Redirect
  As a Principal user
  I want to have my link redirect me to a specific page
  So that I don't get in to the default page after login

  Background:
    Given I create a group and logout

  Scenario Outline: Redirect link in to a groups content
    When I open the URL '<url>'
    And I login as a "Requester"
    Then I should be redirected to the <page> page
    Examples:
      | url           | page          |
      | /planDesigner | plan designer |
      | /quotes       | quotes        |
      | /proposals    | proposal page |

  Scenario: Redirect link in to a groups plan designer without permissions
    Given I open a link to a group without permisions on the group
    And I login as a "Requester"
    Then the group should not be found
