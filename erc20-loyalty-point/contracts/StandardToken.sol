pragma solidity 0.4.11;
import "./ERC20Token.sol";

/// @title Standard token contract - Standard token interface implementation
contract StandardToken is Token {

    /*
     *  Storage
     */
    mapping (address => uint) balances;
    mapping (address => mapping (address => uint)) allowances;
    uint public totalSupply;

    /*
     *  Public functions
     */
    /// @dev Transfers sender's tokens to a given address. Returns success
    /// @param to Address of token receiver
    /// @param value Number of tokens to transfer
    /// @return Returns success of function call
    function transfer(address to, uint value)
    public
    returns (bool) {
        if (balances[msg.sender] < value)
        // Balance too low
        revert();
        balances[msg.sender] -= value;
        balances[to] += value;
        Transfer(msg.sender, to, value);
        return true;
    }

    /// @dev Allows allowed third party to transfer tokens from one address to another. Returns success
    /// @param from Address from where tokens are withdrawn
    /// @param to Address to where tokens are sent
    /// @param value Number of tokens to transfer
    /// @return Returns success of function call
    function transferFrom(address from, address to, uint value)
    public
    returns (bool) {
        if (balances[from] < value || allowances[from][msg.sender] < value)
        // Balance or allowance too low
        revert();
        balances[to] += value;
        balances[from] -= value;
        allowances[from][msg.sender] -= value;
        Transfer(from, to, value);
        return true;
    }

    /// @dev Sets approved amount of tokens for spender. Returns success
    /// @param _spender Address of allowed account
    /// @param value Number of approved tokens
    /// @return Returns success of function call
    function approve(address _spender, uint value)
    public
    returns (bool) {
        allowances[msg.sender][_spender] = value;
        Approval(msg.sender, _spender, value);
        return true;
    }

    /// @dev Returns number of allowed tokens for given address
    /// @param _owner Address of token owner
    /// @param _spender Address of token spender
    /// @return Returns remaining allowance for spender
    function allowance(address _owner, address _spender)
    public
    constant
    returns (uint) {
        return allowances[_owner][_spender];
    }

    /// @dev Returns number of tokens owned by given address
    /// @param _owner Address of token owner
    /// @return Returns balance of owner
    function balanceOf(address _owner)
    public
    constant
    returns (uint) {
        return balances[_owner];
    }
}