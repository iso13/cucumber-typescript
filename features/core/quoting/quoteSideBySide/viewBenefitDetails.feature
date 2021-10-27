@core @benefitDetails @wip
Feature: View benefit details
  As a Broker
  I need to have access to the plan design summaries and sbcs for each plan
  So that I can provide my clients with the required level of benefit detail for each plan they will enroll on

  Background:
    Given I login as a "Broker"
    And I have a group and census
    And I create a medical standard modeling quote

  @critical @diego
  Scenario: For plans that have SBC data I should be able to access the pdf when I click "Benefit Details" on a plan

  Scenario: For plan that do not have SBCs I should not be able to click the benefit details button
