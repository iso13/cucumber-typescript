@core @assignRatesByAge @wip
Feature: Assign rates by age
  As a Broker
  I need rates to be applied based on a members date of birth and quote effective date
  So that I am using the age of the member when the quote becomes effective

  Scenario: A member whose birthday falls the day before the group quote effective date should have a rate for their new birthday

  Scenario: A member whose birthday falls the day of the group effective date should have a rate for their new birthday

  Scenario: A members whose birthday falls the day after the quote effective date should receive the rate of their age before their birthday was triggered

  @critical @diego
  Scenario: Current and renewal should use the configure quote effective date for calculating ages and rates
