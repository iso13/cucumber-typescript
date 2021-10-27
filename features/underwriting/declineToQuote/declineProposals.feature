@underwriting @declineToQuote @declineProposals @critical
Feature: Decline Proposals
  As an Underwriter
  I want to be prevented from creating proposals for Declined Groups
  so that no one accidentally quotes business we don't want

  Scenario Outline: Only non-declined quotes can be added to proposals
    Given I login as a "underwriter"
    And I create a group with data "<group_data>" and owner "<owner>"
    And I upload census file "<census_file>" for template "<template>"
    And I create few quotes based on custom plans:
      | ci plan 1       |
      | accident plan 1 |
    And I decline a product line:
      | dtq_ci |
    When I start creating a proposal
    Then only the following quotes should be able to be added to the proposal
      | Valid Accident plan |
    @principal
    Examples:
      | owner        | group_data           | census_file         | template                  |
      | Natalie Sell | Group_CA_3571_14_CIA | Tmpl_14EEs_4cl.xlsx | Principal Census Template |
    @transamerica
    Examples:
      | owner        |
      | Thomas Smith |

  Scenario Outline: Proposals cannot be created when the group is not declined but all quotes are declined
    Given I login as a "underwriter"
    And I create a group with data "<group_data>" and owner "<owner>"
    And I upload census file "<census_file>" for template "<template>"
    And I create few quotes based on custom plans:
      | ci plan 1       |
      | accident plan 1 |
    And I decline few product lines:
      | dtq_multiple_products |
    When I start creating a proposal
    Then I should see an error dialog with the following message
      | No Available Quotes |
    @principal
    Examples:
      | owner        | group_data           | census_file         | template                  |
      | Natalie Sell | Group_CA_3571_14_ALL | Tmpl_14EEs_4cl.xlsx | Principal Census Template |
    @transamerica
    Examples:
      | owner        |
      | Thomas Smith |

  Scenario Outline: Declined groups cannot create proposals
    Given I login as a "underwriter"
    And I create a group with data "<group_data>" and owner "<owner>"
    And I upload census file "<census_file>" for template "<template>"
    And I create a quote based on custom plan:
      | ci plan 1 |
    When I decline few product lines:
      | dtq_all |
    Then I should not be able to create a proposal
    @principal
    Examples:
      | owner        | group_data           | census_file         | template                  |
      | Natalie Sell | Group_CA_3571_14_CIA | Tmpl_14EEs_4cl.xlsx | Principal Census Template |
    @transamerica
    Examples:
      | owner        |
      | Thomas Smith |

  Scenario Outline: Proposals that include a declined quote are declined
    Given I login as a "underwriter"
    And I create a group with data "<group_data>" and owner "<owner>"
    And I upload census file "<census_file>" for template "<template>"
    And I create a proposal based on plan:
      | ci plan 1       |
      | accident plan 1 |
    When I decline a product line:
      | dtq_ci |
    Then proposal status should be set to "Declined"
    And the proposal should not be actionable
    @principal
    Examples:
      | owner        | group_data           | census_file         | template                  |
      | Natalie Sell | Group_CA_3571_14_CIA | Tmpl_14EEs_4cl.xlsx | Principal Census Template |
    @transamerica
    Examples:
      | owner        |
      | Thomas Smith |
