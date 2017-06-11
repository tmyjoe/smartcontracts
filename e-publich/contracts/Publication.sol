pragma solidity ^0.4.0;


// TODO: Implement multisig wallet function
contract Publication {

    address owner;
    uint public price;
    bytes public ipfsHash;

    modifier onlyOwner() {
        if (owner != msg.sender)
            revert();
        _;
    }

    function Publication(uint _price, bytes _ipfsHash){
        owner = msg.sender;
        price = _price;
        ipfsHash = _ipfsHash;
    }

    function pay() payable {}

    function withdraw(uint _amount, address _to, bytes _data)
    onlyOwner
    {
        require(address(this).balance > _amount);
        require(_to.call.value(_amount)(_data));
    }
}
