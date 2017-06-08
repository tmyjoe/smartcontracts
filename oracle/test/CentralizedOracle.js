var CentralizedOracle = artifacts.require("./CentralizedOracle.sol");

contract('CentralizedOracle', function(accounts) {
  it("should return false for isSet[0]", function() {
    return CentralizedOracle.deployed().then(function(instance) {
      return instance.isSet.call(0);
    }).then(function(isSet) {
      assert.equal(isSet, false, "isSet[0] wasn't false.");
    });
  });

  it("should set a result", function() {
    var oracle;
    // Set owner
    console.log(CentralizedOracle)

    return CentralizedOracle.new(accounts[0], {from: accounts[0]}).then(function(instance) {
      oracle = instance;
      return oracle.reply(1, "res", {from: accounts[0]});
    }).then(function() {
      return oracle.isSet.call(1);
    }).then(function(result) {
      assert.equal(result, true, "isSet[1] wasn't true.");
    });
  });

  it("should call revert() result set twice", function() {
  });
});
