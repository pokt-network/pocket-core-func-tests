Feature: supported-networks method in pocket-core cli's query namespace
    Scenario: 237 Returns list of supported blockchains specified in the height
        Given a pocket core node
        And a genesis file query-supportedchains-genesis-step1.json
        And a pocket core network is running
        When I use the namespace query
        And I use method supported-networks
        And I use the parameters of height 0
        Then the CLI response will be indicating:
            "
                1 : chainID1
                2 : chainID2
                3 : chainID3
                ...
            "

    Scenario: 238 Returns an error code with invalid height
        Given a pocket core node
        And a genesis file query-supportedchains-genesis-step2.json
        And a pocket core network is running
        When I use the namespace query
        And I use method supported-networks
        And I use the parameters of height 999999
        Then the CLI response will be indicating:
        {
            "code":400,
            "message":"{
                "codespace":"sdk",
                "code":1,
                "message":"failed to load state at height -1; failed to get Store: no data (latest height: 4308)"
            }"
        }