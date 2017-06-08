pragma solidity 0.4.11;


// A ETH_JPY rate feeding oracle.
contract EthJpyCentralizedOracle {

    // An event fired when rate updated.
    event RateUpdated(uint8 rate);

    // Validity time for rate.
    uint constant validity = 60;

    address public owner;

    uint public lastUpdateTimestamp;
    // ETH_JPY rate in japanese exchanges.
    uint8 lastRate;

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
    function EthJpyCentralizedOracle(address _owner, uint8 _rate) public {
        owner = _owner;
        lastRate = _rate;
    }

    // check if the price data is valid or not.
    function isStillValid() returns (bool) {
        return now - lastUpdateTimestamp <= validity;
    }

    function getLastRate()
    returns (uint) {
        assert(isStillValid());
        return lastRate;
    }


    function update(uint8 rate)
    public
    isOwner
    {
        assert(lastUpdateTimestamp != now);

        // Update timestamp and rate.
        lastUpdateTimestamp = now;
        lastRate = rate;

        RateUpdated(rate);
    }
}