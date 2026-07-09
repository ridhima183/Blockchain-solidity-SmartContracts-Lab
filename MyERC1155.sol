// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyERC1155 {

    mapping(uint => mapping(address => uint)) public balanceOf;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Access control
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    // Mint multiple tokens
    function mint(address to, uint id, uint amount) public onlyOwner {
        balanceOf[id][to] += amount;
    }

    // Transfer tokens
    function transfer(address to, uint id, uint amount) public {
        require(balanceOf[id][msg.sender] >= amount, "Not enough balance");

        balanceOf[id][msg.sender] -= amount;
        balanceOf[id][to] += amount;
    }
}