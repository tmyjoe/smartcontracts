pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SpecificToken.sol";

contract TestMetacoin {

  function testInitialBalanceUsingDeployedContract() {
    SpecificToken meta = SpecificToken(DeployedAddresses.SpecificToken());

    uint expected = 10000000 * 10 ** 18;

    Assert.equal(meta.totalSupply(), expected, "Owner should have 10000 MetaCoin initially");
  }

//  function testInitialBalanceWithNewMetaCoin() {
//    MetaCoin meta = new MetaCoin();
//
//    uint expected = 10000;
//
//    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
//  }

}
