Feature: Unjail method in pocket-core cli's nodes namespace
    Scenario: Should unjail a node.
        Given a pocket core node
        And a genesis file "nodes-unjail-genesis.json"
        And a node exist with address 0aad1b44723b909cb0cc5906b77ad0bae9772487
        And the node property of jailed is true
        And the user wants to unjail his node
        When typing "pocket nodes unjail <fromAddr> <chainID> <fees> [flags]"
        And I send the parameters: 
            "
            fromAddr: 0aad1b44723b909cb0cc5906b77ad0bae9772487
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
                                        "value": "unjail_validator"
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
                "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"unjail_validator\"}]}]}]",
                "txhash": "4DFF01B33C05B78EA87AC573259E493921CA8F78D246F8F9372B324CDDF6B9FD"
            }
            |

    Scenario: Unjail a node that's not jailed.
        Given a pocket core node
        And a genesis file "nodes-unjail-genesis.json"
        And a node exist with address df82af89fea299911f8cdac747de72b6bdb1468d
        And the node property of jailed is true
        And the user wants to unjail his node
        When typing "pocket nodes unjail <fromAddr> <chainID> <fees> [flags]"
        And I send the parameters: 
            "
            fromAddr: df82af89fea299911f8cdac747de72b6bdb1468d
            chainID: pocket-testet-playground
            fees: 50000
            "
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        And the details of the transaction should show "success: true"
        |
        Enter Password: 
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
                                    "value": "unjail_validator"
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
            "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"unjail_validator\"}]}]}]",
            "txhash": "BAF59E7BAC808D9F750C9220A264336A7BF4F8D1CBCEED862A7504F4858F776F"
        }|
        Then querying the transaction hash should show "success: false"
        |
        http://localhost:8081/v1/query/tx
        {
            "hash": "BAF59E7BAC808D9F750C9220A264336A7BF4F8D1CBCEED862A7504F4858F776F",
            "height": 1,
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
            "tx": "pgHbCxcNChp2SKUBChTJtjL/YmJg01kK9hS31piSE9g1NhIOCgV1cG9rdBIFNTAwMDAaaQolnVRHdCBgR8ylf1j1W74eDIKcCdUTmGNE0AgegyrxitmVF/xcmRJAA/KYIKbGSRQhb2l/OJhUzCXKzeFpY9HFUlGau5ijz0h3AyylxiBUcnwL/bSUQcHQoBYL6499ZRTcnWP3SdsBCCjVmoCsr/GenssB",
            "tx_result": {
                "code": 105,
                "codespace": "pos",
                "data": null,
                "events": [
                    {
                        "attributes": [
                            {
                                "key": "YWN0aW9u",
                                "value": "dW5qYWlsX3ZhbGlkYXRvcg=="
                            }
                        ],
                        "type": "message"
                    }
                ],
                "gasUsed": "0",
                "gasWanted": "0",
                "info": "",
                "log": "[{\"msg_index\":0,\"success\":false,\"log\":\"{\\\"codespace\\\":\\\"pos\\\",\\\"code\\\":105,\\\"message\\\":\\\"validator not jailed, cannot be unjailed\\\"}\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"unjail_validator\"}]}]},{\"msg_index\":0,\"success\":true,\"log\":\"{\\\"codespace\\\":\\\"pos\\\",\\\"code\\\":105,\\\"message\\\":\\\"validator not jailed, cannot be unjailed\\\"}\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"unjail_validator\"}]}]}]"
            }
        }|

    Scenario: Unjail a node that doesn't exist
        Given a pocket core node
        And a genesis file "nodes-unjail-genesis.json"
        And a node exist with address ed7b858387905068b45022a7ab2b4952f2c9aaaa
        And the node property of jailed is true
        And the user wants to unjail his node
        When typing "pocket nodes unjail <fromAddr> <chainID> <fees> [flags]"
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
        When typing "pocket nodes unjail <fromAddr> <chainID> <fees> [flags]"
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

    