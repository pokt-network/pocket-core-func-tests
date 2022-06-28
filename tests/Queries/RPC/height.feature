Feature: /v1/query/height endpoint
    Scenario: 265 Return height of network
        Given a pocket core node
        And a genesis file query-height-genesis-step1.json
        And a pocket core network is running
        When I send a HTTP POST request to the /v1/query/height
        Then the HTTP POST response will be a block detail indicating:
        {
            "height":4008
        }