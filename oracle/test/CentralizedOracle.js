var CentralizedOracle = artifacts.require("./CentralizedOracle.sol");

contract('CentralizedOracle', function(accounts) {
  it("should put 10000 MetaCoin in the first account", function() {
    return CentralizedOracle.deployed().then(function(instance) {
      console.log(instance.isSet)
      return instance.isSet.call(0);
    }).then(function(isSet) {
      assert.equal(isSet, false, "10000 wasn't in the first account");
    });
  });
});
