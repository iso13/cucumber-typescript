@core @createCustomQuotes @planDesigner
Feature: Create Custom Quotes
  As a Broker
  I want to use my custom plans to create custom quotes
  So that I can add my custom quotes to proposals and sell them to clients

  Background:
    Given I login as a "Broker"
    And I have a group
    And I upload an Other Census using "I_have_a_census" file

  @blocker @MSTR-1230 @MSTR-1646
  Scenario: Create a custom quote
    When I create a custom medical quote with "custom medical quote data"
    Then A custom medical quote should be successfully created for my group

  @wip
  Scenario: Plans included on quotes should become locked and read only

  @wip @critical @diego
  Scenario: Create a market snapshot quote using custom medical plans

  @wip @critical @diego
  Scenario: Create a standard modeling quote using custom medical plans

  @wip
  Scenario: Create quotes for all product lines including all plans with one click
    When I create a custom quote
    And I select all plans to quote
    And I create custom quotes with selected plans
    Then Quotes should be created for "Medical, Dental, Vision, Life"

  @wip
  Scenario: Create quotes for medical, dental, vision, and life with a single plan. The quote name should default to the plan name

  @wip
  Scenario: Create quotes for medical, dental, vision, and life with multiple plans. The quote name should default to {product line name} Quote

  @wip
  Scenario: Create multiple quotes for a product line with one click. Quote names should default to the plan name
