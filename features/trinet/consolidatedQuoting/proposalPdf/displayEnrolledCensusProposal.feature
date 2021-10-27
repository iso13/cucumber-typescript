@consolidatedQuoting @displayEnrolledCensusProposal @poorna @wip
Feature: Display Enrolled Census Proposal
  As a user
  I need to be able to see in my proposal enrolled Census Breakdown report for disability benefits
  So I am aware benefit amounts and the costs for each employee that is eligible for coverage

  Background:
    Given I login as a "Carrier Admin"
    And I create a new group

  Scenario: Validate STD/LTD benefits visibility
    When user creates PCR proposal with STD and LTD products
    Then STD and LTD should display on the Enrolled Census Breakdown report for each employee

  Scenario: Validate STD/LTD benefits display order
    When user creates PCR proposal with STD and LTD products
    Then STD and LTD should display after all other benefit types

  Scenario: Validate STD/LTD benefits display order
    When user creates PCR proposal with STD and LTD products
    Then STD display after all other benefit types before LTD

  Scenario: Validate STD/LTD benefits display order
    When user creates BCR proposal with STD and LTD products
    Then STD and LTD should display after all other benefit types
