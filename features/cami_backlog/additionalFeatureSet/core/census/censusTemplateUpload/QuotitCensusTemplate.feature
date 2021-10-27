@censusTemplateUpload @quotitCensusTemplate @core @cami
Feature: Quotit Census Template
  As a User
  I need to be able to upload a Quotit census file to my group
  So I can port my groups from Quotit to QuotePad

  Scenario: Upload a Quotit census
    Given I login as a "<user_role>"
    And I navigate to group '<existingTestGroup>'
    When I upload 'Quotit.xlsx' census file as 'Quotit' census
    And I acknowledge census upload warnings
    And I save classes
    Then the census should save successfully
