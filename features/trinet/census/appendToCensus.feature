@trinet @appendToCensus @wip @carlos
Feature: Append Census
  As a Broker
  I need to be able to append members to my census via uploading a census
  So that I can add new members to my clients group

  @blocker
  Scenario: Upload a new census via the Exchange II/XI templates to my group that will add new members and not clear old members

  @blocker
  Scenario: You should not be able to save appended Census information if the required fields have not been fill in and you should see a pop up
  with the title "Invalid or Missing data"

  @critical
  Scenario: Upload a new census via the Exchange III templates to my group that will add new members and not clear old members

  @critical
  Scenario: Upload a new census via the Quotepad template to my group that will add new members and not clear old members

  @critical
  Scenario: Upload a new census via the Other census feature to my group that will add new members and not clear old members

  Scenario: Upload a new census via the Exchange IV templates to my group that will add new members and not clear old members

  Scenario: Upload a new census with a non-eligible employees then the Total EEs count and the Eligible EEs count should be match with the eligible
  employees in your census file
