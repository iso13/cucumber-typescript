@underwriting @declineToQuote @declineProductLines
Feature: Decline Product Lines
  As an Underwriter
  I want the system to store my DTQ decision about a product line
  so that we don't quote something I said not to.

  @blocker
  Scenario Outline: Decline product lines
    Given I login as a "<user>"
    And I create a group with data "<group_data>" and owner "<owner>"
    And I upload census file "<census_file>" for template "<template>"
    And I create few quotes based on custom plans:
      | ci plan 1       |
      | accident plan 1 |
    When I decline a product line:
      | <dtq product> |
    Then I should see comment and reason code for declined product line
    @principal
    Examples:
      | user            | owner        | dtq product           | group_data           | census_file         | template                  |
      | underwriter     | Natalie Sell | dtq_ci                | Group_CA_3571_14_CIA | Tmpl_14EEs_4cl.xlsx | Principal Census Template |
      | underwriter     | Natalie Sell | dtq_multiple_products | Group_CA_3571_14_ALL | Tmpl_14EEs_4cl.xlsx | Principal Census Template |
      | underwriter     | Natalie Sell | dtq_all_in_sequence   | Group_CA_3571_14_ALL | Tmpl_14EEs_4cl.xlsx | Principal Census Template |
      | underwriter     | Natalie Sell | dtq_all               | Group_CA_3571_14_ALL | Tmpl_14EEs_4cl.xlsx | Principal Census Template |
      | underwriter     | Natalie Sell | dtq_all_CIA           | Group_CA_3571_14_CIA | Tmpl_14EEs_4cl.xlsx | Principal Census Template |
      | sales_executive | Natalie Sell | dtq_all               | Group_CA_3571_14_ALL | Tmpl_14EEs_4cl.xlsx | Principal Census Template |
    @transamerica
    Examples:
      | user            | owner        | dtq product           |
      | underwriter     | Thomas Smith | dtq_ci                |
      | underwriter     | Thomas Smith | dtq_multiple_products |
      | underwriter     | Thomas Smith | dtq_all_in_sequence   |
      | underwriter     | Thomas Smith | dtq_all               |
      | sales_executive | Thomas Smith | dtq_all               |

  @critical
  Scenario Outline: Declining all products should disable decline to quote option
    Given I login as a "underwriter"
    And I create a group with data "<group_data>" and owner "<owner>"
    And I upload census file "<census_file>" for template "<template>"
    And I create few quotes based on custom plans:
      | ci plan 1       |
      | accident plan 1 |
    When I decline all product lines:
      | <dtq product> |
    Then decline to quote should be disabled
    @principal
    Examples:
      | owner        | dtq product         | group_data           | census_file         | template                  |
      | Natalie Sell | dtq_all_CIA         | Group_CA_3571_14_CIA | Tmpl_14EEs_4cl.xlsx | Principal Census Template |
      | Natalie Sell | dtq_all_in_sequence | Group_CA_3571_14_ALL | Tmpl_14EEs_4cl.xlsx | Principal Census Template |
    @transamerica
    Examples:
      | owner        | dtq product         |
      | Thomas Smith | dtq_all             |
      | Thomas Smith | dtq_all_in_sequence |

  @critical
  Scenario Outline: Only non-declined product lines should be able to be declined
    Given I login as a "underwriter"
    And I create a group with data "<group_data>" and owner "<owner>"
    And I upload census file "<census_file>" for template "<template>"
    And I create few quotes based on custom plans:
      | ci plan 1       |
      | accident plan 1 |
    When I decline few product lines:
      | dtq_multiple_products |
    Then non declined product lines should be able to be declined
    @principal
    Examples:
      | owner        | group_data           | census_file         | template                  |
      | Natalie Sell | Group_CA_3571_14_ALL | Tmpl_14EEs_4cl.xlsx | Principal Census Template |
    @transamerica
    Examples:
      | owner        |
      | Thomas Smith |
