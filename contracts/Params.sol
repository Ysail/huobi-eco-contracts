pragma solidity >=0.6.0 <0.8.0;

contract Params {
    bool public initialized ;

    
    address public ValidatorContractAddr;
    address public PunishContractAddr;
    address public ProposalAddr;
    address public PROPOSAL_ADDR;

    // only for test
    address public miner;

    
    // System params
    uint16 constant public MaxValidators = 21;
    // Validator have to wait StakingLockPeriod blocks to withdraw staking
    uint64 constant public StakingLockPeriod = 100;
    // Validator have to wait WithdrawProfitPeriod blocks to withdraw his profits
    uint64 constant public WithdrawProfitPeriod = 100;
    uint256 constant public MinimalStakingCoin = 32 ether;

    
    modifier onlyMiner() {
        require(
            // just for test
            msg.sender == miner,
            "Miner only"
        );
        _;
    }

    
    modifier onlyNotInitialized() {
        require(!initialized, "Already initialized");
        _;
    }

    modifier onlyInitialized() {
        require(initialized, "Not init yet");
        _;
    }

    modifier onlyPunishContract() {
        require(msg.sender == PunishContractAddr, "Punish contract only");
        _;
    }

    modifier onlyBlockEpoch(uint256 epoch) {
        require(block.number % epoch == 0, "Block epoch only");
        _;
    }

    modifier onlyValidatorsContract() {
        require(
            msg.sender == ValidatorContractAddr,
            "Validators contract only"
        );
        _;
    }

    modifier onlyProposalContract() {
        require(
            msg.sender == ProposalAddr,
            "Proposal contract only"
        );
        _;
    }

    
    function setContracts(address val, address punish, address proposal) public {
        ValidatorContractAddr = val;
        PunishContractAddr = punish;
        ProposalAddr = proposal;
    }

    function setMiner(address miner_) public {
        miner = miner_;
    }
    
}
