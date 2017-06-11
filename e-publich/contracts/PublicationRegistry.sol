pragma solidity ^0.4.0;

import "./Publication.sol";


contract PublicationRegistry {

    mapping(uint => mapping(address => bool)) buyer;

    Publication[] publications;

    modifier publicationExists(uint _publicationID) {
        if (publications.length < _publicationID)
            revert();
        _;
    }

    modifier isNotAlreadyBought(address _from, uint publicationID) {
        if (buyer[publicationID][_from])
            revert();
        _;
    }

    function PublicationRegistry(){}

    function checkAuthorized (address _buyer, uint _publicationID)
    public
    publicationExists(_publicationID)
    returns (bool)
    {
        return buyer[_publicationID][_buyer];
    }


    function buy(address _from, uint _publicationID)
    public
    publicationExists(_publicationID)
    isNotAlreadyBought(_from, _publicationID)
    payable
    {
        Publication publication = publications[_publicationID];

        // check if sent ETH is higher than price;
        require(msg.value > publication.price());

        buyer[_publicationID][_from] = true;
        publication.pay.value(msg.value);
    }

    function registerPublication(address _publicationAddr) {
        publications[publications.length + 1] = Publication(_publicationAddr);
    }
}
