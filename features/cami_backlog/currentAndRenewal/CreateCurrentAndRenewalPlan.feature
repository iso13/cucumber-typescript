@createCurrentAndRenewalPlan @cami
Feature: Create Current and Renewal Plan
  As a User
  I need the ability to create current and renewal
  So that I can show my clients the difference between their previous years and new plans this year

  Background:
    Given I login as a "<user_role>"
    And I have a group
    And I upload an Other Census using "I_have_a_census" file
    And I navigate to current and renewal

  @blocker
  Scenario: Create current via published plans for medical
    When I create a medical current published quote with "medical current published data"
    And I create a medical renewal custom quote with "medical renewal custom data"
    Then Medical current and renewal should be successfully created

  @critical
  Scenario: Create current and renewal for dental
    When I create a current and renewal dental quote with "current and renewal dental data"
    Then Vision current and renewal should be successfully created with "saved current and renewal dental data"

  @critical
  Scenario: Create current and renewal for vision
    When I create a current and renewal vision quote with "current and renewal vision data"
    Then Vision current and renewal should be successfully created with "saved current and renewal vision data"

  @critical
  Scenario: Create current and renewal for life
    When I create a current and renewal life quote with "current and renewal life data"
    Then Life current and renewal should be successfully created with "saved current and renewal vision data"

  @critical
  Scenario: Create current via custom plans for medical
    When I create a current and renewal medical quote with "current and renewal medical data" via custom plan
    Then Medical current and renewal should be successfully created with "saved current and renewal medical data"

  @critical
  Scenario: Create renewal via custom plans for vision
    When I create a current and renewal vision quote with "current and renewal vision data" via custom plan
    Then Vision current and renewal should be successfully created with "saved current and renewal vision data"

  @critical
  Scenario: Create renewal via published plans for life
    When I create a current and renewal life quote with "current and renewal vision data" via custom plan
    Then Life current and renewal should be successfully created with "saved current and renewal life data"

  Scenario Outline: Validate Current and Renewal SideBySide information for <product?
    When I create a current and renewal quote for "<product>"
    Then the SideBySide information is correct for
      | plan name |
      | benefits  |
      | rates     |
    Examples:
      | product |
      | Life    |
      | Dental  |
      | Medical |
      | Vision  |
