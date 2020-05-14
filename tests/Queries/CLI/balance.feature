Feature: balance method in pocket-core cli's query namespace

    Scenario: Returns balance of existing account
        Given a pocket core node
        And a genesis file query-balance-rpc-genesis-step1.json
        And an application exists in the pocket core network at height 2 and address 029A0DA72BBCA5DC9792C72AC3A2616910C479B3
        When I use pocket query namespace
        And I use the method balance
        And the arguments of the method has the height 0
        And the account address of 029A0DA72BBCA5DC9792C72AC3A2616910C479B3
        Then the CLI response should be a message detailing:
            "Account Balance: 989900000"

    Scenario: Can't return balance of account that doesn't exist
        Given a pocket core node
        And a genesis file query-balance-rpc-genesis-step1.json
        And an application doesn't exist in the pocket core network with address 029A0DA72BBCA5DC9792C72AC3A2616910C479B3
        When I use pocket query namespace
        And I use the method balance
        And the arguments of the method has the height 0
        And the account address of 029A0DA72BBCA5DC9792C72AC3A2616910C479B3
        Then the CLI response should be a message detailing:
            "Account Balance: 0"