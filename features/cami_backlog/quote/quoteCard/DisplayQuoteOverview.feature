@displayQuoteOverview @cami
Feature: Display Quote Overview
  As a User
  I want to see a quote overview on quote cards
  So that I can quickly analyse quotes I intend on selling

  Scenario: BCR -Medical ,Dental, Vision and Life quotes should not display a high chart if there is only 1 plan on the quote

  Scenario: BCR -Medical ,Dental, Vision and Life quotes should show Benefit Comparison Report as label at the bottom of the quote overview

  Scenario: PCR Dental, Vision and Life quotes should only display a high chart if there is only 1 plan on the quote

  Scenario: PCR Standard modeling should always show a high chart on the quote overview

  Scenario: PCR Dental, Vision and Life with more than one plan should show the Pricing Comparison Report as label at the bottom of the quote overview

  Scenario: PCR Dental, Vision and Life with only one plan should only show a Total Cost at the bottom of the quote overview

  Scenario: PCR Medical market snapshot with more than one plan should show "Pricing Comparison Report " as label at the bottom of the quote overview

  Scenario: PCR Medical standard modeling should only show a Total Cost at the bottom of the quote overview

  Scenario: High chart costs should represent the same values as when you navigate into the quote.

  Scenario: Plan count displays in the top right of the quote card of both PCR and BCR quote

  Scenario: Total Cost and Difference from Current should be displayed on Bottom of Standard Modeling Quote if Current quote is present on group.
