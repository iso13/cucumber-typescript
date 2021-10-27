@core @createProposal
Feature: Create Proposals
  As a Broker
  I want to create proposals
  So that I can propose new quotes for the upcoming year to my clients

  Background:
    Given I login as a "Broker"
    And I have a published "medical" quote

  @blocker @MSTR-1229 @MSTR-1316 @MSTR-1646
  Scenario: Create a proposal with a published ACA Age-Rated medical standard modeling quote
    When I create a proposal with a published medical quote
    Then A proposal should be successfully created for my group

  @wip @critical @jorge
  Scenario: Create a proposal with a published 4-Tier Composite medical standard modeling quote

  @wip @critical @jorge
  Scenario: Create a proposal with custom medical, dental, vision and life quotes

  @wip @critical @jorge
  Scenario: Create a proposal with a published medical market snapshot quote

  @wip
  Scenario: Create a proposal with a custom 4-Tier Composite medical standard modeling quote

  @wip
  Scenario: Create a proposal with a custom ACA Age-Rated medical standard modeling quote

  @wip
  Scenario: Create a proposal with a custom medical market snapshot quote

  @wip
  Scenario: Create a proposal with a published 4-Tier dental quote

  @wip
  Scenario: Create a proposal with a custom 3-Tier dental quote

  @wip
  Scenario: Create a proposal with a published 4-Tier vision quote

  @wip
  Scenario: Create a proposal with a custom 3-Tier vision quote

  @wip
  Scenario: Create a proposal with a published life quote

  @wip
  Scenario: Create a proposal with a published life quote with AD&D not included

  @wip
  Scenario: Create a proposal with medical current, renewal and a real time quote

  @wip
  Scenario: Create a proposal with dental current, renewal and a real time quote

  @wip
  Scenario: Create a proposal with vision current, renewal and a real time quote

  @wip
  Scenario: Create a proposal with life current, renewal and a real time quote

  @wip
  Scenario: Create a proposal using a unique name
