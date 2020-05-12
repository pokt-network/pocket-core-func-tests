Feature: /v1/query/account endpoint
  Scenario: Account exists
    Given a pocket core node
    And a genesis file query-account-rpc-genesis-step1.json
    And an account exists in the pocket network with address 4920ce1d787c60e2eaeff366c79e8aa2b82525f1
    When I send a HTTP POST request to the /v1/query/account endpoint 
    And the request body has the parameters address 4920ce1d787c60e2eaeff366c79e8aa2b82525f1 and height 0
    Then the HTTP response will be an account detail indicating:
      {
        "address": "4920ce1d787c60e2eaeff366c79e8aa2b82525f1",
        "height": 2
      }

  Scenario: Account does not exists
    Given a pocket core node
    And a genesis file query-account-rpc-genesis-step2.json
    And an account doesn't exist in the pocket network with address 1234567d787c60e2eaeff366c79e8aa2b82525f1
    When I send a HTTP Post request to the /v1/query/account endpoint
    And the request body has the parameters address 1234567d787c60e2eaeff366c79e8aa2b82525f1 and height 0
    Then the HTTP response will be an empty address detail indicating:
      {
        "address":"",
        "coins":[],
        "public_key":null
      } 

  Scenario: Account number is invalid
    Given a pocket core node
    And a genesis file query-account-rpc-genesis-step3.json
    And an account number is invalid with address 2BBCA5DC9792C72AC3A2616910C4AAAA
    When I send a HTTP POST request to the /v1/query/account endpoint
    And the request body has the parameters address 2BBCA5DC9792C72AC3A2616910C4AAAA and height 0
    Then the HTTP response will be an error indicating:
    {
      "code":400,
      "message":"Incorrect address length"
    }
  Scenario: Account number contains invalid characters
    Given a pocket core node
    And a genesis file query-account-rpc-genesis-step4.json
    And an account number is invalid with address 1-$A&DA72BBCA5DC9792C72AC3A2616910C479B3
    When I send a HTTP POST request to the /v1/query/account endpoint
    And the request body has the parameteres of address 1-$A&DA72BBCA5DC9792C72AC3A2616910C479B3 and height 0
    Then the HTTP response will be an error indicating:
      {
        "code":400,
        "message":"encoding/hex: invalid byte: U+002D '-'"
       }