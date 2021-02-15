Scenario: User wants to stop pocket
    Given that user has Pocket installed and running
    And wants to stop pocket
    When user types in "pocket stop"
    And user specifies or not the --datadir or --company flags
    Then user should see the node stopping and stop sincying as when "cmd + C" was pressed.