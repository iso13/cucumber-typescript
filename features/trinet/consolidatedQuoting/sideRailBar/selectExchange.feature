@trinet @selectExchange @carlos @wip
Feature: Select exchange
  As a Broker
  I need the ability to select an exchange only one time for all of my benefits
  So that I can bill the quotes created

  @blocker
  Scenario: Marketplace dropdown should be labeled as 'Exchange'

  @blocker
  Scenario: Validate quoting options are disabled if no exchage has been selected

  @blocker
  Scenario: Selectable options should be the list of exchanges that the logged-in user has permissions to quote
    |Permission      |users           |
    |All exchanges   |Admin           |
    |three exchanges |primary owner   |
    |two exchanges   |secondary owner |

  @blocker
  Scenario: Exchange selection dropdown should be flagged in red if no exchange has been selected

  @blocker
  Scenario: Exchange is auto-selected if the logged-in user has permissions for 1 exchange only

  @critical
  Scenario: Exchange other than exchange XI is auto-selected when logged-in user has permission to quote 2 exchange and one of them is exchange XI

  @critical
  Scenario: Exchange should NOT be auto-selected when Logged-in user has permission to quote 2 exchanges and none of them is exchange XI

  @critical
  Scenario: Exchange should NOT be auto-selected when Logged-in user has permission to quote 3 or more exchanges

  @blocker
  Scenario: A notification dialog is displayed upon a user changes the selected exchange after creating one or more quotes
    |Validations            |
    |Modal header content   |
    |Modal body content     |
    |Ok button displayed    |
    |Cancel button displayed|

  @blocker
  Scenario: Quotes created should be deleted upon confirmation on "Confirm Exchange Selection" dialog on exchange update/change

  @critical
  Scenario: Available plans are listed based of the exchange selection

  @critical
  Scenario: Available plans list is updated when exchange selection is changed/updated

  @critical
  Scenario: Once exchange is selected users should not be able to clear the exchange selection (return to none value)
