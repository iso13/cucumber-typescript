@core @createQuotes @blocker @MSTR-848 @MSTR-1646
Feature: Create Quotes
  As a Broker
  I should be able to create quotes from my group
  So that if I can present quotes to my customers for the upcoming year

  Background:
    Given I login as a "Broker"
    And I have a group
    And I upload an Other Census using "I_have_a_census" file

  Scenario: Create a medical standard modeling quote
    When I create a published standard modeling quote with "published medical quote data"
    Then A published quote should be successfully created for my group

  Scenario: Create a medical market snapshot quote
    When I create a published market snapshot quote with "published medical quote data"
    Then A published quote should be successfully created for my group
