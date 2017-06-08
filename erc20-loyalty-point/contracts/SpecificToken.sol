pragma solidity ^0.4.0;
import "./StandardToken.sol";

contract SpecificToken is StandardToken {

    string public constant name = "Tomoya Token";
    string public constant symbol = "TMY";
    uint8 public constant decimals = 18;

    function SpecificToken(){
        totalSupply = 10000000 * 10 ** 18;
        balances[msg.sender] = totalSupply ;
    }
}
