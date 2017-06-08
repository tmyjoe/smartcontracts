var CentralizedOracle = artifacts.require("./CentralizedOracle.sol");

module.exports = function(deployer) {
  deployer.deploy(CentralizedOracle);
};
