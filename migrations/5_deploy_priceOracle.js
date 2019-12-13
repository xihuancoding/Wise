const contract_1 = artifacts.require("SimplePriceOracle");
const contract_2 = artifacts.require("PriceOracleProxy");

module.exports = function(deployer) {

    deployer.deploy(contract_1).then(function() {

        address riskManager = ''
        address v1PriceOracle = contract_1.address
        address cEthAddress = ''
        address cUsdcAddress = ''
        address cSaiAddress = ''
        address cDaiAddress = ''

        return deployer.deploy(contract_2, riskManager, v1PriceOracle, cEthAddress, cUsdcAddress, cSaiAddress, cDaiAddress)
    });
};

