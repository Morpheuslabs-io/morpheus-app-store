var MITxToken = artifacts.require("./MITxToken.sol");
var MITxAppStoreIAB = artifacts.require("./MITxAppStoreIAB.sol");

module.exports = function(deployer) {
    deployer.deploy(MITxToken);
    deployer.deploy(MITxAppStoreIAB);
};
