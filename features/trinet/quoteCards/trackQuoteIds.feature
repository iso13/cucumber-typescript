@trinet @trackQuoteIDs @wip @eduardo
Feature: Track quote ids
  As a Broker
  I want each quote to have a human readable id
  So that I can keep track of quotes created

  @critical
  Scenario: Creation of a quote should cause the quote ID count to increment by 1 and display on the quote card

  @critical
  Scenario: Duplication of a quote should cause the quote ID count to increment by 1 and display on the quote card

  @critical
  Scenario: Deletion of a quote should not cause the quote ID count to decrement by 1

  @critical
  Scenario: Requoting of a quote should only cause the quote id to increment if the requote was performed to completion

  @critical
  Scenario: Requoted quotes should contain an id for both the old quote and the newly created quote id on the quote card

  Scenario: Unsuccessful creation of a quote should not cause the quote ID count to decrement by 1
