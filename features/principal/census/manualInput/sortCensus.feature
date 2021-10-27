@principal @census @censusManual @sortCensus @wip
Feature: Sort Census
  As a Requester
  I need to be have census page elements working properly
  So I can see and handle data in a way that best suits my workflow

  Background:
    Given I login as a "Requester"
    And I have a group with census

  Scenario: Every column on the census by default should have a header displayed at the top of the census

  @minor
  Scenario: Clicking toggle button shows/hides census header

  @minor
  Scenario: User should be able to navigate between census tabs

  Scenario: Fields on the census should be able to be sorted in ascending and descending order

  Scenario: Empty census values should be sorted first/last in the list

  Scenario: User should be able to download census in predefined format
    When I select to download my census
    Then Census file is downloaded using Principal census template format

  Scenario: Clicking Census Requirements button displays dialog that contains the list of requirements
