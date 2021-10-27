@trinet @selectionToggle @wip @carlos

Feature: Sidebar container feature
  As a Broker
  I want the ability to define and reference essential benefit type information for the proposal output
  So that I can quickly assess/create or remove the plan groupings for the products available on the proposal

  @blocker
  Scenario: Follow the consolidate quoting PCR workflow for any exchange to ensure the sidebar persist through every screen of the process

  @blocker
  Scenario: Follow the consolidate quoting BCR workflow for any exchange to ensure the sidebar persist through every screen of the process

  @blocker
  Scenario: When the user enters the consolidated quoting UI ensure the default state of the sidebar and its elements
    |Example of default state|
    |sidebar should be expanded by default|
    |sidebar should be fixed to the left edge of the screen|
    |There should be a caret symbol to expand or collapse the left rail|

  @blocker
  Scenario: Verify the following subcomponents are displayed in the sidebar
    |components to validate|
    |exchange selection|
    |Pricing Comparision toggle|

  @blocker
  Scenario: When quoting a product validate it is displayed on the sidebar along with their sub-elements
    |Example of products|
    |medical |
    |dental  |
    |vision  |
    |life    |
    |STD     |
    |LTD     |

  @critical
  Scenario: Follow the consolidate quoting PCR workflow and validate the sidebar auto-collapse when there are not action required through the workflow

  @critical
  Scenario: Follow the consolidate quoting BCR workflow and validate the sidebar auto-collapse when there are not action required through the workflow

  @critical
  Scenario: Follow the consolidate quoting PCR workflow and validate the sidebar is not auto-collapsing when there are actions pending in the workflow

  @critical
  Scenario: Follow the consolidate quoting BCR workflow and validate the sidebar is not auto-collapsing when there are actions pending in the workflow

  @critical
  Scenario: Auto-collapse should occur only once in a particular consolidate quoting session
    |example                           |result                           |
    |user manually expands the sidebar |it should not auto-collapse again|

  @critical
  Scenario: Dynamic scroll function should display when the Product Sidebars consume more vertical space than the available
    |element                |position  |
    |product sidebar        |scrollable|
    |marketplace (Exchange) |fixed     |
    |report type            |fixed     |

  @critical
  Scenario: When the sidebar is collapsed it should highlight the product that is active at the moment of collapsing

  @critical
  Scenario: An icon with the '+' sign should be displayed next to the product displayed

  @critical
  Scenario: A trash can icon should be displayed next to the quotes already created for any of the products available.

  @api
  Scenario: Via org settings ensure sub-components can be disabled for a user and hidden from side bar
   |sub-component|
   |medical      |
   |dental       |
   |vision       |
   |life         |
   |STD          |
   |LTD          |

  @api
  Scenario: Via org settings ensure sub-components can be enabled for a user and hidden from side bar
   |sub-component|
   |medical      |
   |dental       |
   |vision       |
   |life         |
   |STD          |
   |LTD          |

  @api
  Scenario: Via org settings ensure exchanges can be disabled for a user and hidden from side bar
   |exchange     |
   |exchange I   |
   |exchange IV  |

  @api
  Scenario: Via org settings ensure exchanges can be enabled for a user and hidden from side bar
   |exchange     |
   |exchange III |
   |exchange II  |
