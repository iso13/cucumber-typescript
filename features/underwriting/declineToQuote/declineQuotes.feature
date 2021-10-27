@underwriting @declineToQuote @declineQuotes @critical
Feature: Decline Quotes
  As an Underwriter
  I want to be prevented from using existing quotes for Product Lines that have been declined
  so that my decision sticks.

  Scenario Outline: Declined quote cards should not be actionable
    Given I login as a "underwriter"
    And I create a group with data "<group_data>" and owner "<owner>"
    And I upload census file "<census_file>" for template "<template>"
    And I create a quote based on custom plan:
      | ci plan 1 |
    When I decline few product lines:
      | dtq_ci |
    Then the quote tile should not be actionable
    And the quote card should not be actionable
    @principal
    Examples:
      | owner        | group_data           | census_file         | template                  |
      | Natalie Sell | Group_CA_3571_14_CIA | Tmpl_14EEs_4cl.xlsx | Principal Census Template |
    @transamerica
    Examples:
      | owner        |
      | Thomas Smith |
