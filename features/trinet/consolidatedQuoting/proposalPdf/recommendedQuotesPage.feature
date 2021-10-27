@trinet @consolidatedQuoting @recommendedQuotesPage @wip
Feature: View Recommended Quotes Page
  As a Carrier Admin
  I want the ability to view my Recommended Quotes selected previously
  So that each proposal PDF output should indicate easily the recommend quote

  Scenario: Validate that Recommended Quotes page should be displayed when there are Recommended Quotes selected

  Scenario: Validate that Recommended Quotes page should not be displayed when there are not Recommended Quotes selected

  Scenario: Validate that any Recommended Quote selected should be displayed on the Recommended Quotes page in order
    | quote in order |
    | medical        |
    | dental         |
    | vision         |
    | life           |
    | std            |
    | ltd            |

  Scenario: Validate that all costs should be accurate according to the individual member-plan mappings for Standard Modeling quotes

  Scenario: Validate all costs are accurate when lowest-cost plan is available to each member for Dental and Vision Market Snapshot quotes

  Scenario: Validate that all costs should be accurate according to the enrollment plan class mapping for Life, STD and LTD
