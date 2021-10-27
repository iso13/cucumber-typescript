@axa @uploadAxaCensus @wip
Feature: Upload AxaCensus
  As an Underwriter
  I need to be able to upload an AxaCensus census file to my group
  So I can upload the member's data

  Background:
    Given I login as an "Underwriter"
    And I create a new group with minimum group data

  Scenario: Successfully upload an AxaCensus template as a csv

  @blocker
  Scenario: Successfully Upload an AxaCensus template as a xlsx
    When I upload AXA Census template
      | template_type |
      | AXA Census    |
    Then Census should be successfully uploaded

  Scenario: Should not be able to upload an AxaCensus template as a pdf file
