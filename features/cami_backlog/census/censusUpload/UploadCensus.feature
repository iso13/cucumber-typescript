@uploadCensus @cami
Feature: Upload Census
  As a user
  I need to upload a census
  So I can manage my members

  * HealthConnect additional fields are not uploaded and census upload continues normally

  @blocker @stepsAdded
  Scenario: Upload a custom census template
    Given I login as a "account manager"
    And I navigate to group '<existingTestGroup>'
    When I upload 'PFG_tmplt_10EEs_1cl.xlsx' census file as 'Principal Census Template' census
    And I acknowledge census upload warnings
    And I save classes
    Then the census should save successfully

  @critical
  Scenario: Upload an old HealthConnect census
    Given I login as a "account manager"
    And I navigate to group '<existingTestGroup>'
    When I upload 'HealthConnectCensus.xlsx' census file as 'Health Connect' census
    And I acknowledge census upload warnings
    And I save classes
    Then the census should save successfully

  Scenario: Upload a QuotePad legacy template
    Given I login as a "account manager"
    And I navigate to group '<existingTestGroup>'
    When I upload 'QuotePadLegacy.xlsx' census file as 'QuotePad Legacy' census
    And I acknowledge census upload warnings
    And I save classes
    Then the census should save successfully

  Scenario: Upload a Quotit census
    Given I login as a "account manager"
    And I navigate to group '<existingTestGroup>'
    When I upload 'Quoteit.xlsx' census file as 'Quoteit' census
    And I acknowledge census upload warnings
    And I save classes
    Then the census should save successfully
