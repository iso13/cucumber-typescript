@transamerica @ViewAvailableDynamicColumnsByRole @major @dev
Feature: View Available Dynamic Columns By Role
  As a Quotepad user
  I need to be able to choose the columns that I want to display
  So that I can see groups with the data that I need for selling purpose

  Scenario: Underwriter can see the columns: Group, Contact, Phone, Email, Sales Exec, Broker, Employees, Effective Date, Due Date, Status, Products/Line of Coverage, Actions
    Given I login as a "underwriter"
    When I navigate to group list
    Then I can see the expected columns for my role:
      | Column name               |
      | Group                     |
      | Contact                   |
      | Phone                     |
      | Email                     |
      | Sales Exec                |
      | Broker                    |
      | Employees                 |
      | Effective Date            |
      | Due Date                  |
      | Status                    |
      | Products/Line of Coverage |
      | Actions                   |

  Scenario: Requester can see the columns: Group, Contact, Phone, Email, Sales Exec, Broker, Employees, Effective Date, Status, Products/Line of Coverage, Actions
    Given I login as a "internal_whole_saler"
    When I navigate to group list
    Then I can see the expected columns for my role:
      | Column name               |
      | Group                     |
      | Contact                   |
      | Phone                     |
      | Email                     |
      | Sales Exec                |
      | Broker                    |
      | Employees                 |
      | Effective Date            |
      | Status                    |
      | Products/Line of Coverage |
      | Actions                   |
