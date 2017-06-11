pragma solidity ^0.4.0;

import "./Publication.sol";


contract PublicationRegistry {

    mapping(uint => mapping(address => bool)) buyer;
    mapping(address => Publication) publications;

    Publication[] publications;

    modifier bookExists(uint _publicationID) {
        if (books.length < _publicationID)
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
    bookExists
    returns (bool)
    {
        return buyer[publicationID][_buyer];
    }


    function buy(address _from, uint publicationID)
    public
    bookExists
    isNotAlreadyBought
    {
        Publication publication = publications[publicationID];

        require(msg.value > publication.price());

        address(publication).pay.value(msg.value)(msg.sender);

        // check if sent ETH is higher than price;
        buyer[publicationID][_from] = true;
    }

    function registerPublication(address _publicationAddr) {
        publications[publications.length + 1] = Publication(_publicationAddr);
    }
}
