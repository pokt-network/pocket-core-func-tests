Feature: /v1/query/tx
    Scenario: 248 Return a node's transaction detail
        Given a pocket core node
        And a genesis file query-accounttxs-genesis-step1.json
        And an account with the address 197e4d46009879f28f978a90627c7dfeab64b4777afcc24e2b9c3d72b4dada22 exists in the pocket core network
        When I send a HTTP POST request to /v1/query/accounttxs endpoint
        And the HTTP body request has the parameters of
        {
            "address": "197e4d46009879f28f978a90627c7dfeab64b4777afcc24e2b9c3d72b4dada22"
        }
        Then the HTTP response will have a transaction detail indicating:
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

   Scenario: 249 Returns null
        Given a pocket core node
        And a genesis file query-accounttxs-genesis-step2.json
        And an account with the address 19711d46009879f28f978a90627c7dfeab64b4777afcc24e2b9c3d72b4dada22 doesn't exist in the pocket core network
        When I send a HTTP POST request to /v1/query/accounttxs endpoint
        And the body request has the parameters of:
        {
            "address": "197e4d46009879f28f978a90627c7dfeab64b4777afcc24e2b9c3d72b4dada22"
        }
        Then the HTTP response will have a error detail:
        {
            "total_count": 0,
            "txs": null
        }

    Scenario: 250 Invalid chars in address
        Given a pocket core node
        And a genesis file query-transaction-genesis-step3.json
        And a transaction with the hash 19711d46009879f28f978a90627c7dfeab64b4777afcc24e2b9c3d72b4dad@#$ doesn't exist in the pocket core network
        When I send a HTTP POST request to /v1/query/accounttxs endpoint
        And the HTTP body request has the parameters of
        {
            "address": "19711d46009879f28f978a90627c7dfeab64b4777afcc24e2b9c3d72b4dad@#$"
        }
        Then the HTTP resposne should be 
        {
            "code":400,
            "message":"encoding/hex: invalid byte: U+0029 ')'"
        }