@trinet @overwriteCensus @carlos
Feature: Overwrite Census
  As a Broker
  I need to be able to overwrite the census on my group
  So I can accurately quote a group for my client

  Background:
    Given I login as a "carrier admin"
    And I create a new group with "minimum group data" and owner as "TriNet Sales"
    And I upload a census "Overwrite Me" selecting "Exchange II / XI RFP Template File" as template type
    And I navigate to "census" page

  @MSTR-1501
  Scenario Outline: Upload census and confirm groups members have been replaced with the new census
    Given I overwrite a census with "<census>" selecting "<templateName>" as template type
    Then My census should be successfully overwritten and match "<expectedData>"

  @blocker @MSTR-1984
    Examples:
      | census                             | templateName                       | expectedData                       |
      | Exchange II - XI RFP Template File | Exchange II / XI RFP Template File | Exchange II - XI RFP Template File |

    Examples:
      | census                | templateName                   | expectedData          |
      | Exchange III template | Exchange III RFP Template File | Exchange III template |
      | Exchange IV template  | Exchange IV RFP Template File  | Exchange IV template  |

  @wip
  Scenario: You should not be able to save overwritten Census information if the required fields have not been fill in and you should see a pop up
  with the title "Invalid or Missing data"

  @critical @wip
  Scenario: Upload a Quotepad census and confirm the groups members have been replaced with the new census

  @wip
  Scenario: Upload a new census via the other census feature and have the groups member replaced with the new census
