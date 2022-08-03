Feature: Correct block proposition and validation for additional validators on one full node

Lean pocket servicers must be able to validate. Each additional validator on one
full node must propose and vote on blocks correctly.

  Scenario Outline: 1 pocket full node with additional validators
    Given a pocket network with one full node
    And <num_validators> on this full node
    And <num_blocks> have elapsed
    Then <num_blocks> were proposed and voted on by <num_validators> validators

    Examples:
          |num_validators|num_blocks|
          |       5       |      1000     |
          |      100      |     1000     |

Feature: Receive proposed blocks and send consensus messages approving the proposed block

Lean Pocket changes the dynamics of P2P, so we must
make sure it functions as usual.

  Scenario Outline: 2 pocket full node with additional validators
    Given a pocket network with two full nodes
    And <num_validators> on each full node
    And the validators on full node A propose <num_blocks>
    Then the validators on full node A and B should each receive <num_blocks> proposals
    Then the validators on full node A and B should each successfully send consensus messages for <num_blocks> blocks

    Examples:
          |num_validators|num_blocks|
          |       5       |      1000     |
          |      100      |     1000     |

Feature: Successful transition from servicing to validating

Due to network dynamics, the validator set can change.
Lean Pocket must be able to handle this.

  Scenario Outline: 1 pocket full node with additional servicers and 1 pocket full node with additional validators
    Given a pocket network with two full nodes
    And <num_validators> on each full node
    And the validators on full node A are the validator set
    And the servicers on full node B are not in the validator set
    Then <num_blocks> blocks elapse with the validators on full node A successfully validating
    And after <num_blocks> blocks elapse, the stake of the servicers on full node B is increased to exceed those on full node A
    Then the servicers on full node B will become validators
    Then the now validators on full node B successfully validate <num_blocks>

    Examples:
          |num_validators|num_blocks|
          |       5       |      1000     |
          |      100      |     1000     |

Feature: Propose blocks and distribute them to the rest of the network

  Scenario Outline: 2 pocket full nodes with additional validators
    Given a pocket network with two full nodes
    And <num_validators> on each full node
    And <num_blocks> elapse
    Then <num_blocks> are proposed
    Then <num_validators> will receive <num_blocks>

    Examples:
          |num_validators|num_blocks|
          |       5       |      1000     |
          |      100      |     1000     |
