const contract_1 = artifacts.require("RiskCenter");
const contract_2 = artifacts.require("RiskManager");

module.exports = function(deployer) {
    deployer.deploy(contract_1);
    deployer.deploy(contract_2);
};

