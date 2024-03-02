pragma solidity ^0.8.21;

contract StormBit {

    event PoolCreated(address indexed creator, uint256 poolId, string name);
<<<<<<< HEAD
=======
    event AgreementCreated(address indexed aggreement, uint256 agreementId, string name);

>>>>>>> 0163ca7 (Merge branch 'main' of github.com:Quantum3-Labs/StormBit-monorepo)
    struct PoolConfig {
        uint256 minCreditScore;
        uint256 quorum;
        uint256 votingPowerCooldown;
        uint256 maxAmountOfStakers;
        uint256 maxPoolUsage;
    }
    struct StormPool {
        address creator;
        uint256 poolId;
        string name;
    }

    uint256 public poolIds = 1;
    uint256 public aggreementIds = 1;
    mapping(uint256 => StormPool) public pools;
    mapping(uint256 => PoolConfig) public poolConfigs;
    mapping(uint256 => address) public agreements;

    // poolId => (agreementId => YEs/NO)
    mapping(uint256 => mapping(uint256 => bool)) public poolAgreements;

<<<<<<< HEAD
=======
    constructor() {
        _createAgreement("Base Agreement", address(1));
        _createAgreement("NFT Agreement", address(2));
        _createAgreement("FT Agreement", address(3));

    }

>>>>>>> 0163ca7 (Merge branch 'main' of github.com:Quantum3-Labs/StormBit-monorepo)
    function createPool(string memory _name, PoolConfig memory _config) public {
        StormPool memory pool = StormPool(msg.sender, 1, _name);
        pools[poolIds] = pool;
        poolConfigs[poolIds] = _config;
        poolIds++;
    }

    function getPoolData(uint256 _poolId) public view returns (StormPool memory, PoolConfig memory, address[] memory) {
        return (pools[_poolId], poolConfigs[_poolId], getAgreements(_poolId));
    }

    function getAgreements(uint256 _poolId) public view returns (address[] memory) {
        address[] memory _agreements = new address[](aggreementIds-1);
        for (uint256 i = 0; i < aggreementIds -1 ; i++) {
            if (poolAgreements[_poolId][i + 1]) {
                _agreements[i] = agreements[i + 1];
            }
        }
        return _agreements;
    }

<<<<<<< HEAD
=======
    function createAgreement(string memory _name, address _agreement) public returns (uint256) {
        return _createAgreement(_name, _agreement);
    }

    function supportAgreement(uint256 _poolId, uint256 _agreementId) public {
        _supportAgreement(_poolId, _agreementId);
    }

>>>>>>> 0163ca7 (Merge branch 'main' of github.com:Quantum3-Labs/StormBit-monorepo)
    function _supportAgreement(uint256 _poolId, uint256 _agreementId) internal {
        poolAgreements[_poolId][_agreementId] = true;
    }

<<<<<<< HEAD
    function _addAgreement(address _agreement) internal returns (uint256) {
        uint256 agreementId = aggreementIds;
        agreements[aggreementIds] = _agreement;
        aggreementIds++;
=======
    function _createAgreement(string memory _name, address _agreement) internal returns (uint256) {
        uint256 agreementId = aggreementIds;
        agreements[agreementId] = _agreement;
        aggreementIds++;
        emit AgreementCreated(_agreement, agreementId, _name);
>>>>>>> 0163ca7 (Merge branch 'main' of github.com:Quantum3-Labs/StormBit-monorepo)
        return agreementId;
    }

}