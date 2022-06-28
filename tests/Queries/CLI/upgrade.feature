Feature: upgrade method in pocket-core cli's query namespace
    Scenario: 242 Gets the latest gov upgrade
        Given a pocket core node
        And a genesis file query-upgrade-genesis-step1.json
        When I use query namespace
        And I use mehtod upgrade
        Then the CLI should respond a message with:
        "{number number}"

    Scenario: 245 Send invalid height
        Given a pocket core node
        And a genesis file query-upgrade-genesis-step2.json
        When I use query namespace
        And I use mehtod upgrade
        And I send the parameter height 5600000
        Then the CLI should respond a message with:
        {
            "codespace":"sdk",
            "code":1,
            "message":"failed to load state at height 5600000; failed to get Store: no data (latest height: 5267)"
        }