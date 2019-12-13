const factoryContract = artifacts.require("EIP20Factory");
const tokenContract = artifacts.require("EIP20");

module.exports = function(deployer) {
    deployer.deploy(factoryContract);

    initialAmount = 1e9
    name = 'DeFi Stablecoin'
    decimals = 5
    symbol = 'DEFI'
    deployer.deploy(tokenContract, initialAmount, name, decimals, symbol);    
};

