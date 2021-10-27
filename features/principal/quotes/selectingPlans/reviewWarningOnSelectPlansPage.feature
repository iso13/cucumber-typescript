@principal @quotes @selectingPlans @reviewWarningOnSelectPlansPage @wip
Feature: Review Warning On Select Plans Page
  As a Requester
  I should be warned on selecting plan(s) when my census is invalid
  So I will be able to update my census with the required data for quoting

  Background:
    Given I login as a "Requester"

  @critical
  Scenario Outline: Warning prompt occurs when census required information (<missing_required_info>) is missing (new plan)
    Given I have created a new group
    And I upload Principal census file
      | <invalid_census_file> |
    And I create an "MCV" custom plan
      | mcv plan 1 |
    And I create a quote based on the custom plan
    Then warning about invalid census should display
    Examples:
      | missing_required_info | invalid_census_file          |
      | Date of Birth         | censusMissingDOBandAge.xlsx  |
      | Class number          | censusMissingClass.xlsx      |
      | Gender                | censusMissingGender.xlsx     |
      | Dental Election       | censusMissingDentalTier.xlsx |
      | Vision Election       | censusMissingVisionTier.xlsx |

  @critical
  Scenario: Warning prompt occurs when census required information is missing (existing plan)
    Given I have created a group
    And I create an "MCV" custom plan
      | mcv plan 1 |
    When I update census "Date of Birth" field with ""
    And I create a quote based on the existing custom plan
    Then warning about invalid census should display

  @major
  Scenario: User should be able to navigate to Census page using 'Take me to Census' button
    Given I have created a new group
    And I upload Principal census file
      | Tmpl_10EEs_2cl_missing_data.xlsx |
    And I create an "MCV" custom plan
      | mcv plan 1 |
    And I create a quote based on the custom plan
    When I select to be taken form Select Plans page to Census page
    Then I should be redirected to Census page
