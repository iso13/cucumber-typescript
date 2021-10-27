@adp @quoteSummary @wip
Feature: Display quote summary
  As a Producer
  I should be able to see a quote summary on my quote card
  So that I can find quote information I need without looking into the quote

  Scenario: Plan count displays in the top right of the quote card for all product lines

  Scenario: "Effective Date" should display for all product line quotes

  Scenario: "Census On Quote" should display a breakdown as such "X EEs | X Deps | X Total"

  Scenario: "AD&D" should display for life quotes

  Scenario: "Quote Name" should display for all product line quotes

  Scenario: "Carriers" should display for all product line quotes with carriers separated by "|"

  Scenario: "Display Name" should display for life, vision, and dental quotes but not Medical quotes

  Scenario: "Rate Structure" should display for only Medical and should consist of either "ACA Age-Rated" or "4-Tier Composite"

  Scenario: "Quote Type" should display "Standard Modeling" for dental, vision, and life quotes with only 1 plan

  Scenario: "Quote Type" should display "Market-Snapshot" for dental, vision, and life quotes with more than 1 plan

  Scenario: "Quote Type" should display "Market-Snapshot" for medical market snapshot quotes

  Scenario: "Quote Type" should display "Standard Modeling" for medical standard modeling quotes

  Scenario: Only quotes with a package selected on the benefit filter page should display "Package"

  Scenario: "Plans" should display with a count on the summary

  Scenario: 4-Tier quotes should display "Contributions" with a breakdown by EE | SP | CH | SP + CH

  Scenario: ACA Age-Rated quotes should display "Contributions" with a breakdown by EE | SP | CH | SP + CH

  Scenario: life quotes should display "Contributions" with a breakdown by

  Scenario: 3-Tier quotes should display "Contributions" with a breakdown by EE | 1 Dependent | 2+ Dependents

  Scenario: Percent contributions should display with a breakdown of X% EE | X% SP | X% CH | X% SP + CH

  Scenario: Percent contributions should display with a breakdown of $X EE | $X SP | $X CH | $X SP + CH

  Scenario: "Target Plan" should display for a medical quote with "No Target Plan" or the target plan name

  Scenario: "DEP Rollover" should display for a medical quote with a value of "No" or "Yes"
