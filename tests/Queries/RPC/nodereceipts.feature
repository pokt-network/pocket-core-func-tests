Feature: /v1/query/nodereceipts
    Scenario: 275 Return list of all relay batch proofs submitted by node
        Given a pocket core node
        And a genesis file query-nodereceipts-rpc-genesis-step1.json
        And a node exists in the pocket core node with the address 0xA5DE6D4184016708c1040c355F1c958192276DB5
        And the node has receipts available to be retrieve
        When I send an HTTP POST request to /v1/query/nodereceipts
        And the HTTP POST body request has the parameteters:
        {
            "address": "0xA5DE6D4184016708c1040c355F1c958192276DB5",
            "height": 2
        }
        Then the HTTP response will be a nodes detail indicating:
        {
            "nodes": [
                {
                    "session_header": {
                        "app_public_key": "string",
                        "chain": "string",
                        "session_height": 0
                },
                    "servicer_address": "string",
                    "total_relays": 0
                }
            ]
        }

    Scenario: 276 Returns null for non existent receipts
        Given a pocket core node
        And a genesis file query-nodereceipts-rpc-genesis-step2.json
        And a node exists in the pocket core node with the address 0xA5DE6D4184016708c1040c355F1c958192276DB5
        And the node doesn't have receipts available to be retrieve
        When I send an HTTP POST request to /v1/query/nodereceipts
        And the HTTP POST body request has the parameteters:
        {
            "address": "0xA5DE6D4184016708c1040c355F1c958192276DB5",
            "height": 2
        }
        Then the HTTP response will be a nodes detail indicating:
        {
            "null"
        }

    Scenario: 277 Returns null for non existent node
        Given a pocket core node
        And a genesis file query-nodereceipts-rpc-genesis-step3.json
        And a node doesn't in the pocket core node with the address 0xA5DE6D4184016708c1040c355F1c958192276DB5
        When I send an HTTP POST request to /v1/query/nodereceipts
        And the HTTP POST body request has the parameteters:
        {
            "address": "0xA5DE6D4184016708c1040c355F1c958192276DB5",
            "height": 2
        }
        Then the HTTP response will be a nodes detail indicating:
        {
            "null"
        }  
    
    
    