@assignRatesByAge @cami
Feature: Assign Rates By Age
  As a User
  I need rates to be applied based on a members date of birth and quote effective date
  So that I am using the age of the member when the quote becomes effective

  Scenario: Rates applied to member on ACA quote should be per his age calculated based of the group quote effective date
  # If birthday falls the day before the group quote effective date should have a rate for their new birthday
  # If birthday falls the day of the group effective date should have a rate for their new birthday
  # If birthday falls the day after the quote effective date should receive the rate of their age before their birthday was triggered
