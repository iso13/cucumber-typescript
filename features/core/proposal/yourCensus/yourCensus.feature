@core @proposal @yourCensus @wip @ferChacon
Feature: Your census
  As a Broker
  I want my census displayed on the proposal
  So that I can present the current state of a group with my proposal

  @critical
  Scenario: Each employees first and last name should be displayed in a numbered list

  @critical
  Scenario: Each dependent should have their first and last name displayed and must be nested below their employee

  Scenario: Date of birth should display for each member on the census

  Scenario: Members that are smokers should have 'Yes' displayed in the tobacco column. Members that are not smokers should display No

  Scenario: The tobacco header should have a smoker count displayed beside the header

  Scenario: Medical, dental, vision, and life tiers should be displayed for both employees and dependents

  Scenario: Currently enrolled should display 'Yes' for a member once their tier is not waived or not eligible

  Scenario: Zip codes should display for all members

  Scenario: If a member is out of state then their state abbreviation should be displayed beside the zip code in red

  Scenario: The county for each member should be displayed based on the census selection(split county zips)

  Scenario: Medical region should be displayed for all members in the group state, those out of state should display 'OOS'

  Scenario: A tier breakdown by code should be displayed for reference below the census table
