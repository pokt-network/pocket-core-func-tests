Feature: Account method in pocket-core cli's  query namespace
  Scenario: Account exists
    Given a pocket core node
    And a genesis file query-account-rpc-genesis-step1.json
    And an account exists in the pocket network with address 4920ce1d787c60e2eaeff366c79e8aa2b82525f1
    When I use pocket query namespace
    And I use the method account 
    And the arguments of the method has the account address as 4920ce1d787c60e2eaeff366c79e8aa2b82525f1 and height 0
    Then the CLI response should be detailing:
        Account:
            Address:       4920ce1d787c60e2eaeff366c79e8aa2b82525f1
            Pubkey:        string
            Coins:         string

  Scenario: Invalid height 
    Given a pocket core node
    And a genesis file query-account-rpc-genesis-step12json
    And an account exists in the pocket network with address 4920ce1d787c60e2eaeff366c79e8aa2b82525f1
    When I use pocket query namespace
    And I use the method account
    And the arguments of the method has the account address as 4920ce1d787c60e2eaeff366c79e8aa2b82525f1 and height 56000
    Then the CLI response should be detailing:
        {
            "codespace":"sdk",
            "code":1,
            "message":"failed to load state at height 5600000; failed to get Store: no data (latest height: 5267)"
        }  

  Scenario: Account does not exist
    Given a pocket core node
    And a genesis file query-account-rpc-genesis-step2.json
    And an account doesn't exist in the pocket network with address 4920ce1d787c60e2eaeff366c79e8aa2b8252123
    When I use pocket query namespace
    And I use the method account 
    And the arguments of the method has the account address as 4920ce1d787c60e2eaeff366c79e8aa2b8252123 and height 0
    Then the CLI response should be detailing:
        Account:
            Address:       null
            Pubkey:        null
            Coins:         null

  Scenario: Account number is invalid
    Given a pocket core node
    And a genesis file query-account-rpc-genesis-step3.json
    And an account doesn't exist in the pocket network with address 2BBCA5DC9792C72AC3A2616910C4AAAA
    When I use pocket query namespace
    And I use the method account 
    And the arguments of the method has the account address as 2BBCA5DC9792C72AC3A2616910C4AAAA and height 0
    Then the CLI response should be detailing:
        Incorrect address length

  Scenario: Account number contains invalid characters
    Given a pocket core node
    And a genesis file query-account-rpc-genesis-step3.json
    And an account doesn't exist in the pocket network with address 1-$A&DA72BBCA5DC9792C72AC3A2616910C479B3
    When I use pocket query namespace
    And I use the method account 
    And the arguments of the method has the account address as 1-$A&DA72BBCA5DC9792C72AC3A2616910C479B3 and height 0
    Then the CLI response should be detailing:
      encoding/hex: invalid byte: U+002D '-'