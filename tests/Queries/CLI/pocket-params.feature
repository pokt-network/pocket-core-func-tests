Feature: pocket-params method in pocket-core cli's query namespace
    Scenario: Return supported blockchains at given height
        Given a pocket core node
        And a genesis file query-pocketparams-genesis-step1.json
        And a pocket core network is running
        When I use query namespace
        And I use pocket-params method
        And I use the parameter height 2
        Then the CLI response should be detailing: 
         "claim_expiration":"100",
            "proof_waiting_period":"3",
            "replay_attack_burn_multiplier":"0",
            "session_node_count":"5",
            "supported_blockchains":[
                "0001",
                "0002",
                "0003",
                "..." ]

    Scenario: Return error with incorrect height
        Given a pocket core node
        And a genesis file query-pocketparams-genesis-step1.json
        And a pocket core network is running
        When I use query namespace
        And I use pocket-params method
        And I use the parameter height 99999999
        Then the CLI response should be detailing: 
            "{  
            "codespace" : "sdk",
            "code" : 1,
            "message" : "failed to load state at height 55000; failed to get Store: no data (latest height: 19168)"
            }"