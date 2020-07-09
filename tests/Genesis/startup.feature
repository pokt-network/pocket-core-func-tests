Feature: starting a network 
  Scenario: Start
    Given a genesis file "geneis.json"
    Then typing "pocket start"
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then node will synch with other members of the network
    And user will see logs

  Scenario: Start network with jailed node
    Given a genesis file "jailed-validator-genesis.json" with a jailed validator
    Then typing "pocket start"
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then node will synch with other members of the network
    And user will see logs
