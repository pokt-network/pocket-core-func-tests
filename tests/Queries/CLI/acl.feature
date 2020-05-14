Feature: ACL method in pocket-core cli's query namespace
    Scenario: Returns map of ACL        
        Given a pocket core node
        And a genesis file query-acl-genesis-step1.json
        When I use pocket query namespace
        And I use the method acl
        Then the CLI response should be a JSON detailing:
        ACL:
            map[
                application/AppUnstakingTime:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                application/ApplicationStakeMinimum:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                application/BaseRelaysPerPOKT:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                application/MaxApplications:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                application/ParticipationRateOn:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                application/StabilityAdjustment:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                auth/MaxMemoCharacters:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                auth/TxSigLimit:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                gov/acl:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                gov/daoOwner:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                gov/upgrade:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                pocketcore/ClaimExpiration:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                pocketcore/ClaimSubmissionWindow:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                pocketcore/ReplayAttackBurnMultiplier:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                pocketcore/SessionNodeCount:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                pocketcore/SupportedBlockchains:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                pos/BlocksPerSession:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                pos/DAOAllocation:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                pos/DowntimeJailDuration:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                pos/MaxEvidenceAge:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                pos/MaxValidators:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                pos/MinSignedPerWindow:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                pos/ProposerPercentage:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                pos/SignedBlocksWindow:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                pos/SlashFractionDoubleSign:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                pos/SlashFractionDowntime:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                pos/StakeDenom:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                pos/StakeMinimum:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B 
                pos/UnstakingTime:610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B]
