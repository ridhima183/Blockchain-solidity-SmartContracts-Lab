// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);
}

contract TokenBank {

    IERC20 public token;

    mapping(address => uint) public deposits;
    mapping(address => uint) public borrowed;

    constructor(address _tokenAddress) {
        token = IERC20(_tokenAddress);
    }

    function deposit(uint amount) public {
        require(amount > 0, "Amount must be > 0");
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");
        deposits[msg.sender] += amount;
    }

    function withdraw(uint amount) public {
        require(deposits[msg.sender] >= amount, "Not enough deposit");
        deposits[msg.sender] -= amount;
        require(token.transfer(msg.sender, amount), "Transfer failed");
    }

    function borrow(uint amount) public {
        require(deposits[msg.sender] >= amount * 2, "Not enough collateral");
        borrowed[msg.sender] += amount;
        require(token.transfer(msg.sender, amount), "Transfer failed");
    }

    function repay(uint amount) public {
        require(borrowed[msg.sender] >= amount, "Nothing to repay");
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");
        borrowed[msg.sender] -= amount;
    }
}