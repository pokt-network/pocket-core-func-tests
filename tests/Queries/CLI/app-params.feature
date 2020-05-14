Feature: app-params method in pocket-core cli's query namespace
    Scenario: Request valid app height.
        Given a pocket core node
        And a genesis file query-appparams-rpc-genesis-step1.json
        And an application exists in the pocket core network at height 2
        When I use pocket query namespace
        And I use the method app-params
        And the arguments of the method has the height 0
        Then the CLI response should be a message detailing:
            Params:
                Unstaking Time:              1m0s
                Max Applications:            18446744073709551615
                Minimum Stake:     	       1000000
                BaseRelaysPerPOKT            100
                Stability Adjustment         0
                Participation Rate On        false,
        
    Scenario: Request invalid app height.
        Given a pocket core node
        And a genesis file query-appparams-rpc-genesis-step2.json
        And an application doesn't exist in the pocket core network at height 5161534
        When I use pocket query namespace
        And I use the method app-params
        And the arguments of the method has the height 5161534
        Then the CLI response should be a JSON detailing:
            {
                "code":400,
                "message":"{
                \"codespace\":\"sdk\",
                \"code\":1,
                \"message\":\"failed to load state at height 5161534; failed to get Store: no data (latest height: number)\"
                }"
            }
    
    Scenario: Request invalid app height with bad chars.
        Given a pocket core node
        And a genesis file query-appparams-rpc-genesis-step3.json
        And an application exists in the pocket core network
        When I use pocket query namespace
        And I use the method app-params
        And the arguments of the method has the height ^
        Then the CLI response will be an error indicating:
            "strconv.Atoi: parsing \"^\": invalid syntax"