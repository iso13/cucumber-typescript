@ancillaryStandardModelingQuote @noScenario @trinet @wip @cami
Feature: Ancillary Standard Modeling Quote Creation
  As a User
  I want to create Standard Modeling Quotes for Ancillary Product Line

  @blocker
  Scenario: Create Standard Modeling BCR/PCR quotes for ancillary product line
    Given I login as a "userRole"
    When I create standard modeling BCR/PCR quotes for ancillary product line
    Then I should be able to save the quote

  @critical
  Scenario: All contribution strategies Options are available for Medical Standard Modeling for ancillary lines

  Scenario: EE/ER and Total Costs are visible when different Contribution Strategies are applied
