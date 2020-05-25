Feature: Unstake method in pocket-core rpc endpoint
    Scenario: Should unstaked a node.
        Given a pocket core node
        And a genesis file nodes-unstake-genesis-step1.json
        And a node exist with address ED7B858387905068B45022A7AB2B4952F2C97AAE
        And the node property of jailed is true
        And I use namespace nodes
        And I use method unstake
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
        Then the POST response should contain a JSON transaction detail:
        {   
            "hash":"9D0BF1BE33B65E6A772801F6C3888F89AD959D1FDB75FEAEFBBFC37AA94FD5C9",
            "height":21145,
            "index":0,
            "proof":{      "data":null,
                "proof":{
                    "aunts":null,
                    "index":0,
                    "leaf_hash":null,
                    "total":0
                
            },
                "root_hash":""
            
            },
            "tx":"pwHbCxcNChrJR9B8ChR6txKZhnGwnhombOaQEACstleDOxIPCgV1cG9rdBIGMTAwMDAwGmkKJZ1UR3Qg4KQiP9QeI7OkMrIZ2XC5m/Yufv1UZ/jqB+4pvNUfGwgSQFeoEZRPBToisdeWm/MM5PUTtw70U/2DUWKZp7fgdJkjCaWiy73dcuQLBK9iVAhaIljwuBoGZQNGv6tNFWu0UQsoxKCZxPKZ2KqAAQ==",
            "tx_result":{      "code":0,
                "codespace":"",
                "data":null,
                "events":[         {            "attributes":[               {
                            "key":"YWN0aW9u",
                            "value":"YmVnaW5fdW5zdGFrZV92YWxpZGF0b3I="
                        
            }
                        
            ],
                        "type":"message"
                    
            },
                    {            "attributes":[               {
                            "key":"bW9kdWxl",
                            "value":"cG9z"
                        
            },
                        {
                            "key":"c2VuZGVy",
                            "value":"N2FiNzEyOTk4NjcxYjA5ZTFhMjY2Y2U2OTAxMDAwYWNiNjU3ODMzYg=="
                        
            }
                        
            ],
                        "type":"waiting_to_begin_unstaking"
                    
            },
                    {            "attributes":[               {
                            "key":"bW9kdWxl",
                            "value":"cG9z"
                        
            },
                        {
                            "key":"c2VuZGVy",
                            "value":"N2FiNzEyOTk4NjcxYjA5ZTFhMjY2Y2U2OTAxMDAwYWNiNjU3ODMzYg=="
                        
            }
                        
            ],
                        "type":"message"
                    
            }
                
            ],
                "gasUsed":"0",
                "gasWanted":"0",
                "info":"",
                "log":"[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"begin_unstake_validator\"},{\"key\":\"module\",\"value\":\"pos\"},{\"key\":\"sender\",\"value\":\"7ab712998671b09e1a266ce6901000acb657833b\"}]},{\"type\":\"waiting_to_begin_unstaking\",\"attributes\":[{\"key\":\"module\",\"value\":\"pos\"},{\"key\":\"sender\",\"value\":\"7ab712998671b09e1a266ce6901000acb657833b\"}]}]}]"
            
            }
            }