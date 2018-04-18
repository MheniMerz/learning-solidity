pragma solidity ^0.4.0;


contract MyToken {
    uint8 myNumber = 5;
    address owner;
    mapping (address => uint256) public balances;
    
    function MyToken () public {
        // msg.sender gives the address of whom ever is calling the contract
        // you can give percentages to different addresses
        owner = msg.sender;
        // set the number of tokens of the owner that's the supply
        balances[owner] = 999;
    }
    
    //give this amount to this address
    function transfer(uint amount, address recipient) public {
        // checks
        require(balances[msg.sender] >= amount);
        require(balances[msg.sender] - amount <= balances[msg.sender]);
        require(balances[recipient] + amount >= balances[recipient]);
        // debit and credit
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }
}