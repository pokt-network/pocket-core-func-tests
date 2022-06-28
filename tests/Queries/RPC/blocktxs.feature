Feature: /v1/query/blocktxs
    Scenario: 263 Returns all transactions at block height
        Given a pocket core node
        And a genesis file query-blocktxs-genesis-step1.json  
        And transactions have been done in the pocket core network
        When I send a HTTP POST request to /v1/query/blocktxs
        And the HTTP body request has the parameters of
        {
            "height": 0
        }
        Then I should recieve a transactions page detailing:
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

    Scenario: 264 Returns null at invalid block height
        Given a pocket core node
        And a genesis file query-blocktxs-genesis-step1.json  
        And transactions have been done in the pocket core network
        When I send a HTTP POST request to /v1/query/blocktxs
        And the HTTP body request has the parameters of
        {
            "height": 5000
        }
        Then I should recieve a transactions page detailing:
        {
            "total_count":0,
            "txs":null
        }