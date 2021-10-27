@consolidatedQuoting @downloadBenefitDetails @poorna @wip
Feature: Download Benefit Details
  As a Carrier Admin
  I need to ability to download plan benefit details
  So I can view as needed

  Scenario: Validate download documents of benefit details
    Given I login as a "Carrier Admin"
    And I create a new group
    And I start creating a new proposal
    When I click on plan name
    Then benefit details carrier PDF document is downloaded
