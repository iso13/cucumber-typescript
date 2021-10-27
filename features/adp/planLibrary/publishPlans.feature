@adp @publishPlans @planlibrary @wip
Feature: Publish plans
  As a OE or Sales OPs
  I want the ability to publish custom plans
  So I can make them available in group plandesigner

  Scenario:  Set publish start as today and publish ends as today, the plan gets publish.

  Scenario:  Set publish start as today and publish ends as tomorrow, the plan gets publish.

  Scenario:  Set publish start as today and publish ends as the end of the year, the plan gets publish.

  Scenario:  Set publish start as early this year and publish ends as today, the plan gets publish.

  Scenario:  Set publish start as early this year and publish ends as the end of the year, the plan gets publish.

  Scenario:  Set publish start as today and publish ends yesterday, the plan gets unpublished.

  Scenario:  Set publish start as today and publish ends as early this year, the plan gets unpublished.

  Scenario:  Set publish start as the end of the year and publish ends as early this year, the plan gets unpublished.
