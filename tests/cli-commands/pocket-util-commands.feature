Scenario: User wants to see the utilities within pocket
    Given that user has Pocket installed and running
    And wants to see the pocket utils
    When user types in "pocket util"
    Then user should see the available commands/utils as follows. Examples:
    | Usage:
    pocket util [command]

    Available Commands:
    generate-chain generate a chain identifier

    Flags:
    -h, --help   help for util

    Global Flags:
        --blockTime int             how often should the network create blocks (default 1)
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
        --pocketRPCPort string      the port for pocket rpc (default "8081")
        --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
        --tmPeersPort string        the port for tendermint p2p (default "26656")
        --tmRPCPort string          the port for tendermint rpc (default "26657")

    Use "pocket util [command] --help" for more information about a command.|

Scenario: User wants to generate a chain identifier
    Given that user has Pocket installed and running
    And wants to generate a chain identifier
    When user types in "pocket util generate-chain <ticker> <netid> <version> <client> <interface> [flags]"
    Then user should see the success message and the generated chain ID.

Scenario: User wants to generate a chain identifier, wrong ticker
    Given that user has Pocket installed and running
    And wants to generate a chain identifier
    When user types in "pocket util generate-chain <ticker> <netid> <version> <client> <interface> [flags]", wrong ticker
    Then user should see the failure message.

Scenario: User wants to generate a chain identifier, wrong netid
    Given that user has Pocket installed and running
    And wants to generate a chain identifier
    When user types in "pocket util generate-chain <ticker> <netid> <version> <client> <interface> [flags]", wrong netid
    Then user should see the failure message.

Scenario: User wants to generate a chain identifier, wrong version
    Given that user has Pocket installed and running
    And wants to generate a chain identifier
    When user types in "pocket util generate-chain <ticker> <netid> <version> <client> <interface> [flags]", wrong version
    Then user should see the failure message.

Scenario: User wants to generate a chain identifier, wrong client
    Given that user has Pocket installed and running
    And wants to generate a chain identifier
    When user types in "pocket util generate-chain <ticker> <netid> <version> <client> <interface> [flags]", wrong client
    Then user should see the failure message.

Scenario: User wants to generate a chain identifier, wrong interface
    Given that user has Pocket installed and running
    And wants to generate a chain identifier
    When user types in "pocket util generate-chain <ticker> <netid> <version> <client> <interface> [flags]", wrong interface
    Then user should see the failure message.