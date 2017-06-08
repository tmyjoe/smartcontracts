pragma solidity 0.4.11;


// A centralized oracle.
contract CentralizedOracle {

    event NewRequest(uint);
    event Reply(uint, bytes32);

    address public owner;

    uint8 numOfRequests;
    mapping(uint => bytes32) requests;
    mapping(uint => bytes32) results;
    mapping(uint => bool) public isSet;

    /*
     *  Modifiers
     */
    modifier isOwner() {
        if (msg.sender != owner)
        // Only owner is allowed to proceed
        revert();
        _;
    }

    /*
    * Constructor.
    */
    function CentralizedOracle(address _owner) public {
        owner = _owner;
    }


    function query(bytes32 data)
    public
    {
        requests[numOfRequests] = data;
        NewRequest(numOfRequests);
        numOfRequests++;
    }

    function reply(uint requestID, bytes32 response)
    public
    isOwner
    {
        if (isSet[requestID])
            revert();

        Reply(requestID, response);
        results[requestID] = response;
        isSet[requestID] = true;
    }
}