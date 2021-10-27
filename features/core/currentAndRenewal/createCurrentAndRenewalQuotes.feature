@core @createCurrentAndRenewal @jorge
Feature: Create Current and Renewal Quotes
  As a Broker
  I need the ability to create current and renewal
  So that I can show my clients the difference between their previous years and new plans this year

  Background:
    Given I login as a "Broker"
    And I have a group
    And I upload an Other Census using "I_have_a_census" file
    And I navigate to current and renewal

  @blocker @MSTR-1318 @MSTR-847 @MSTR-1646
  Scenario: Create current via published plans for medical
    When I create a medical current published quote with "medical current published data"
    And I create a medical renewal custom quote with "medical renewal custom data"
    Then Medical current and renewal should be successfully created

  @wip @critical
  Scenario: Create current and renewal for dental

  @wip @critical
  Scenario: Create current and renewal for vision
    When I create a current and renewal vision quote with "current and renewal vision data"
    Then Vision current and renewal should be successfully created with "saved current and renewal vision data"

  @wip @critical
  Scenario: Create current and renewal for life
    When I create a current and renewal life quote with "current and renewal life data"
    Then Life current and renewal should be successfully created with "saved current and renewal vision data"

  @wip @critical
  Scenario: Create current via custom plans for medical

  @wip @critical
  Scenario: Create renewal via custom plans for medical

  @wip @critical
  Scenario: Create renewal via published plans for medical

  @wip
  Scenario: Confirm plan name, benefits, and rates display correctly for current and renewal quotes when viewing plan sbs in a real time quote for life

  @wip
  Scenario: Confirm plan name, benefits, and rates display correctly for current and renewal quotes when viewing plan sbs in a real time quote for dental

  @wip
  Scenario: Confirm plan name, benefits, and rates display correctly for current and renewal quotes when viewing plan sbs in a real time quote for vision

  @wip
  Scenario: Confirm plan name, benefits, and rates display correctly for current and renewal quotes when viewing plan sbs in a real time quote for medical
