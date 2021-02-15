Scenario: User wants to see the utilities within pocket
    Given that user has Pocket installed and running
    And wants to see the pocket utils
    When user types in "pocket util"
    Then user should see the available commands/utils as follows. Examples:
    | Usage:
    pocket util [command]

    Available Commands:
        completion               Generate completion script
        decode-tx                Decodes a given transaction encoded in Amino base64 bytes
        delete-chains            Delete chains file
        export-genesis-for-reset exports new genesis based on state
        generate-chains          Generates chains file
        print-configs            Prints Default config.json to console
        unsafe-rollback          Rollbacks the blockchain, the state, and app to a previous height
        update-configs           Updates config.json file

    Flags:
    -h, --help   help for util

    Global Flags:
        --datadir string            data directory (default is $HOME/.pocket/
        --madvdontneed              if enabled, run with GODEBUG=madvdontneed=1, --madvdontneed=true/false (default true)
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'
        --remoteCLIURL string       takes a remote endpoint in the form of <protocol>://<host> (uses RPC Port)
        --seeds string              a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'

    Use "pocket util [command] --help" for more information about a command.|

Scenario: User wants to generate a chain identifier
    Given that user has Pocket installed and running
    And wants to generate a chain identifier
    When user types in "pocket util generate-chain [flags]"
    Then user should be prompted to enter ID of the network: "Enter the ID of the network identifier:"
    When user types in a network ID "0001"
    Then user should be prompted to enter the URL of the network: "Enter the URL of the network identifier:"
    When user types in the network URL "http://127.0.0.1"
    Then user should be prompted to enter another network: "Would you like to enter another network identifier? (y/n)"
    When user types in "n"
    Then user receives a prompt & a chains.json file
    |chains.json contains: 

     0001 @ 127.0.0.1
If incorrect: please remove the chains.json with the delete-chains command|

Scenario: User wants to generate a chain identifier, wrong ticker
    Given that user has Pocket installed and running
    And wants to generate a chain identifier
    When user types in "pocket util generate-chain [flags]"
    Then user should be prompted to enter ID of the network: "Enter the ID of the network identifier:"
    When user types in a network ID "foobar"
    Then user recives an eror prompt
    |ERROR:
Codespace: pos
Code: 119
Message: "the network Identifier is not valid: encoding/hex: invalid byte: U+006E 'n'"|
    Then user should be prompted to enter ID of the network: "Enter the ID of the network identifier:"

Scenario: User wants to generate a completion script
    Given that user has Pocket installed and running
    When user types in "pocket util completion [bash|zsh|fish|powershell]"
    Then user should be shown the script completion as follows. E.g. bash
    |_pocket_query_block-txs()
            {
                last_command="pocket_query_block-txs"

                command_aliases=()

                commands=()

                flags=()
                two_word_flags=()
                local_nonpersistent_flags=()
                flags_with_completion=()
                flags_completion=()

                flags+=("--datadir=")
                two_word_flags+=("--datadir")
                flags+=("--madvdontneed")
                flags+=("--node=")
                two_word_flags+=("--node")
                flags+=("--persistent_peers=")
                two_word_flags+=("--persistent_peers")
                flags+=("--remoteCLIURL=")
                two_word_flags+=("--remoteCLIURL")
                flags+=("--seeds=")
                two_word_flags+=("--seeds")

                must_have_one_flag=()
                must_have_one_noun=()
                noun_aliases=()
            }

            _pocket_query_daoOwner()
            {
                last_command="pocket_query_daoOwner"

                command_aliases=()

                commands=()

                flags=()
                two_word_flags=()
                local_nonpersistent_flags=()
                flags_with_completion=()
                flags_completion=()

                flags+=("--datadir=")
                two_word_flags+=("--datadir")
                flags+=("--madvdontneed")
                flags+=("--node=")
                two_word_flags+=("--node")
                flags+=("--persistent_peers=")
                two_word_flags+=("--persistent_peers")
                flags+=("--remoteCLIURL=")
                two_word_flags+=("--remoteCLIURL")
                flags+=("--seeds=")
                two_word_flags+=("--seeds")

                must_have_one_flag=()
                must_have_one_noun=()
                noun_aliases=()
            }|

Scenario: User wants to decodes a given transaction encoded in Amino base64 bytes
    Given that user has Pocket installed and running
    When user types in "pocket util decode-tx qALbCxcNCpwBq4P6fApLCkBkMGIyYjVkYmM0NTIwZTM3OTZiNmE5NDVmNWZjNTYxMDBlN2MyMGYxNDUyZWFjMDNhN2I1Mzk1MDZjYWI5NGQ4EgQwMDIxGPljEi8KIJtTB9jJp8+3ruH4LeFmfMjqEEba8SA5iHKQU+xlPCFbEgsQk7HEsoyJtaH+ARgmIhQtd3e+ioxdpoRiOmrr5CPpyfRduygBEg4KBXVwb2t0EgUxMDAwMBppCiWdVEd0IIZqpL/ttK81fYyeDWMcIa7gvb90991lVrKeAjdFMzXkEkBltqW2vB+IvIhsJPjRDs28dIstJVX8SlnwjxeKlSst6nHyFssYHcfrJJtvQihDhi+iu7bf/No9gGsdXcrvMK8CKISErIOI7oWlaQ== true" (must be an amino base64 encoded transaction)
    Then user should be shown the following information:
    |Type:           claim
    Msg:            {{d0b2b5dbc4520e3796b6a945f5fc56100e7c20f1452eac03a7b539506cab94d8 0021 12793} {[155 83 7 216 201 167 207 183 174 225 248 45 225 102 124 200 234 16 70 218 241 32 57 136 114 144 83 236 101 60 33 91] {0 18321439643126536339}} 38 2D7777BE8A8C5DA684623A6AEBE423E9C9F45DBB 1 0}
    Fee:            10000upokt
    Entropy:        7586902294217294340
    Memo:           
    Signer          2d7777be8a8c5da684623a6aebe423e9c9f45dbb
    Sig:            866aa4bfedb4af357d8c9e0d631c21aee0bdbf74f7dd6556b29e0237453335e4|

Scenario: User wants to automatically delete the chains.json file
    Given that user has Pocket installed and running
    And a chains.json file exists.
    When user types in "pocket util delete-chains"
    Then user should be shown the success message:
    |successfully deleted chains.json|

Scenario: User wants to automatically export genesis.json file based on the state
    Given that user has Pocket installed and running
    When user types in "pocket util export-genesis-for-reset"
    Then user should be shown the success message:
    |successfully exported genesis.json|

Scenario: User wants to automatically generate the chains.json file
    Given that user has Pocket installed and running
    And a chains.json file doesn't exist.
    When user types in "pocket util generate-chains"
    Then user should be prompted to enter the ID of the network identifier, URL of the networkIdentifier:
    |Enter the ID of the network identifier:
    0001,0021
    the network Identifier is not valid: encoding/hex: invalid byte: U+002C ','
    please try again
    Enter the ID of the network identifier:
    0001
    Enter the URL of the network identifier:
    https://wetest.dev
    Would you like to enter another network identifier? (y/n)
    y
    Enter the ID of the network identifier:
    0021
    Enter the URL of the network identifier:
    https://wetest.dev
    Would you like to enter another network identifier? (y/n)
    n
    chains.json contains:

    0001 @ https://wetest.dev
    0021 @ https://wetest.dev|
    Then chains.json file should be generated

Scenario: User wants to automatically generate the chains.json file when a chains.json file exists
    Given that user has Pocket installed and running
    And a chains.json file exists.
    When user types in "pocket util generate-chains"
    Then user should be showed the existing chains.json file as:
    |chains.json contains:
    0001 @ https://wetest.dev
    0021 @ https://wetest.dev
    If incorrect: please remove the chains.json with the delete-chains command|

Scenario: User wants to automatically check the actual config.json information
    Given that user has Pocket installed and running
    When user types in "pocket util print-configs"
    Then user should be showed the config.json.

Scenario: User wants to rollbacks the blockchain, the state, and app to a previous height
    Given that user has Pocket installed and running
    And the user it's at highest weight
    When user types in "pocket util unsafe-rollback"
    Then user should be showed the success message:
    |successfully exported genesis.json|

Scenario: User wants to automatically update the actual config.json information with the latest one
    Given that user has Pocket installed and running
    When user types in "pocket util update-configs"
    Then user should be showed success message:
    |successfully Updated Config file|