@trinet @selectionToggle @wip @carlos

Feature: Report type selection toggle
  As a Broker
  I want the ability to select whether or not I want PCR or BCR included on my proposal outputs
  So that I am able to set selection type as BCR or PCR

  @blocker
  Scenario: Pricing comparision toggle is turned off when Exchange has not been selected

  @blocker
  Scenario: Pricing comparision toggle is turned off when Exchange has not been banded

  @blocker
  Scenario: Pricing comparision toggle is turned on when Exchange has been selected

  @blocker
  Scenario: Pricing comparision toggle is turned on when Exchange has been banded

  @blocker
  Scenario: If pricing comparison toggle is turned off the following should not appear
   |options|
   |rates|
   |contribution step|
   |Contribution strategy dropdown|

  @critical
  Scenario: If pricing comparison toggle is turned on the following should appear and enabled
   |options|
   |rates|
   |contribution step|
   |Contribution strategy dropdown|
   |carrier package dropdow|

  @api
  Scenario: PCR toggle should be on if user has access to a single exchange and bands are selected automatically
