const contract = artifacts.require("MarketErc20");

module.exports = function(deployer) {
    deployer.deploy(contract);
};

