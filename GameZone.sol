// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract GameToken is ERC20, ownable {
    uint public initialSupply;
    address payable owner = payable(msg.sender);
    uint public totalSupply;
    mapping(address => uint) balances;

    // inherit all functionality from the ERC20 base contract
    constructor(uint _initialSupply) ERC20("GAMER", "GAM") {
        // call the internal _mint function, taking 2 parameters
        // the totalSupply from our constructor will fill the amount
        // msg.sender will receive the tokens
        _mint(owner, _initialSupply * (10 ** decimals()));
        initialSupply = _initialSupply * (10 ** decimals());
        totalSupply += initialSupply; //update the total supply
        balances[owner] = _initialSupply; //update the balances
    }

    // a mint function
    // only the owner can call
    // mint to an address
    function mint(address _to, uint _amount) public onlyOwner {
        payable(_to).transfer(_amount);
        totalSupply += _amount; //update the total supply
        balances[_to] += _amount; // update the balances mapping
    }
}
