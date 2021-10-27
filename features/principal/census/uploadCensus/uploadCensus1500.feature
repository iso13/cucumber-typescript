@principal @census @uploadCensus1500 @minor @performance
Feature: Upload Census Template
  As a Requester
  I need to be able to upload Principal census file into my group
  So I can import 1500 employees and their dependents data into Quotepad

  Background:
    Given I login as a "child_requester_1"

  Scenario: Upload a xlsx file, containing 1500 users
    And I have a group with census created with
      | group_data               | census_data         |
      | i_have_a_group_with_city | Tmpl_1500EEs.xlsx   |
    Then No census error dialogs should appear
    And I should be redirected to Plan Designer page

  Scenario: Upload Other census file, containing 1500 members
    And I create a new group with "i_have_a_group_with_city"
    And I upload an Other Census on Principal using "1500-fixed"
    Then No census error dialogs should appear
    And I should be redirected to Plan Designer page
