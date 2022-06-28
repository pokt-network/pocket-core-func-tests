Feature: daoOwner method in pocket-core cli's query namespace
    Scenario: 217 daoOwner method in pocket-core cli's query namespace
        Given a pocket core node
        And a genesis file query-daoOwner-genesis-step1.json
        And a pocket core network is running
        When I use the pocket namespace query
        And I use the method of daoOwner
        Then the CLI should show a response of:
            "daoOwnerAddr"
    
    