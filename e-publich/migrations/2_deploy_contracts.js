var Publication = artifacts.require("./Publication.sol");
var PublicationRegistry = artifacts.require("./PublicationRegistry.sol");

module.exports = function(deployer) {
  deployer.deploy(Publication);
  // deployer.link(Publication, PublicationRegistry);
  deployer.deploy(PublicationRegistry);
};
