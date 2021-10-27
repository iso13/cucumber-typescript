@axa @createCustomQuotes @wip
Feature: Create Custom Quotes
  As an Underwriter
  I want to use my custom plans to create custom quotes
  So that I can add my custom quotes to proposals

  Background:
    Given I login as a "Underwriter"
    And I am on plan design
      | template_type |
      | AXA Census    |

  Scenario: Plans included on quotes should become locked and read only

  Scenario: Create a dental ppo quote using ppo custom plan

  Scenario: Create a dental ameritas quote using ameritas custom plan

  Scenario: Create quotes for dental, vision, life, std, ltd, supplemental life, voluntary life with a single plan. The quote name should default to the plan name

  Scenario: Create quotes for dental, vision, life, std, ltd, supplemental life, voluntary life. The quote name should default to {product line name} Quote

  Scenario: Create multiple quotes for a product line with one click. Quote names should default to the plan name

  Scenario: Create Composite quotes for a product line with one click. Quote names should default to the plan name

  @blocker
  Scenario: Create quotes for all product lines including all plans with one click
    When I save custom plan for
      | custom dental quote data   |
      | custom vision quote data   |
      | custom life quote data     |
      | custom std quote data      |
      | custom ltd quote data      |
      | custom supplife quote data |
      | custom vollife quote data  |
    And I create custom quote for all saved plans
    Then Quotes should be created for all product lines
      | custom dental quote data   |
      | custom vision quote data   |
      | custom life quote data     |
      | custom std quote data      |
      | custom ltd quote data      |
      | custom supplife quote data |
      | custom vollife quote data  |
