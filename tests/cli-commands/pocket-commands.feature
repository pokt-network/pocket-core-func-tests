Scenario: Pocket main commands
    Given that the user has Pocket Network latest version installed.
    When typing in "pocket help"
    Then user should be able to see following list of available commands and description as Examples:
    | command  | description  |:
    {
        accounts    account management
        apps        application management
        help        Help about any command
        nodes       node management
        query       query the blockchain
        reset       reset pocket-core
        start       starts pocket-core daemon
        util        utilities
        version     Get current version
    } 