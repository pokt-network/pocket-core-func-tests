Scenario: 118 User wants to see the pocket version
    Given that user has Pocket installed and running
    And wants to see the pocket actual version
    When user types in "pocket version"
    Then user should see the actual version installed. Examples:
    | Version: RC-0.6.4 |
