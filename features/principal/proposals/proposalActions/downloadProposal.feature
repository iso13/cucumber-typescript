@principal @proposals @proposalActions @downloadProposal
Feature: Download Proposal
  As a Requester
  I want to be able to download a proposal output in specified format
  So that I can present information to my client

  Background:
    Given I login as a "Requester"
    And I have a proposal
      | gtl plan 1 mvp2 |

  @blocker @mvp1 @QUOTE-367
  Scenario: Download proposal output in Excel format
    When I download my proposal in Excel format
    Then The Excel file is downloaded correctly

  @major @dev @test @QUOTE-367
  Scenario: Download of Excel Export is disabled for an invalid proposal
    When I update group profile "Zip Code" value to "91001"
    And I save the group
    Then Download of Excel Export should be disabled for an invalid proposal

  @wip
  Scenario: Download proposal output in PDF format
