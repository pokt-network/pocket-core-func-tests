Feature: Unjail method in pocket-core rpc endpoint
    Scenario: Should unjail a node.
        Given a pocket core node
        And a genesis file nodes-unjail-genesis-step1.json
        And a node exist with address ED7B858387905068B45022A7AB2B4952F2C97AAE
        And the node property of jailed is true
        And I use namespace nodes
        And I use method unjail
        And I send the parameters: 
            "
            address: ED7B858387905068B45022A7AB2B4952F2C97AAE
            "
        And the CLI shows a message:
            "Transaction submitted: TxHash"
        When I send the HTTP POST request to v1/query/tx endpoint
        And I send the body request with:
            {
                 "hash": "TxHash"
            }
        Then the POST response should contain a transaction detail:
        {
            "hash":"E62559F21D92E8F1837E18DB04196AB7104DF1BFED656E99F71713CD048CBA12",
            "height":21110,
            "index":0,
            "proof":{
                "data":null,
                "proof":{
                    "aunts":null,
                    "index":0,
                    "leaf_hash":null,
                    "total":0
                
            },
                "root_hash":""
            
            },
            "tx":"pgHbCxcNChp2SKUBChTte4WDh5BQaLRQIqerK0lS8sl6rhIPCgV1cG9rdBIGMTAwMDAwGmkKJZ1UR3QgHBoHk/qfDKkKt4XhWuWqJ7uECQ92a6uSvBso/wdsuSESQNhfJtQah1Bwl7PWmaGZzGdR/oeya02AK95WT+JWZTws/aiKWykzT0rIaK+gqLyu5sDrM8Cabs4yGx2HX8+UMAIo4c3J79WEr6gx",
            "tx_result":{
                "code":105,
                "codespace":"pos",
                "data":null,
                "events":[
                    {
                        "attributes":[
                        {
                            "key":"YWN0aW9u",
                            "value":"dW5qYWlsX3ZhbGlkYXRvcg=="
                        
            }
                        
            ],
                        "type":"message"
                    
            }
                
            ],
                "gasUsed":"0",
                "gasWanted":"0",
                "info":"",
                "log":"[{\"msg_index\":0,\"success\":false,\"log\":\"{\\\"codespace\\\":\\\"pos\\\",\\\"code\\\":105,\\\"message\\\":\\\"validator not jailed, cannot be unjailed\\\"}\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"unjail_validator\"}]}]}]"
            
            }
            }
