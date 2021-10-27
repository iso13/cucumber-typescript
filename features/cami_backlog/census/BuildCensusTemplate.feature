@buildCensusTemplate @cami
Feature: Build Census Template
  As a User
  I need to be able to build my own census templates
  So that I can have a custom company template

  Scenario: Upload a custom census via the Other Census upload feature
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I upload 'CustomCensus.xlsx' census file as 'Custom' census
    And I acknowledge census upload warnings
    And I save classes
    Then the census should save successfully

  Scenario: Upload a custom census using a previously saved census template
    Given I login as a "userRole"
    And I navigate to group '<existingTestGroup>'
    When I upload 'CopyOfCustomCensus.xlsx' census file as 'Custom' census
    And I acknowledge census upload warnings
    And I save classes
    Then the census should save successfully

  Scenario: Upload a custom census with coverage tiers
    Given I login as a "<<userRole>"
    And I navigate to group '<existingTestGroup>'
    When I upload 'CustomCensusWithTiers.xlsx' census file as 'Custom' census
    And I acknowledge census upload warnings
    And I save classes
    Then the census should save successfully
