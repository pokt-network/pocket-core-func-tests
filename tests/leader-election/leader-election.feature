Feature: Pocket Network Blockchain Leader Election

The Pocket Network blockchain is a Proof of Stake system
that elects a leader pseudo-randomly each block to be the
block producer. This pseudo-random selection needs to be continously uniform 
and weighted based on the validator's distribution of power.
Validator power comes from a direct linear correlation between the amount
of staked POKT cryptocurrency and the power conversion multiplier.

    Scenario Outline: Same power validators
        Given a pocket network with <validators_count> validators
        And every validator has staked <stake_amount> POKT
        And every validator has <validator_power> equaling <stake_amount>
        And a <weight> that equals (<validator_power>/<avg_validator_power>) rounded.
        And in case of weight being 0, weight equals (weight + 1)
        And <elapsed_blocks> equals <validators_count>
        When <elapsed_blocks> blocks elapse
        Then each validator was chosen ~<probability>% of blocks

            Examples:
                |validators_count|elapsed_blocks|stake_amount|validator_power|avg_validator_power|weight|probability|
                |       50       |      50      |     100    |      100      |        100        |   1  |     1     |
                |       100      |      100     |     200    |      200      |        200        |   1  |     1     |
                |       500      |      500     |     300    |      300      |        300        |   1  |     1     |
                |      1000      |     1000     |     400    |      400      |        400        |   1  |     1     |
                |      2000      |     2000     |     500    |      500      |        500        |   1  |     1     |
                |      5000      |     5000     |     600    |      600      |        600        |   1  |     1     |


    Scenario Outline: Different validator stakes
        Given a pocket network with <validators_count> validators
        And a <a_validators_amount> validators have staked <a_stake_amount> POKT
        And a <b_validators_amount> validators have staked <b_stake_amount> POKT
        And validators that staked <a_stake_amount> have power <a_power> equaling <a_stake_amount>
        And validators that staked <b_stake_amount> have power <b_power> equaling <b_stake_amount>
        And validators that staked <a_stake_amount> have weight <a_weight> that equals (<a_power>/<avg_validator_power>) rounded.
        And validators that staked <b_stake_amount> have weight <b_weight> that equals (<b_power>/<avg_validator_power>) rounded.
        And in case of weight being 0, weight equals (weight + 1)
        And <elapsed_blocks> equals <validators_count>
        When <elapsed_blocks> blocks elapse
        Then validators that staked <a_stake_amount> POKT were chosen ~<a_probability>% of blocks
        And validators that staked <b_stake_amount> POKT were chosen ~<b_probability>% of blocks

            Examples:
                |validators_count|a_validators_amount|b_validators_amount|a_stake_amount|b_stake_amount|a_power|b_power|avg_validator_power|a_weight|b_weight|elapsed_blocks|a_probability|b_probability|
                |       50       |         40        |         10        |      100     |      300     |  100  |  300  |        140        |    1   |    2   |      50      |    2.00%    |    4.00%    |
                |       100      |         80        |         20        |      100     |      400     |  100  |  400  |        160        |    1   |    2   |      100     |    2.00%    |    4.00%    |
                |       500      |        400        |        100        |      100     |      500     |  100  |  500  |        180        |    1   |    3   |      500     |    2.00%    |    6.00%    |
                |      1000      |        800        |        200        |      100     |      600     |  100  |  600  |        200        |    1   |    4   |     1000     |    2.00%    |    8.00%    |
                |      2000      |        1600       |        400        |      100     |      700     |  100  |  700  |        220        |    1   |    5   |     2000     |    2.00%    |    10.00%   |
                |      5000      |        4000       |        1000       |      100     |      800     |  100  |  800  |        240        |    1   |    5   |     5000     |    2.00%    |    10.00%   |
