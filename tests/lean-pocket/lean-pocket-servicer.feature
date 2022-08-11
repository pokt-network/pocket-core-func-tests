Feature: Relay completion

Lean Pocket is an addition to the PCC that allows full nodes to
relay from additional servicers. The full node must service correctly
for all servicers.

  Scenario Outline: Half servicers in the session
    Given a pocket network with one full node
    And <num_servicers> on this full node
    And <num_relays> sent to each servicer
    Then each relay sent to a node in the session will return a valid response
    Then each relay sent to a node not in the session will return an invalid response

    Examples:
                 |num_servicers|num_relays|
                 |       50      |      5000     |
                 |      100      |     5000     |

  Scenario Outline: lean_pocket disabled
    Given a pocket network with one full node
    And lean_pocket disabled
    And <num_servicers> on this full node
    And <num_relays> sent to each servicer in one session
    Then each relay will return an invalid response

Feature: Proof/claim submission for multiple servicers on one full node

Lean pocket must submit all proofs/claims to ensure that
the servicers are rewarded for their work.

  Scenario Outline: All servicers in the session
    Given a pocket network with one full node
    And <num_servicers> on this full node
    And <num_relays> sent to each servicer
    Then each servicer will submit a claim for <num_relays>
    Then each servicer will submit a successful proof that rewards the servicer for <num_relays> * poktPerRelay
