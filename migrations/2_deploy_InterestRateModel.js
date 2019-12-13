var contract = artifacts.require("WhitePaperInterestRateModel");

module.exports = function(deployer) {
    const base = (2*1e16).toString();
    const slope = (3*1e17).toString();
    deployer.deploy(contract, base, slope);
};