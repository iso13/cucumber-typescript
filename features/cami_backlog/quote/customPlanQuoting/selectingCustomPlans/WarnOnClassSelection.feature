@quote @selectingCustomPlans @warnOnClassSelection @review @cami
Feature: Warn User, if not All Classes are Selected for Quoting
  As a User
  I want my plan selection to be validated automatically
  So that I'm warned that not all product classes are selected for quoting

  Scenario: When user selects to quote all job classes within a product line, then no warnings appear

  Scenario: Warning message appears, if user leaves unselected at least one job class

  Scenario: User can proceed to quoting after warning appears

  Scenario: User can go back to plans selection after warning appears

  Scenario: If job class exists, but plan is not designed for it, then no warnings appear after plans selection

  Scenario: Validation for classes inclusion runs for every product independently

  Scenario: Warning prompt contains a list of all product lines and classes, that haven't been selected

  Scenario: User can dismiss the warning dialog from appearing in the future within current user's session
