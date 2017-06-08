var EthJpyCentralizedOracle = artifacts.require("./EthJpyCentralizedOracle.sol");

contract('EthJpyCentralizedOracle', function(accounts) {
  var oracle;
  it("should return 2 for updated", function() {
    return EthJpyCentralizedOracle.new(accounts[0], 2, {from: accounts[0]}).then(function(instance) {
      oracle = instance;

      return oracle.getLastRate.call();
    }).then(function(lastRate) {
      assert.equal(lastRate, 2, "lastRate must be 2.");
    });
  });

  it("should update rate to 4", function() {
    // mine one block to change block time
    var result = web3.currentProvider.send({
      jsonrpc: "2.0",
      method: "evm_increaseTime",
      params: [86400],  // 86400 seconds in a day
    });

    console.log(result)

    return oracle.update(4, {from: accounts[0]}).then(function () {
        return oracle.getLastRate.call();
      }).then(function (lastRate) {
        assert.equal(lastRate, 4, "lastRate must be updated to 4");
      })
    });
});
