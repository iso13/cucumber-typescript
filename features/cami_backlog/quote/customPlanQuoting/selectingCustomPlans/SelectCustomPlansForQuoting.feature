@quote @selectingCustomPlans @selectCustomPlansForQuoting @cami
Feature: Select Custom Plans For Quoting
  As a User
  I want to be able to select my custom plans to include them into quotes
  So that I can add my custom quotes to proposals and sell them to clients

  Scenario: Selection of a single plan leads to a single quote creation, that contains that plan

  Scenario: Selection of multiple plans leads to a single quote creation, that contains all these plans

  Scenario: Quote name defaults to plan name, if only one plan has been selected

  Scenario: Quote name defaults to product line name, if multiple plans have been selected

  Scenario: Existing plan without assigned classes cannot be quoted

  Scenario: Locked plan with outdated classes doesn't display for selection
