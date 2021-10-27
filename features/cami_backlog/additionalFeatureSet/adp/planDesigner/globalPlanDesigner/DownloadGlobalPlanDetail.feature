@downloadGlobalPlanDetail @adp @globalPlan @cami
Feature: Download Global Plan Detail
  As a User
  I want to be able to download the Global Plan Details
  So I can manage the Global Plan details

  * What type of format should the download be in?

  Scenario: Download a global dental plan's benefit details
    Given I login as a "userRole"
    When I navigate to global plan designer
    Then I should be able to download the "<global dental>" plan's benefit details

  Scenario: Download a global medical plan's benefit details
    Given I login as a "userRole"
    When I navigate to global plan designer
    Then I should be able to download the "<global medical>" plan's benefit details

  Scenario: Download a global vision plan's benefit details
    Given I login as a "userRole"
    When I navigate to global plan designer
    Then I should be able to download the "<global vision>" plan's benefit details

  Scenario: Download a global life plan's benefit details
    Given I login as a "userRole"
    When I navigate to global plan designer
    Then I should be able to download the "<global life>" plan's benefit details
