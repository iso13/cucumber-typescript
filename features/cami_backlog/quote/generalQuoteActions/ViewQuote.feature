@quote @generalActions @viewQuote @cami
Feature: View Quote
  As a QuotePad user
  I need to be able to view a quote
  So I can see the quote configuration and make some changes

  Background:
    Given I login as a "Broker"
    And I have a medical quote created

  Scenario: View a quote
    When I view the quote
    Then I should see the quote information

  Scenario: View a quote and make some changes to the name, census and contributions
    When I view the quote "Medical Quote 1"
    And I set contributions to "100, 100, 100, 100"
    And I save the quote as "Medical Quote 1 Updated"
    Then The quote "Medical Quote 1 Updated" should be displayed and a total cost updated
