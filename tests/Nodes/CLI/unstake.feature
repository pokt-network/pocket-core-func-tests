Feature: Unstake method in pocket-core cli's nodes namespace
    Scenario: Should unstaked a node.
        Given that the user has Pocket Network with <chainID>
        And a genesis file "nodes-unstake-genesis.json"
        And a node exist with address c9b632ff626260d3590af614b7d6989213d83536
        And the node is staked
        When typing "pocket nodes unstake <fromAddr> <chainID> <fees> [flags]"
        And I send the parameters: 
            "
            fromAddr: c9b632ff626260d3590af614b7d6989213d83536
            chainID: pocket-testet-playground
            fees: 50000
            "
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        And the details of the transaction should show "success: true"
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
                                    "value": "begin_unstake_validator"
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
            "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"begin_unstake_validator\"}]}]}]",
            "txhash": "D5DB96F23E06A30485395AEEE1F832134631D88634571D11C5A792959088051E"
        }|

    Scenario: Unstaked a node that's not staked.
        Given a pocket core node
        And a genesis file "nodes-unstake-genesis.json"
        And a node exist with address df82af89fea299911f8cdac747de72b6bdb1468d
        And the node is staked
        When typing "pocket nodes unstake <fromAddr> <chainID> <fees> [flags]"
        And I send the parameters: 
            "
            fromAddr: df82af89fea299911f8cdac747de72b6bdb1468d
            chainID: pocket-testet-playground
            fees: 50000
            "
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        And the details of the transaction should show:
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
                                    "value": "begin_unstake_validator"
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
            "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"begin_unstake_validator\"}]}]}]",
            "txhash": "812932E45B9591EB10F8425255F0ECC3C66CAF7D50EF7A1D46A7038B53428DD8"
        }|
        Then querying the tx hash should show "success: false":
        |
        /v1/query/tx
        http://localhost:8081/v1/query/tx
        {
            "hash": "812932E45B9591EB10F8425255F0ECC3C66CAF7D50EF7A1D46A7038B53428DD8",
            "height": 2,
            "index": 0,
            "proof": {
                "data": null,
                "proof": {
                    "aunts": null,
                    "index": 0,
                    "leaf_hash": null,
                    "total": 0
                },
                "root_hash": ""
            },
            "tx": "pgHbCxcNChrJR9B8ChTfgq+J/qKZkR+M2sdH3nK2vbFGjRIOCgV1cG9rdBIFNTAwMDAaaQolnVRHdCCIPMOef3Mlm01ctgGjJRkRNz5sECIeXzuBwyHK9dFkAxJAl1QquLtKc6LSmLe49szqDTMg9I5UgOfwaGprAMYvto+M1SY10c3RqMy8wu3ffyw8r5SuBfFXbN5w1MdmjTFRBSjzx8PqytTyxs0B",
            "tx_result": {
                "code": 101,
                "codespace": "pos",
                "data": null,
                "events": [
                    {
                        "attributes": [
                            {
                                "key": "YWN0aW9u",
                                "value": "YmVnaW5fdW5zdGFrZV92YWxpZGF0b3I="
                            }
                        ],
                        "type": "message"
                    }
                ],
                "gasUsed": "0",
                "gasWanted": "0",
                "info": "",
                "log": "[{\"msg_index\":0,\"success\":false,\"log\":\"{\\\"codespace\\\":\\\"pos\\\",\\\"code\\\":101,\\\"message\\\":\\\"validator does not exist for that address\\\"}\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"begin_unstake_validator\"}]}]},{\"msg_index\":0,\"success\":true,\"log\":\"{\\\"codespace\\\":\\\"pos\\\",\\\"code\\\":101,\\\"message\\\":\\\"validator does not exist for that address\\\"}\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"begin_unstake_validator\"}]}]}]"
            }
        }|

    Scenario: unstake a node that doesn't exist
        Given a pocket core node
        And a genesis file "nodes-unstake-genesis.json"
        And a node exist with address ed7b858387905068b45022a7ab2b4952f2c9aaaa
        And the node is staked
        When typing "pocket nodes unstake <fromAddr> <chainID> <fees> [flags]"
        And I send the parameters: 
            "
            fromAddr: ed7b858387905068b45022a7ab2b4952f2c9aaaa
            chainID: pocket-testet-playground
            fees: 50000
            "
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        Then the CLI should show a message:
            "panic: key with address ed7b858387905068b45022a7ab2b4952f2c9aaaa not found"

    Scenario: Use invalid chars in address
        Given a pocket core node
        And a genesis file "nodes-unjail-genesis.json"
        And a node doesn't exist with address 0aad1b44723b909cb0cc5906b77ad0bae9772487@$AAAA
        And the user wants to unjail his node
        When typing "pocket nodes unstake <fromAddr> <chainID> <fees> [flags]"
        And I send the parameters: 
            "
            address: 0aad1b44723b909cb0cc5906b77ad0bae9772487@$AAAA
            chainID: pocket-testet-playground
            fees: 50000
            "
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        Then the CLI should show a message:
            "encoding/hex: invalid byte: U+0040 '@'"

    