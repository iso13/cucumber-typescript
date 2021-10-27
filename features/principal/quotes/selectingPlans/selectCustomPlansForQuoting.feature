@principal @quotes @selectingPlans @selectCustomPlansForQuoting @wip
Feature: Select Custom Plans For Quoting
  As a Requester
  I want to be able to select my custom plans to include them into quotes
  So that I can add my custom quotes to proposals and sell them to clients

  Scenario: Selection of a single plan leads to a single quote creation

  @critical
  Scenario: Selection of multiple plans leads to the same number of quotes creation (one plan per quote)

  Scenario: If only one plan per product line is selected the quote name should default to the plan name

  Scenario: When user populates quote name field and selects multiple plans,
  then input quote name is ignored and every created quote is named after respective custom plan

  Scenario: When user populates quote name field and selects single plan,
  then input quote name is applied to a new quote

  @critical
  Scenario: Existing plan without assigned classes cannot be quoted

  @critical
  Scenario: Locked plan with outdated classes doesn't display for selection
