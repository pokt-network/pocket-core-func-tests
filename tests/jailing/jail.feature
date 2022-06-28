Feature: Jail mechanism
 The Pocket Network ensures rewards stakers on the network, 
 in order to ensure estability of the network
 jail & burn mechanisms are implemented to protect the network 

 Scenario: - Validator misses X blocks 
  Given a pocket core node with <chainID>
  And a genesis file "apps-stake-genesis.json"
  And a staked exist with address df82af89fea299911f8cdac747de72b6bdb1468d
  When the node has missed <Jailed_blocks_counter>
  Then the network jails the validator


 Scenario: - Forced unstake after extended downtime
  Given a pocket core node with <chainID>
  And a genesis file "apps-stake-genesis.json"
  And a staked exist with address df82af89fea299911f8cdac747de72b6bdb1468d
  When the node has missed <Jailed_blocks_counter>
  Then the network jails the validator
  When the node has missed <max_jailed_blocks>
  Then the network burns the validator
  And removes the validator from staking set