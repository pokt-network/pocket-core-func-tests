 Feature: stake method in pocket-core endpoint
    Scenario: Should stake to an app.
        Given a pocket core node
        And a genesis file apps-stake-genesis-step1.json
        And an application node exist with address b5f039d626419a71b4597445728d9d7ffbf1aa7c
        And the application node has blockchain id 0001 support
        And the application has available balance
        And I use namespace nodes
        And I use method stake
        And I send the parameters: 
            "
            address: b5f039d626419a71b4597445728d9d7ffbf1aa7c
            amount: 50000000
            chains: 0001
            url: http://myapp-stake.com:8080
            "
        And the CLI shows a message indicating:
            "Transaction submitted: TxHash"
        When I send the HTTP POST request to v1/query/tx endpoint
        And I send the body request with:
            {
                 "hash": "TxHash"
            }
        Then the request should return a JSON block indicating:
            {
            "hash":"C78B983E24F58F508F9F13EB21F50C224E4FA25C871B48710E6757CC7F682872",
            "height":21490,
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
            "tx":"4QHbCxcNClUuxDhKCiWdVEd0IC8aZgc0qn/2dc0ceqSv0LJgSJ5ugk07+jvpXvXg/IGkEgQwMDAyGgc1MDAwMDAwIhlodHRwOi8vc3Rha2V0aGlzLmNvbTo4MDgwEg8KBXVwb2t0EgYxMDAwMDAaaQolnVRHdCAvGmYHNKp/9nXNHHqkr9CyYEieboJNO/o76V714PyBpBJAGG1Wq9i/HZSW9kGCY8QQlCR+nDA6Bteow5KzAGc7ltNTuaytMUeINhKiTMkcbyepOSvXR8j1hisgazYMbgXeBiiHhN2BlZP38Hk=",
            "tx_result":{
                "code":0,
                "codespace":"",
                "data":null,
                "events":[
                    {
                        "attributes":[
                        {
                            "key":"YWN0aW9u",
                            "value":"c3Rha2VfdmFsaWRhdG9y"
                        
            }
                        
            ],
                        "type":"message"
                    
            },
                    {
                        "attributes":[
                        {
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
                    {
                        "attributes":[
                        {
                            "key":"c2VuZGVy",
                            "value":"YjVmMDM5ZDYyNjQxOWE3MWI0NTk3NDQ1NzI4ZDlkN2ZmYmYxYWE3Yw=="
                        
            }
                        
            ],
                        "type":"message"
                    
            },
                    {
                        "attributes":[
                        {
                            "key":"bW9kdWxl",
                            "value":"cG9z"
                        
            },
                        {
                            "key":"c2VuZGVy",
                            "value":"YjVmMDM5ZDYyNjQxOWE3MWI0NTk3NDQ1NzI4ZDlkN2ZmYmYxYWE3Yw=="
                        
            },
                        {
                            "key":"YW1vdW50",
                            "value":"NTAwMDAwMA=="
                        
            }
                        
            ],
                        "type":"stake"
                    
            },
                    {
                        "attributes":[
                        {
                            "key":"bW9kdWxl",
                            "value":"cG9z"
                        
            },
                        {
                            "key":"c2VuZGVy",
                            "value":"YjVmMDM5ZDYyNjQxOWE3MWI0NTk3NDQ1NzI4ZDlkN2ZmYmYxYWE3Yw=="
                        
            }
                        
            ],
                        "type":"message"
                    
            }
                
            ],
                "gasUsed":"0",
                "gasWanted":"0",
                "info":"",
                "log":"[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"stake_validator\"},{\"key\":\"sender\",\"value\":\"b5f039d626419a71b4597445728d9d7ffbf1aa7c\"},{\"key\":\"module\",\"value\":\"pos\"},{\"key\":\"sender\",\"value\":\"b5f039d626419a71b4597445728d9d7ffbf1aa7c\"}]},{\"type\":\"stake\",\"attributes\":[{\"key\":\"module\",\"value\":\"pos\"},{\"key\":\"sender\",\"value\":\"b5f039d626419a71b4597445728d9d7ffbf1aa7c\"},{\"key\":\"amount\",\"value\":\"5000000\"}]},{\"type\":\"transfer\",\"attributes\":[{\"key\":\"recipient\",\"value\":\"8ef97b488e66a2b2e89a3b4999549816768910fb\"},{\"key\":\"amount\",\"value\":\"5000000upokt\"}]}]}]"
            
            }
            }