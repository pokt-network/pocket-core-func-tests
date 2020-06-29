Feature: unstake method in pocket-core cli's apps namespace
    Scenario: Should unstake to an app.
        Given a pocket core node
        And a genesis file "apps-unstake-genesis.json"
        And a application node exist with address affea0a483bf291b2dedeb98c0ebcb4517e86556
        And the application is staked
        And wants to unstake his APP from the network
        When typing "pocket apps unstake <fromAddr> <chainID> <fees> [flags]"
        And I send the parameters: 
            "
            fromAddr: affea0a483bf291b2dedeb98c0ebcb4517e86556
            chainID: pocket-testet-playground
            fees: 10000
            "
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        Then the CLI should show a message indicating:
            |
            http://localhost:8081/v1/client/rawtx
            {
                "height": "0",
                "logs": [
                    {
                        "events": [
                            {
                                "attributes": [
                                    {
                                        "key": "action",
                                        "value": "app_begin_unstake"
                                    }
                                ],
                                "type": "message"
                            }
                        ],
                        "log": "",
                        "msg_index": 0,
                        "success": true
                    }
                ],
                "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"app_begin_unstake\"}]}]}]",
                "txhash": "9A04C13A683660BFC497C62648342A3CD2B52A3475E6B3E3DE1DAECF1F0667E2"
            }|

    Scenario: Shouldn't unstake a nonexistent app.
        Given a pocket core node
        And a genesis file "apps-unstake-genesis.json"
        And an application doesn't exist with address 7ab712998671b09e1a266ce6901000acb657111b
        And the application node has blockchain id 0011 support
        And wants to unstake this APP into the network
        When typing "pocket apps unstake <fromAddr> <amount> <chains> <chainID> <fees> [flags]"
        And I send the parameters: 
            "
            fromAddr: 7ab712998671b09e1a266ce6901000acb657111b
            chainID: pocket-testet-playground
            fees: 10000
            "
        Then the CLI should show a message:
            "key with address 7ab712998671b09e1a266ce6901000acb657111b not found"
    
    