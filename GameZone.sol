// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract GameToken is ERC20, Ownable {
    uint public initialSupply;
    //address payable owner = payable(msg.sender);
    uint public tokenSupply;
    mapping(address => uint) balances;

    // inherit all functionality from the ERC20 base contract
    constructor(uint _initialSupply) ERC20("GAMER", "GAM") {
        // call the internal _mint function, taking 2 parameters
        // the totalSupply from our constructor will fill the amount
        // msg.sender will receive the tokens
        _mint(msg.sender, _initialSupply * (10 ** decimals()));
        initialSupply = _initialSupply * (10 ** decimals());
        tokenSupply += initialSupply; //update the total supply
        balances[msg.sender] = _initialSupply; //update the balances
    }

    // a mint function
    // only the owner can call
    // mint to an address
    function mint(address _to, uint _amount) public onlyOwner {
        _mint(_to, _amount * (10 ** decimals())); //calls the internal mint function
        tokenSupply += _amount; //update the total supply
        balances[_to] += _amount; // update the balances mapping
    }
}