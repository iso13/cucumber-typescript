@imageComparisonExamples @wip
# add @principal tag to run
Feature: Image Comparison Examples
  As an Engineer
  I need to be able to do image comparison on screens or elements
  So I can reduce the amount of work related to defining of elements and writing step difinitions
  Documentation: https://github.com/wswebcreation/protractor-image-comparison/blob/master/docs/index.md

  @example1
  Scenario: Check full screen precisely
    Given I launch the application
    When I login using "unknown@limelighthealth.com" as username and "somePass" as password
    Then Full login page should look like expected for the precise credentials

  @example2
  Scenario: Check full screen, ignoring some blacked out areas
    Given I launch the application
    When I login using "unknown@limelighthealth.com" as username and "somePass" as password
    Then Login page should look like expected for any invalid credentials

  @example3
  Scenario: Check single, specific element of the page
    Given I launch the application
    When I login using "unknown@limelighthealth.com" as username and "somePass" as password
    Then The login field should be populated with user's email - precise cut

  @example4
  Scenario: Check single, specific element of the page including some area around it
    Given I launch the application
    When I login using "unknown@limelighthealth.com" as username and "somePass" as password
    Then The login field should be populated with user's email - resized cut

  @example5
  Scenario: Check full scrollable screen
    Given I launch the application
    And I login using "<valid_login>" as username and "<valid_pass>" as password
    When I open to view previously saved proposal "<proposal_id>" in HTML
    Then All the proposal data should look like expected
