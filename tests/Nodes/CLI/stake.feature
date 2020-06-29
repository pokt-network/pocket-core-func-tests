Feature: stake method in pocket-core cli's nodes namespace
    Scenario: Should stake the correct amount.
        Given a pocket core node with <chainID>
        And a genesis file "nodes-stake-genesis.json"
        And a node exist with address df82af89fea299911f8cdac747de72b6bdb1468d
        And the network has blockchain id 0011 support
        And the node has an url of http://www.pocket-core-testnet0:8081
        And user wants to stake this node into the network
        When typing "pocket nodes stake <fromAddr> <amount> <chains> <serviceURI> <chainID> <fees>", lower than pos/StakeMinimum
        And I send the parameters: 
            "
            fromAddr: df82af89fea299911f8cdac747de72b6bdb1468d
            amount: 50000000
            chains: 0011
            serviceURI: http://www.pocket-core-testnet0:8081
            chainID: pocket-testet-playground
            fees: 50000
            "
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        Then the CLI should show a message:
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
                                        "value": "stake_validator"
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
                "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"stake_validator\"}]}]}]",
                "txhash": "568DFE433132CB61A30C05995439F7829CC610EDC562C5713421A240E72B57C4"
            }|

    Scenario: Using non existent address
        Given a pocket core node
        And a genesis file "nodes-stake-genesis.json"
        And a node doesn't exist with address ed7b858387905068b45022a7ab2b4952f2aa7aae
        And the node has upokt available
        And the node supports blochainid 0001
        And the node has an url of http://node1-tostake.com
        And user wants to stake this node into the network
        When typing "pocket nodes stake <fromAddr> <amount> <chains> <serviceURI> <chainID> <fees>", lower than pos/StakeMinimum
        And I send the parameters: 
            "
            fromAddr: ed7b858387905068b45022a7ab2b4952f2aa7aae
            amount: 50000000
            chains: 0011
            serviceURI: http://node1-tostake.com
            chainID: pocket-testet-playground
            fees: 50000
            "
        Then the CLI should show a message:
            "key with address ED7B858387905068B45022A7AB2B4952F2AA7AAE not found"

    Scenario: Sending transaction with insufficient founds
        Given a pocket core node with <chainID>
        And a genesis file "nodes-stake-genesis.json"
        And a node exist with address df82af89fea299911f8cdac747de72b6bdb1468d
        And the network has blockchain id 0011 support
        And the node has an url of http://www.pocket-core-testnet0:8081
        And user wants to stake this node into the network
        When typing "pocket nodes stake <fromAddr> <amount> <chains> <serviceURI> <chainID> <fees>", lower than pos/StakeMinimum
        And I send the parameters: 
            "
            fromAddr: df82af89fea299911f8cdac747de72b6bdb1468d
            amount: 50000000
            chains: 0011
            serviceURI: http://www.pocket-core-testnet0:8081
            chainID: pocket-testet-playground
            fees: 50000
            "
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        Then the CLI should show a message:
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
                                    "value": "stake_validator"
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
            "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"stake_validator\"}]}]}]",
            "txhash": "F4F4504D2F28970B8B241B64E810189225F7337866D0D4EE8A3B02DAF95932E6"
        }|
        Then querying the tx should return success: false
        |
        http://localhost:8081/v1/query/tx
        {
            "hash": "F4F4504D2F28970B8B241B64E810189225F7337866D0D4EE8A3B02DAF95932E6",
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
            "tx": "8gHbCxcNCmcuxDhKCiWdVEd0IIg8w55/cyWbTVy2AaMlGRE3PmwQIh5fO4HDIcr10WQDEgQwMDExGg41MDAwMDAwMDAwMDAwMCIkaHR0cDovL3d3dy5wb2NrZXQtY29yZS10ZXN0bmV0MDo4MDgxEg4KBXVwb2t0EgU1MDAwMBppCiWdVEd0IIg8w55/cyWbTVy2AaMlGRE3PmwQIh5fO4HDIcr10WQDEkBD9q2xY4yariOcn3w3kgATfiOq3iNmS0HqEf1+5MI5LOZqNwUjc3ioRaGitsEF3uMD9OXVNfXAorM9QBX9gekFKIahgKO89NH8Ww==",
            "tx_result": {
                "code": 110,
                "codespace": "pos",
                "data": null,
                "events": [
                    {
                        "attributes": [
                            {
                                "key": "YWN0aW9u",
                                "value": "c3Rha2VfdmFsaWRhdG9y"
                            }
                        ],
                        "type": "message"
                    }
                ],
                "gasUsed": "0",
                "gasWanted": "0",
                "info": "",
                "log": "[{\"msg_index\":0,\"success\":false,\"log\":\"{\\\"codespace\\\":\\\"pos\\\",\\\"code\\\":110,\\\"message\\\":\\\"validator status is not valid\\\"}\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"stake_validator\"}]}]},{\"msg_index\":0,\"success\":true,\"log\":\"{\\\"codespace\\\":\\\"pos\\\",\\\"code\\\":110,\\\"message\\\":\\\"validator status is not valid\\\"}\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"stake_validator\"}]}]}]"
            }
        }|