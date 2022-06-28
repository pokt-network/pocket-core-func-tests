Scenario: 032 To show existing commands within the pocket app section
    Given that the user has Pocket Network latest version installed.
    And wants to see the available actions for pocket apps
    When typing "pocket apps".
    And hitting "enter"
    Then user should be prompted the following suggestion. Examples:
    | application management

    Usage:
    pocket apps [command]

    Available Commands:
    create-aat  Creates an application authentication token
    stake       Stake an app in the network
    unstake     Unstake an app in the network

    Flags:
    -h, --help   help for apps

    Global Flags:
      --datadir string            data directory (default is $HOME/.pocket/
      --madvdontneed              if enabled, run with GODEBUG=madvdontneed=1, --madvdontneed=true/false (default true)
      --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
      --persistent_peers string   a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'
      --remoteCLIURL string       takes a remote endpoint in the form of <protocol>://<host> (uses RPC Port)
      --seeds string              a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'

    Use "pocket apps [command] --help" for more information about a command.|

Scenario: 033 To create an AAT
    Given that the user has Pocket Network latest version installed.
    And wants to create an application authentication token
    When typing "pocket apps create-aat <appAddr> <clientPubKey> [flags]"
    Then user should be prompted succeed message and the aat creation.

Scenario: 034 To create an AAT, with wrong APPaddress
    Given that the user has Pocket Network latest version installed.
    And wants to create an application authentication token
    When typing "pocket apps create-aat <appAddr> <clientPubKey> [flags]", being address wrong one
    Then user should be prompted an error message, such as. Examples:
    | Address Error encoding/hex: invalid byte: U+006C 'l'|

Scenario: 035 To create an AAT, with wrong clientPubKey
    Given that the user has Pocket Network latest version installed.
    And wants to create an application authentication token
    When typing "pocket apps create-aat <appAddr> <clientPubKey> [flags]", being address wrong one
    Then user should be prompted an error message, such as. Examples:
    | clientPubKey Error encoding/hex: invalid byte: U+006C 'l'|

Scenario: 036 To create an AAT, incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to create an application authentication token
    When typing "pocket apps create-aat <appAddr>"
    And typing "pocket apps create-aat <clientPubKey> [flags]"
    And typing "pocket apps create-aat"
    Then user should be prompted an error message, such as. Examples:
    | Error: accepts 2 arg(s), received 0
    Usage:
    pocket apps create-aat <appAddr> <clientPubKey> [flags]

    Flags:
    -h, --help   help for create-aat

    Global Flags:
        --blockTime int             how often should the network create blocks (default 1)
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
        --pocketRPCPort string      the port for pocket rpc (default "8081")
        --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
        --tmPeersPort string        the port for tendermint p2p (default "26656")
        --tmRPCPort string          the port for tendermint rpc (default "26657")

    accepts 2 arg(s), received 0
    Emanuels-MacBook-Pro:~ emanuelmedrano$ pocket apps create-aat efeljfhelfhe34981234 dfadsf;kadsjhfjah383
    Address Error encoding/hex: invalid byte: U+006C 'l'-bash: kadsjhfjah383: command not found|

Scenario: 037 To stake an APP in the network
    Given that the user has Pocket Network latest version installed.
    And wants to stake his APP into the network
    When typing "pocket apps stake <fromAddr> <amount> <chains> <chainID> <fees> [flags]"
    Then user should be shown a success message

Scenario: 038 To stake an APP in the network, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to stake his APP into the network
    When typing "pocket apps stake <fromAddr> <amount> <chains> <chainID> <fees> [flags]", with wrong address
    Then user should be shown a failure message

Scenario: 040 To stake an APP in the network, zero as amount
    Given that the user has Pocket Network latest version installed.
    And wants to stake his APP into the network
    When typing "pocket apps stake <fromAddr> <amount> <chains> <chainID> <fees> [flags]", with zero as an amount
    Then user should be shown a failure message 

Scenario: 041 To stake an APP in the network, wrong chains
    Given that the user has Pocket Network latest version installed.
    And wants to stake his APP into the network
    When typing "pocket apps stake <fromAddr> <amount> <chains> <chainID> <fees> [flags]", with wrong chains
    Then user should be shown a failure message

Scenario: 042 To stake an APP in the network, incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to stake his APP into the network
    When typing "pocket apps stake <fromAddr>"
    And typing "pocket apps stake <fromAddr> <amount>"
    And typing "pocket apps stake <amount>"
    And typing "pocket apps stake "
    Then user should be prompted an error message, such as. Examples:
    | Error: accepts 5 arg(s), received 0
    Usage:
    pocket apps stake <fromAddr> <amount> <chains> <chainID> <fees> [flags]

    Flags:
    -h, --help   help for stake

    Global Flags:
        --blockTime int             how often should the network create blocks (default 1)
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
        --pocketRPCPort string      the port for pocket rpc (default "8081")
        --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
        --tmPeersPort string        the port for tendermint p2p (default "26656")
        --tmRPCPort string          the port for tendermint rpc (default "26657")|

Scenario: 043 To unstake an APP in the network
    Given that the user has Pocket Network latest version installed.
    And wants to unstake his APP into the network
    When typing "pocket apps unstake <fromAddr> <chainID> <fees> [flags]"
    Then user should be shown a success message

Scenario: 044 To unstake an APP in the network, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to unstake his APP into the network
    When typing "pocket apps unstake <fromAddr> <chainID> <fees> [flags]", with wrong address
    Then user should be shown a failure message

Scenario: 045 To unstake an APP in the network, incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to unstake his APP into the network
    When typing "pocket apps unstake "
    Then user should be prompted an error message, such as. Examples:
    | Error: accepts 3 arg(s), received 0
    Usage:
    pocket apps unstake <fromAddr> <chainID> <fees> [flags]

    Flags:
    -h, --help   help for unstake

    Global Flags:
        --blockTime int             how often should the network create blocks (default 1)
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
        --pocketRPCPort string      the port for pocket rpc (default "8081")
        --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
        --tmPeersPort string        the port for tendermint p2p (default "26656")
        --tmRPCPort string          the port for tendermint rpc (default "26657")

    accepts 3 arg(s), received 0|

Scenario: 046 To be able to edit an stake amount from an APP
    Given that the user has Pocket Network latest version installed.
    And wants to edit or modify his current stake within the network
    When typing "pocket apps stake <fromAddr> <amount> <chains> <serviceURI> <chainID> <fees>"
    And providing the new details, in which the amount is kept the same.
    Then user should be prompted a success message/transaction:
    | pocket apps stake abf1df709a0cc486ac6db216ba9ed260e5597ba9 100000 0022 testnet 100000 |
    And after a block have passed.
    And user queries the node. 
    | pocket query app <AppAddress> | 
    Then user finds the new staking details there.

Scenario: 047 To prevent a user of staking less amount of relays
    Given that the user has Pocket Network latest version installed.
    And wants to edit or modify his current stake within the network
    When typing "pocket apps stake <fromAddr> <amount> <chains> <serviceURI> <chainID> <fees>"
    And providing the new details, in which the amount is less than it was before.
    Then user should be prompted a success message/transaction:
    | pocket apps stake abf1df709a0cc486ac6db216ba9ed260e5597ba9 10000 0022 testnet 100000 |
    And after a block have passed.
    And user queries the APP. 
    | pocket query APP <APPAddress> | 
    Then user finds the new staking details are not there, and the old ones are kept.

Scenario: 048 To verify that the APP which edit stake have happened loses the servicing node
    Given that the user has Pocket Network latest version installed.
    And a given APP it's in a current session
    And wants to edit or modify his current stake within the network
    When typing "pocket apps stake <fromAddr> <amount> <chains> <serviceURI> <chainID> <fees>"
    And providing the new details, in which the amount is kept the same, but the chainID is different than the ones in the current session
    Then user should be prompted a success message/transaction:
    | pocket apps stake abf1df709a0cc486ac6db216ba9ed260e5597ba9 100000 0022 testnet 100000 |
    And after a block have passed.
    And user queries the APP. 
    | pocket query APP <APPAddress> | 
    Then user finds the new staking details there.
    And when v1/dispatch is queried, the nodes are not servicing the APP anymore.

Scenario: 049 To verify that a node gets paid for APP staking changes mid section
    Given that the user has Pocket Network latest version installed.
    And wants to edit or modify his current stake within the network
    When typing "pocket apps stake <fromAddr> <amount> <chains> <serviceURI> <chainID> <fees>"
    And providing the new details, in which the amount is kept the same, but the current dispatching chainID is changed.
    And the APP is within a session for X chainID.
    Then user should be prompted a success message/transaction:
    | pocket apps stake abf1df709a0cc486ac6db216ba9ed260e5597ba9 100000 0022 testnet 100000 |
    And after a block have passed.
    And user queries the APP. 
    | pocket query APP <APPAddress> | 
    Then user finds the new staking details there.
    And when v1/dispatch is queried, the nodes are not servicing the APP anymore.
    And nodes received the claims for the serviced relays up to the chaning point.

Scenario: 050 To verify that the node relays increments if APP Max Relays increases
    Given that the user has Pocket Network latest version installed.
    And a given APP it's in a current session
    And wants to edit or modify his current stake within the network
    When typing "pocket apps stake <fromAddr> <amount> <chains> <serviceURI> <chainID> <fees>"
    And providing the new details, in which the amount increased.
    Then user should be prompted a success message/transaction:
    | pocket apps stake abf1df709a0cc486ac6db216ba9ed260e5597ba9 100000 0022 testnet 100000 |
    And after a block have passed.
    And user queries the APP. 
    | pocket query APP <APPAddress> | 
    Then user finds the new staking details there.
    And when v1/dispatch is queried, the node is still within the session.
    And when receiving rewards, the same receives the proportion of the increment.
