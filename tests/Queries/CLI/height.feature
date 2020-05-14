Feature: height method in pocket-core cli's query namespace

    Scenario: Returns the height of the pocket core network
        Given a pocket core node
        And a genesis file query-height-genesis-step1.json
        And a pocket core network is running
        When I use pocket query namespace
        And I use the method height
        Then the CLI should show a message indicating:
            "Block Height: 4390"