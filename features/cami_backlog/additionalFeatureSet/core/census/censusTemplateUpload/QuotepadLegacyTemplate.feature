@censusTemplateUpload @quotepadLegacyCensusTemplate @core @cami
Feature: Quotepad Legacy Census Template
  As a User
  I need to be able to upload a Quotepad legacy census file to my group
  So I can import all my clients group data into Quotepad

  Scenario: Upload a QuotePad legacy template
    Given I login as a "<user_role>"
    And I navigate to group '<existingTestGroup>'
    When I upload 'QuotepadLegacy.xlsx' census file as 'Quotepad Legacy' census
    And I acknowledge census upload warnings
    And I save classes
    Then the census should save successfully
