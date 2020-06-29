Feature: stake method in pocket-core cli's apps namespace
    Scenario: Should stake to an app.
        Given a pocket core node with <chainID>
        And a genesis file "apps-stake-genesis.json"
        And a application exists with address dda45773aeed9fb8a6aeb4831ffdf55cec1083ad
        And the application has blockchain id 0011 support
        And wants to stake his APP into the network
        When typing "pocket apps stake <fromAddr> <amount> <chains> <chainID> <fees> [flags]"
        And I send the parameters: 
            "
            fromAddr: dda45773aeed9fb8a6aeb4831ffdf55cec1083ad
            amount: 50000000
            chains: 0011
            chainID: pocket-testet-playground
            fees: 50000
            "
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        Then user receives details of the transaction
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
                                            "value": "app_stake"
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
                    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"app_stake\"}]}]}]",
                    "txhash": "198E3EBC9FB2E2DA8834545AEA412B64658BBC396B5945D0F4A21D5F99969E9B"
                }|

    Scenario: Shouldn't stake a nonexistent app.
        Given a pocket core node
        And a genesis file "apps-stake-genesis.json"
        And an application node doesn't exist with address 7ab712998671b09e1a266ce6901000acb657111b
        And the application node has blockchain id 0011 support
        And wants to stake his APP into the network
        When typing "pocket apps stake <fromAddr> <amount> <chains> <chainID> <fees> [flags]"
        And I send the parameters: 
            "
            fromAddraddress: 7ab712998671b09e1a266ce6901000acb657111b
            amount: 50000000
            chains: 0011
            chainID: pocket-testet-playground
            fees: 50000
            "
        Then the CLI should show a message:
            "key with address 7ab712998671b09e1a266ce6901000acb657111b not found"