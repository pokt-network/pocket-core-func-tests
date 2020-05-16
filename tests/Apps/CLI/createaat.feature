Feature: create-aat method in pocket-core cli's apps namespace
    Scenario: Should create an app auth token.
        Given a pocket core node
        And a genesis file apps-create-aat-genesis-step1.json
        And a node exist with address 7ab712998671b09e1a266ce6901000acb657833b
        And the node has a public key of e0a4223fd41e23b3a432b219d970b99bf62e7efd5467f8ea07ee29bcd51f1b08
        When I use namespace nodes
        And I use method create-aat
        And I send the parameters: 
            "
            address: 7ab712998671b09e1a266ce6901000acb657833b
            publicKey: e0a4223fd41e23b3a432b219d970b99bf62e7efd5467f8ea07ee29bcd51f1b08
            "
        Then the CLI should show a JSON detail indicating:
            {
                "version": "0.0.1",
                "app_pub_key": "e0a4223fd41e23b3a432b219d970b99bf62e7efd5467f8ea07ee29bcd51f1b08",
                "client_pub_key": "e0a4223fd41e23b3a432b219d970b99bf62e7efd5467f8ea07ee29bcd51f1b08",
                "signature": "ada41d9de6b3d1982f5a7a061d29e03b313ad40f47d7c071d9f293a29f3b553c7c39e663a9410b4151f9105a57e4016cf17f5ad1b0ac1e4ba29550438f2a930b"
            }

    Scenario: Shouldn't create an app auth token with wrong app address.
        Given a pocket core node
        And a genesis file apps-create-aat-genesis-step2.json
        And a node doesn't exist with address 7ab712998671b09e1a266ce6901000acb6571234
        When I use namespace nodes
        And I use method create-aat
        And I send the parameters: 
            "
            address: 7ab712998671b09e1a266ce6901000acb6571234
            publicKey: randomPubKey
            "
        Then the CLI should show a JSON detail indicating:
            "key with address 7ab712998671b09e1a266ce6901000acb6571234 not found"
            