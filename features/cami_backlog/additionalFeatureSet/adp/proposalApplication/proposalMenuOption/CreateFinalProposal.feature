@createFinalProposal @adp @cami
Feature: Create Final Proposal
  As a User
  I want to create final proposals
  So that I can propose new quotes for the upcoming year to my clients

  @blocker
  Scenario: Create a final proposal with a published 4-Tier Composite medical standard modeling quote
    Given I login as a "userRole"
    When I create a "Medical" "Standard Modeling" quote
    And I update the Age-Rated to "Published 4-Tier Composite"
    Then I should be able to create a final proposal

  Scenario: Create a final proposal with a published ACA Age-Rated medical standard modeling quote
    Given I login as a "userRole"
    When I create a "Medical" "Standard Modeling" quote
    And I update with a published ACA Age-Rated
    Then I should be able to create a final proposal

  Scenario: Create a final proposal with a custom 4-Tier Composite medical standard modeling quote
    Given I login as a "userRole"
    When I create a "Medical" "Standard Modeling" quote
    And I update the Age-Rated to "Published 4-Tier Composite"
    Then I should be able to create a final proposal

  Scenario: Create a final proposal with a custom ACA Age-Rated medical standard modeling quote
    Given I login as a "userRole"
    When I create a "Medical" "Standard Modeling" quote
    And I update with a custom ACA Age-Rated
    Then I should be able to create a final proposal

  Scenario: Cannot create a final proposal with a published medical market snapshot quote
    Given I login as a "userRole"
    When I create a "Medical" "Standard Modeling" quote
    And I update with a published medical market snapshot
    Then I should be able to create a final proposal

  Scenario: Cannot create a final proposal with a custom medical market snapshot quote
    Given I login as a "userRole"
    When I create a "Medical" "Standard Modeling" quote
    And I update with a custom medical market snapshot
    Then I should be able to create a final proposal

  Scenario: Create a final proposal with a published 4-Tier dental quote
    Given I login as a "userRole"
    When I create a "Dental" "Standard Modeling" quote
    And I update with a Published 4-Tier Composite
    Then I should be able to create a final proposal

  Scenario: Create a final proposal with a custom 3-Tier dental quote
    Given I login as a "userRole"
    When I create a "Dental" "Standard Modeling" quote
    And I update with a custom 3-Tier
    Then I should be able to create a final proposal

  Scenario: Create a final proposal with a published 4-Tier vision quote
    Given I login as a "userRole"
    When I create a "Vision" "Standard Modeling" quote
    And I update with a custom 4-Tier
    Then I should be able to create a final proposal

  Scenario: Create a final proposal with a custom 3-Tier vision quote
    Given I login as a "userRole"
    When I create a "Vision" "Standard Modeling" quote
    And I update with with a custom 3-Tier
    Then I should be able to create a final proposal

  Scenario: Create a final proposal with a published life quote
    Given I login as a "userRole"
    When I create a "Life" "Standard Modeling" quote
    Then I should be able to create a final proposal

  Scenario: Create a final proposal with a published life quote with AD&D not included
    Given I login as a "userRole"
    When I create a "Life" "Standard Modeling" quote
    And I update with AD&D not included
    Then I should be able to create a final proposal

  Scenario: Create a final proposal with medical current, renewal and a real time quote
    Given I login as a "userRole"
    When I create a "Medical" "Standard Modeling" quote
    And And I update with life current, renewal and a real time
    Then I should be able to create a final proposal

  Scenario: Create a final proposal with dental current, renewal and a real time quote
    Given I login as a "userRole"
    When I create a "Dental" "Standard Modeling" quote
    And I update with life current, renewal and a real time
    Then I should be able to create a final proposal

  Scenario: Create a final proposal with vision current, renewal and a real time quote
    Given I login as a "userRole"
    When I create a "Vision" "Standard Modeling" quote
    And I update with life current, renewal and a real time
    Then I should be able to create a final proposal

  Scenario: Create a final proposal with life current, renewal and a real time quote
    Given I login as a "userRole"
    When I create a "Life" "Standard Modeling" quote
    And I update with life current, renewal and a real time
    Then I should be able to create a final proposal

  Scenario Outline: Create a final proposal with <product> quotes
    Given I login as a "userRole"
    When I create a "<product>" "Standard Modeling" quote
    Then I should be able to create a final proposal
    Examples:
      | product |
      | Medical |
      | Dental  |
      | Vision  |
      | Life    |
