@core @proposal @tableRates @wip @jorge
Feature: Table rates
  As a Broker
  I want to have table rates displayed for age banded plans
  So that I can provide rates for each age for each plan to my clients

  @critical
  Scenario: Table rates should only show for quotes containing all age banded plans. If a 4 tier plan is on the quote then table rates should not show

  @critical
  Scenario: Table rates should show for market snapshot, standard modeling, custom, and published plans

  Scenario: Carrier and marketplace logos should display for each plan with the plan name displayed below

  Scenario: Age banded rates should start from 0-14 and finish at 64-100

  Scenario: If a plan contains smoker rates then the plan should be broken out into smoker and non smoker rates for each age band
