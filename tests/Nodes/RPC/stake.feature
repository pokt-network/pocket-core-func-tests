Feature: stake method in pocket-core rpc endpoint
    Scenario: Should stake the correct amount.
        Given a pocket core node
        And a genesis file nodes-stake-genesis-step1.json
        And a node exist with address ED7B858387905068B45022A7AB2B4952F2C97AAE
        And the node has upokt available
        And the node supports blochainid 0001
        And the node has an url of http://node1-tostake.com
        And I use namespace nodes
        And I use method stake
        And I send the parameters: 
            "
            address: ED7B858387905068B45022A7AB2B4952F2C97AAE
            upokt: 50000000
            blockchainid: 0001
            url: http://node1-tostake.com:8081
            "
        And the transaction hash is be returned
            "Transaction submitted: Tx"
        When I send the HTTP POST request to v1/query/tx endpoint
        And I send the body request with:
            {
                 "hash": "0x197e4d46009879f28f978a90627c7dfeab64b4777afcc24e2b9c3d72b4dada22"
            }
        Then the POST response should contain a transaction detail:
            {   
                "hash":"12E534948E09AB7C4D1B4DDFD23D0B70BE68DF6E35C72F0286F697C805558101",
                "height":21070,
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
                "tx":"4QHbCxcNClQuxDhKCiWdVEd0IBwaB5P6nwypCreF4Vrlqie7hAkPdmurkrwbKP8HbLkhEgQwMDAyGgc1MDAwMDAwIhhodHRwOi8vbGljaGJvb2suY29tOjgwODASDwoFdXBva3QSBjEwMDAwMBppCiWdVEd0IBwaB5P6nwypCreF4Vrlqie7hAkPdmurkrwbKP8HbLkhEkDCerHxJlju/PWo/4RW0UYjTfPKeaNP8x9ZAw7Rln0rbPIUi3+qK25Y/bIHxuOTsEPr7JJE8NonCL0BiRp4mjoLKMzY35C4sLuU0wE=",
                "tx_result":{      "code":0,
                    "codespace":"",
                    "data":null,
                    "events":[         {            "attributes":[               {
                                "key":"YWN0aW9u",
                                "value":"c3Rha2VfdmFsaWRhdG9y"
                            
                }                            
                ],
                            "type":"message"
                        
                },
                        {            "attributes":[               {
                                "key":"cmVjaXBpZW50",
                                "value":"OGVmOTdiNDg4ZTY2YTJiMmU4OWEzYjQ5OTk1NDk4MTY3Njg5MTBmYg=="
                            
                },
                            {
                                "key":"YW1vdW50",
                                "value":"NTAwMDAwMHVwb2t0"
                            
                }
                            
                ],
                            "type":"transfer"
                        
                },
                        {            "attributes":[               {
                                "key":"c2VuZGVy",
                                "value":"ZWQ3Yjg1ODM4NzkwNTA2OGI0NTAyMmE3YWIyYjQ5NTJmMmM5N2FhZQ=="
                            
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
                                "value":"ZWQ3Yjg1ODM4NzkwNTA2OGI0NTAyMmE3YWIyYjQ5NTJmMmM5N2FhZQ=="
                            
                },
                            {
                                "key":"YW1vdW50",
                                "value":"NTAwMDAwMA=="
                            
                }
                            
                ],
                            "type":"stake"
                        
                },
                        {            "attributes":[               {
                                "key":"bW9kdWxl",
                                "value":"cG9z"
                            
                },
                            {
                                "key":"c2VuZGVy",
                                "value":"ZWQ3Yjg1ODM4NzkwNTA2OGI0NTAyMmE3YWIyYjQ5NTJmMmM5N2FhZQ=="
                            
                }
                            
                ],
                            "type":"message"
                        
                }
                    
                ],
                    "gasUsed":"0",
                    "gasWanted":"0",
                    "info":"",
                    "log":"[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"stake_validator\"},{\"key\":\"sender\",\"value\":\"ed7b858387905068b45022a7ab2b4952f2c97aae\"},{\"key\":\"module\",\"value\":\"pos\"},{\"key\":\"sender\",\"value\":\"ed7b858387905068b45022a7ab2b4952f2c97aae\"}]},{\"type\":\"stake\",\"attributes\":[{\"key\":\"module\",\"value\":\"pos\"},{\"key\":\"sender\",\"value\":\"ed7b858387905068b45022a7ab2b4952f2c97aae\"},{\"key\":\"amount\",\"value\":\"5000000\"}]},{\"type\":\"transfer\",\"attributes\":[{\"key\":\"recipient\",\"value\":\"8ef97b488e66a2b2e89a3b4999549816768910fb\"},{\"key\":\"amount\",\"value\":\"5000000upokt\"}]}]}]"
                
                }
                }