Scenario: 131 To stop the pocket process
    Given that user has Pocket installed and running
    And wants to stop pocket
    When user types in "pocket stop"
    And user specifies or not the --datadir or --company flags
    Then user should see the node stopping and stop sincying as when "cmd + C" was pressed.
    |http://localhost:8081/v1/private/stop
    Post http://localhost:8081/v1/private/stop?authtoken=u7Zwt0A6Avb8KRXnQGgWU3aHk: EOF|