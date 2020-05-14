Feature: balance method in pocket-core cli's query namespace
    Scenario: Return list of all relay batch proofs submitted by node
        Given a pocket core node
        And a genesis file query-nodereceipts-rpc-genesis-step1.json
        And a node exists in the pocket core node with the address 0xA5DE6D4184016708c1040c355F1c958192276DB5
        And the node has receipts available to be retrieve
        When I use namespace query 
        And I use method node-receipts
        And I send parameters of address 0xA5DE6D4184016708c1040c355F1c958192276DB5 and height 2
        Then the CLI response will be a JSON indicating:
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

    Scenario: Returns null for non existent receipts
        Given a pocket core node
        And a genesis file query-nodereceipts-rpc-genesis-step2.json
        And a node exists in the pocket core node with the address 0xA5DE6D4184016708c1040c355F1c958192276DB5
        And the node doesn't have receipts available to be retrieve
        When I use namespace query 
        And I use method node-receipts
        And I send parameters of address 0xA5DE6D4184016708c1040c355F1c958192276DB5 and height 2
        Then the CLI response will be a JSON indicating:
        {
            "null"
        }

    Scenario: Returns null for non existent node
        Given a pocket core node
        And a genesis file query-nodereceipts-rpc-genesis-step3.json
        And a node doesn't exist in the pocket core node with the address 0xA5DE6D4184016708c1040c355F1c958192276DB5
        When I use namespace query 
        And I use method node-receipts
        And I send parameters of address 0xA5DE6D4184016708c1040c355F1c958192276DB5 and height 2
        Then the CLI response will be a JSON indicating:
        {
            "null"
        }  
    
    
    