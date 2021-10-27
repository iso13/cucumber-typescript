@underwriting @viewGroupProfileInfo @trivial
Feature: View Group Profile Info
  As an Underwriter
  I want to see basic group profile info in the underwriting tab
  So that I can easily understand what kind of group I'm working on

  Background:
    Given I login as a "Underwriter"

  Scenario Outline: SIC Code, Group Location, and Total # of Lives should be displayed at the top of the "Underwriting" tab
    And I create a group with data "<group_data>" and owner "<owner>"
    And I upload census file "<census_file>" for template "<template>"
    Then I should be able to see basic group profile info in the underwriting tab
    @principal
    Examples:
      | owner        | group_data           | census_file         | template                  |
      | Natalie Sell | Group_CA_3571_14_DCI | Tmpl_14EEs_4cl.xlsx | Principal Census Template |
    @transamerica
    Examples:
      | owner        |
      | Thomas Smith |

  Scenario Outline: When group profile info is updated, changes should be reflected on the "Underwriting" tab
    And I create a group with data "<group_data>" and owner "<owner>"
    And I upload census file "<census_file>" for template "<template>"
    When I update the group profile info
    Then I should be able to see basic group profile info in the underwriting tab
    @principal
    Examples:
      | owner        | group_data           | census_file         | template                  |
      | Natalie Sell | Group_CA_3571_14_DCI | Tmpl_14EEs_4cl.xlsx | Principal Census Template |
    @transamerica
    Examples:
      | owner        |
      | Thomas Smith |
