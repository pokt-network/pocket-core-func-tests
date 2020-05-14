Feature: supply method in pocket-core cli's query namespace
    Scenario: Returns the list of node params specified in the height
        Given a pocket core node
        And a genesis file query-supply-genesis-step1.json
        And a pocket core network is running
        When I use query namespace
        And I use supply method
        And the parameter I send is height 0
        Then the CLI response will be indicating:
        {
            "Nodes Staked": 0,
            "Apps Staked": 0,
            "Dao Supplu": 0,
            "Total Staked": 0,
            "Total Unstaked": 0,
            "Total Supply": 0
        }
    
    Scenario: Returns error code with wrong height
        Given a pocket core node
        And a genesis file query-supply-genesis-step1.json
        And a pocket core network is running
        When I use query namespace
        And I use supply method
        And the parameter I send is height 999999
        Then the CLI response will be indicating:    
        {
            "code":400,
            "message":"{
                "codespace":"sdk",
                "code":1,
                "message":"failed to load state at height -1; failed to get Store: no data (latest height: 4308)"
            }"
        }
        