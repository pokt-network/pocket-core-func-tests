Feature: Relay completion and proof/claim submission for multiple servicers on one full node

Lean Pocket is an addition to the PCC that allows full nodes to
relay from additional servicers. The full node must service correctly
for all servicers, and must submit all proofs/claims to ensure that
the servicers are rewarded for their work.

  Scenario Outline: 1 pocket full node with additional servicers
    Given a pocket network with one full node
    And <num_servicers> on this full node
    And <num_relays> sent to each servicer in one session
    Then <num_servicers> will submit claims for <num_relays> that they served
    And <num_servicers> will submit valid proofs for the aforementioned claims

    Examples:
                 |num_servicers|num_relays|
                 |       50       |      10      |
                 |       50      |      5000     |
                 |       50      |      500000     |
                 |      100      |     10     |
                 |      100      |     5000     |
                 |      100      |     500000     |

Feature: Correct block proposition and validation for additional validators on one full node

Although, not its primary intention, lean pocket servicers must be able to
validate in times of network stress. Each additional validator on one
full node must propose and vote on blocks correctly.

  Scenario Outline: 1 pocket full node with additional validators
    Given a pocket network with one full node
    And <num_validators> on this full node
    and <num_blocks> have elapsed
    then <num_blocks> were proposed and voted on by <num_validators> validators

    Examples:
          |num_validators|num_blocks|
          |       5       |      1000     |
          |      100      |     1000     |

Feature: set multiple validators/servicers for lean pocket

In order to use lean_pocket, user must be able to import additional keys.

  Scenario: Lean Pocket is enabled
    Given that the user has Pocket Network latest version installed.
    and user wants to import a list of keys
    and user has a properly formed `lean_nodes_keys.json`
    When typing 'pocket accounts set-validators <path_to_list_of_keys>'
    Then user should see a success message
    and node_lean.json, priv_val_key_lean.json, priv_val_state_lean.json are created in the data dir
    Example:
      # see bottom of file. only shown once to minimize redundancy
      Example node key files

  Scenario: Lean Pocket is not enabled
    Given that the user has Pocket Network latest version installed.
    and user wants to import a list of keys
    and user has a properly formed `lean_nodes_keys.json`
    When typing 'pocket accounts set-validators <path_to_list_of_keys>'
    Then user should see a failure message
    Example:
      Lean pocket is not enabled

  Scenario: Lean Pocket is enabled but keyfile is malformed
    Given that the user has Pocket Network latest version installed.
    and user wants to import a list of keys
    When typing 'pocket accounts set-validators <path_to_list_of_keys>'
    Then user should see a failure message
    Example:
      Failed to read validators json file <error>

  Scenario: --useLean start argument used
    Given that the user has Pocket Network latest version installed.
    and user has a properly formed `lean_nodes_keys.json`
    and the user starts pocket core
    then they should see a successful start
    and node_lean.json, priv_val_key_lean.json, priv_val_state_lean.json are created in the data dir
    Example:
      # see bottom of file. only shown once to minimize redundancy
      Example node key files

  Scenario: --useLean and --forceSetValidators start arguments used
    Given that the user has Pocket Network latest version installed.
    and user has a properly formed `lean_nodes_keys.json`
    and the user starts pocket core
    then they should see a successful start
    and node_lean.json, priv_val_key_lean.json, priv_val_state_lean.json are updated in the data dir
    Example:
      # see bottom of file. only shown once to minimize redundancy
      Example node key files

  Scenario: --forceSetValidators start argument used without --useLean argument
    Given that the user has Pocket Network latest version installed.
    And user wants to import a list of keys
    And user starts pocket core
    Then user should see a successful start with Global Pocket behavior (one validator per pocket core process)
    Example:
      2022/07/13 09:19:37 Initializing Pocket Datadir
      E[2022-07-13|09:19:39.806] Stopping peer for error                      module=p2p peer="Peer{MConn{178.128.81.16:26656} 04bfc8c34d4a92dec42bcc43d5716e363663d3f0 out}" err=EOF
      E[2022-07-13|09:19:39.806] FSM event handler returned                   module=blockchain err="invalid event in current state" state=waitForPeer event=peerRemoveEv
      E[2022-07-13|09:19:39.899] FSM event handler returned                   module=blockchain err="peer height too low, old peer removed/ new peer not added" state=waitForPeer event=statusResponseEv


  Scenario: --useLean and --forceSetValidators start arguments used but keyfile is malformed
    Given that the user has Pocket Network latest version installed.
    and user wants to import a list of keys
    When starting pocket core
    Then the node should log a failure message
    Example:
      Failed to read validators json file <error>


Feature: Retrieve multiple validators for lean pocket

User must be able to retrieve the addresses set as validators.

  Scenario: lean pocket enabled in config file
    Given that the user has Pocket Network latest version installed.
    And user wants to view set validators
    When typing 'pocket accounts get-validators'
    Then user should see a success message and list of validators
    Example:
      Node Address: 7cf9fcc8dff5b16241fec172c4dd5af2cfd514f0
      Node Address: ffb3b9670b25ee67cb04d3ed64d4b2900a3e9be3
      Node Address: a0ddf6adecdf2464146a9ff764875bb720c407b6
      Node Address: 2ec6b3400212c5702be31893588b5c4abed2122f
      Node Address: 86c1c263d0e23cbb5fad6efb4294cc4d21f80b25
      Node Address: e780de605eca5aa0e069b23dfe0dbe9d06d729ac
      Node Address: e588a2e5a2d897785b06ca5bb747b48856481043
      Node Address: f6df1b3ce3efb57014e63e0d659acfb9ae741adc
      Node Address: 129ff8aa63fdf604691ec94d3b355cfaacf8b303
      Node Address: 1852fb7be1e8627fe6344b5b10a800c1c78e691b
      Node Address: 24d96f8cf0661175750e2a68a9ed0110daf577b8
      Node Address: 246cf4e141391ce7c8b81a3a2784fa0ad4a462cf
      Node Address: 6d180fa4d3a05f01dabc09f6dc1d5ec1692ec0a4
      Node Address: 4bd7d747cf04cca2ad2e569f236860af0095999b
      Node Address: ba56121199c1b398e6466496aa3d77c773d88f48
      Node Address: 01d4c922375a055ee3251c08e867fac9c95aaf52
      Node Address: c52be6bc68d719a25af3695ec07e0b0299483625
      Node Address: 7593f9112bb69df7450162891749ed7d86b03cb8
      Node Address: cc5c5b2030e3cbc829867cbddfbd81a5c519d176
      Node Address: 7bb562f4af85f1f999cd8de7150e205c6b2981da
      Node Address: 5542a13e3e229efb56c1947cdd759a33805e819e
      Node Address: 70e5f6bf7a294feb4dafc6cc736ff1c980825d2a
      Node Address: 35f86f171b53619ac0e3daeafafe5ff7a0f2cfac
      Node Address: 6cb4f20c76c0b016e382c9b35a8caf54903ddfa3
      Node Address: c4e35524e4a3042ad92c44669f2104448afca971

  Scenario: lean pocket not enabled in config file
    Given that the user has Pocket Network latest version installed.
    And user wants to view set validators
    When typing 'pocket accounts get-validators'
    Then user should see a failure message
    Example:
      Lean pocket is not enabled

Example node key files:
  node_key_lean.json:
    {
      "priv_key": {
        "type": "tendermint/PrivKeyEd25519",
        "value": "<base64_priv_key>"
      }
    }
  priv_val_key_lean.json:
  [
    {
      "address": "70E5F6BF7A294FEB4DAFC6CC736FF1C980825D2A",
      "pub_key": {
      "type": "tendermint/PubKeyEd25519",
      "value": "gqhnQuHlywWLS+i0Ot3FS/gbrf6xlwXj6bdBMeVO2Bs="
    },
      "priv_key": {
      "type": "tendermint/PrivKeyEd25519",
      "value": "<base64_priv_key>"
      }
    },
    {
      "address": "1852FB7BE1E8627FE6344B5B10A800C1C78E691B",
      "pub_key": {
      "type": "tendermint/PubKeyEd25519",
      "value": "OMHLJw6nBN7mWwNAU71FqZykIAv6ZrKrKifNcl6rjas="
      },
    "priv_key": {
      "type": "tendermint/PrivKeyEd25519",
      "value": "<base64_priv_key>"
      }
  }, <etc>
  ]
  priv_val_state_lean.json:
  [
    {
      "height": "0",
      "round": "0",
      "step": 0
    },
    {
      "height": "0",
      "round": "0",
      "step": 0
    }, <etc>
  ]
