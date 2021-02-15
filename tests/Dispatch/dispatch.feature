Feature: /v1/client/dispatch
    Should be able to get a complete list of the dispatchers that will be serving your session.

    Scenario Outline: Sends request to check dispatch that will be servicing your requests for the session.
        Given a pocket core node
        And an application exists in the pocket core network
        And the application has an address of d0aa03678bd4da7eea822b90e8bbc93b81471355
        And the application supports testnet blockchain with id 0002
        When I send the HTTP Post request to the endpoint /v1/client/dispatch
        And the HTTP body post request send:
            "{
                "app_public_key": "3895f3a84afb824d7e2e63c5042a93ccdb13e0f891d5d61d10289df50d6c251d",
                "chain": "0002",
                "session_height": 0,
                "session_timestamp": 0
            }"
        Then the outcome will be a JSON response detailing that:
            "
            {
                "block_height": 5,
                "session": {
                    "header": {
                    "app_public_key": "e9477af9b42001280033bab76670eac4274cb7321e52280ceba964e1c61db87c",
                    "chain": "36f028580bb02cc8272a9a020f4200e346e276ae664e45ee80745574e2f5ab80",
                    "session_height": 1
                    },
                    "key": "OmEeJO2o6xvbldJxFpqI0rRVwVtBTmRGGSlGqzxGzgk=",
                    "nodes": [
                    {
                        "address": "afaa802b1736396d31825f60487e4da030ea85bb",
                        "chains": [
                        "36f028580bb02cc8272a9a020f4200e346e276ae664e45ee80745574e2f5ab80"
                        ],
                        "jailed": false,
                        "public_key": "a01bc947f512a971131474986cc0c8cb3caed6bcfca076e6b78ac2b838ebefed",
                        "service_url": "0.0.0.0:8081",
                        "status": 2,
                        "tokens": "1000000000000000000",
                        "unstaking_time": "0001-01-01T00:00:00Z"
                    },
                    {
                        "address": "88967bf78114d5ea56e1a02fb3fd2cac3607d674",
                        "chains": [
                        "36f028580bb02cc8272a9a020f4200e346e276ae664e45ee80745574e2f5ab80"
                        ],
                        "jailed": false,
                        "public_key": "c61954ba119bbbb2c1efa1d44f5f4001438566fd8aee2892387ef55ded82c159",
                        "service_url": "0.0.0.0:8081",
                        "status": 2,
                        "tokens": "10000000",
                        "unstaking_time": "0001-01-01T00:00:00Z"
                    },
                    {
                        "address": "a0c005c63f97a13e540e6bb484821d77f3fdaf75",
                        "chains": [
                        "36f028580bb02cc8272a9a020f4200e346e276ae664e45ee80745574e2f5ab80"
                        ],
                        "jailed": false,
                        "public_key": "db07958aa0035fbb3e7e2575fbbb062a7d5ef5580cd0fe80142a4df5d31a316a",
                        "service_url": "0.0.0.0:8081",
                        "status": 2,
                        "tokens": "10000000",
                        "unstaking_time": "0001-01-01T00:00:00Z"
                    },
                    {
                        "address": "e3b15b922be9cabbe3b4a3a788dec8dc95c8f3dc",
                        "chains": [
                        "36f028580bb02cc8272a9a020f4200e346e276ae664e45ee80745574e2f5ab80"
                        ],
                        "jailed": false,
                        "public_key": "a9c5d4463d5e233dd9437a2044a6595fe69ced34716a8e1c8ad86d3196f3fd78",
                        "service_url": "0.0.0.0:8081",
                        "status": 2,
                        "tokens": "10000000",
                        "unstaking_time": "0001-01-01T00:00:00Z"
                    },
                    {
                        "address": "fa11cff20c510fa1588915bd48391fee802822c8",
                        "chains": [
                        "36f028580bb02cc8272a9a020f4200e346e276ae664e45ee80745574e2f5ab80"
                        ],
                        "jailed": false,
                        "public_key": "b62798f50be7055073f8b2f19ca4b2262a2c82f2ab16fc907e9db1cce551ffce",
                        "service_url": "0.0.0.0:8081",
                        "status": 2,
                        "tokens": "10000000",
                        "unstaking_time": "0001-01-01T00:00:00Z"
                    }
                    ]
                }
            }
            