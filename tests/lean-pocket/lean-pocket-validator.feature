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
