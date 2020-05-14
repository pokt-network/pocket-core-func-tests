Feature: Account-txs method in pocket-core cli's query namespace
    Scenario: Returns transactions
        Given a pocket core node
        And a genesis file query-accounttxs-genesis-step1.json
        And an account with the address 19711d46009879f28f978a90627c7dfeab64b4777afcc24e2b9c3d72b4dada22 exists in the pocket core network
        When I use pocket query namespace
        And I use the method account-txs
        And the arguments of the method has the account address as 4920ce1d787c60e2eaeff366c79e8aa2b82525f1, page 1, per_page 100
        Then the CLI response should be detailing:
        {
        "txs": [
            {
            "hash": "string",
            "height": 0,
            "index": 0,
            "tx_result": {
                "code": 0,
                "data": "string",
                "log": "string",
                "info": "string",
                "gas_wanted": 0,
                "gas_used": 0,
                "events": [
                "string"
                ],
                "codespace": "string"
            },
            "tx": "string",
            "proof": {
                "root_hash": "string",
                "data": "string",
                "proof": {
                "total": 0,
                "index": 0,
                "leaf_hash": "string",
                "aunts": [
                    "string"
                ]
                }
            }
            }
        ],
        "total_count": "string"
        }

   Scenario: Returns null
        Given a pocket core node
        And a genesis file query-accounttxs-genesis-step2.json
        And an account with the address 19711d46009879f28f978a90627c7dfeab64b4777afcc24e2b9c3d72b4dada22 doesn't exist in the pocket core network
        When I use pocket query namespace
        And I use the method account-txs
        And the arguments of the method has the account address as 4920ce1d787c60e2eaeff366c79e8aa2b82525f1, page 1, per_page 100
        Then the CLI response should be detailing:
        {
            "txs":null,
            "total_count":0
        }

    Scenario: Invalid chars in address
        Given a pocket core node
        And a genesis file query-transaction-genesis-step3.json
        And an account with the address "19711d46009879f28f978a90627c7dfeab64b4777afcc24e2b9c3d72b4dad@#$" doesn't exist in the pocket core network
        When I use pocket query namespace
        And I use the method account-txs
        And the arguments of the method has the account address as "19711d46009879f28f978a90627c7dfeab64b4777afcc24e2b9c3d72b4dad@#$", page 1, per_page 100
        Then the CLI response should be detailing:
            "encoding/hex: invalid byte: U+0029 ')'"