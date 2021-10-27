@downloadProposal @distributeSquad @cami
Feature: Download Proposal
  As a User
  I need to be able to download my proposals in PDF and Excel
  So that I can present proposals to clients

  Background:
    Given I login as a "Requester"
    And I have a proposal
      | mcv plan 1 |

  @blocker
  Scenario: Download proposal output in PDF format
    When I download my proposal in PDF format
    Then The PDF file is downloaded correctly

  @blocker
  Scenario: Download proposal output in Excel format
    When I download my proposal in Excel format
    Then The Excel file is downloaded correctly

  @major
  Scenario: Download of Excel Export is disabled for an invalid proposal
    When I update group profile "Zip Code" value to "91001"
    And I save the group
    Then Download of Excel Export should be disabled for an invalid proposal
