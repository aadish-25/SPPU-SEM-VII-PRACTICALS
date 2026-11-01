// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Bank{
    address public owner;
    uint256 private balance;

    constructor(){
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balance += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(amount > 0, "Amount to be withdrawn must be greater than 0");
        require(amount <= balance, "Insufficient balance");

        balance -= amount;
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Transaction failed");
    }

    function showBalance() view public returns(uint256){
        return balance;
    }
}