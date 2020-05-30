Feature: Relay function testing.
    Scenario: Given a transaction, the relay should send that transaction and respond with the correct message of success
        Given a pocket core node
        And an application exist within a node
        And the application has a valid <address>
        And the application has status <staked>
        When a transaction is generated through script
        Then the relay should be created and send
        And the transaction hash should be returned.