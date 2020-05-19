Scenario: User wants to reset his pocket config
    Given that user has Pocket installed and running
    And wants to reset pocket, for any reason
    When user types in "pocket reset"
    Then user should see the following response. Examples:
    |I[2020-05-19|12:21:46.072] Removed existing address book                file=/Users/emanuelmedrano/.pocket/config/addrbook.json     I[2020-05-19|12:21:46.085] Removed all blockchain history               dir=/Users/emanuelmedrano/.pocket/data
    I[2020-05-19|12:21:46.086] Reset private validator file                 keyFile=/Users/emanuelmedrano/.pocket/priv_val_key.json stateFile=/Users/emanuelmedrano/.pocket/priv_val_state.json |