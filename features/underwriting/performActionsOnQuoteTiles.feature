@underwriting @performActionsOnQuoteTiles
Feature: Perform Actions on Quote Tiles
  As an Underwriter
  I want to be able to perform actions on a quote tile
  So that I can take advantage of available functionalities

  Scenario Outline: Duplicate a quote in the underwriting tab
    Given I login as a "Underwriter"
    And I create a group with data "<group_data>" and owner "<owner>"
    And I upload census file "<census_file>" for template "<template>"
    When I create a quote based on custom plan:
      | ci plan 1 |
    Then I should be able to duplicate the quote in underwriting tab
    @principal
    Examples:
      | owner        | group_data           | census_file         | template                  |
      | Natalie Sell | Group_CA_3571_14_DCI | Tmpl_14EEs_4cl.xlsx | Principal Census Template |
    @transamerica
    Examples:
      | owner        |
      | Thomas Smith |
