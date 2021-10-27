@consolidatedQuoting @createBenefitDifferencesReports @poorna @wip
Feature: Create Benefit Differences Reports
  As a Carrier Admin
  I need to be able to create Benefit Differences
  So I can deal reports during creating or viewing a proposal

  Background:
    Given I login as a "Carrier Admin"
    And I create a new group
    And I create a new proposal

  Scenario: Default view of the Benefit Differences screen
    When I select Benefit Differences report
    Then no base comparison plan is selected
    And no plans should be displayed on the sceen
    And there should be a actions dropdown menu available from which to select a base comparison plan

  Scenario: Validate ability to create and save Benefit Differences Report
    When I select view Benefit Differences component
    And I select base comparison plan from dropdown menu
    And I save Benefit Differences Report
    Then Benefit Differences Report is created

  Scenario: Action Drop down should contain only the quotes selected on quote

  Scenario: Validate the ability to select base comparison plan
    When I select view Benefit Differences component
    And I select base comparison plan from dropdown menu
    Then base comparison plan is set to the first plan in the table
