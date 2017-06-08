var ERC20Token = artifacts.require("./ERC20Token.sol");
var StandardToken = artifacts.require("./StandardToken.sol");
var SpecificToken = artifacts.require("./SpecificToken.sol");

module.exports = function(deployer) {
  deployer.deploy(ERC20Token);
  deployer.link(ERC20Token, StandardToken);
  deployer.deploy(StandardToken);
  deployer.link(StandardToken, SpecificToken);
  deployer.deploy(SpecificToken);
};
