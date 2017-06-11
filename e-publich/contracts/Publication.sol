pragma solidity ^0.4.0;


// TODO: Implement multisig wallet
contract Publication {

    address owner;
    uint public price;
    bytes public ipfsHash;

    function Publication(address _owner, uint _price, bytes _ipfsHash){
        owner = _owner;
        price = _price;
        ipfsHash = _ipfsHash;
    }

    function pay() payable {}

}
