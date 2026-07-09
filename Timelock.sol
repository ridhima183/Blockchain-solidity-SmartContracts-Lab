// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TimeLock {

    address public owner;
    uint public unlockTime;

    constructor(uint _unlockTime) {
        owner = msg.sender;
        unlockTime = block.timestamp + _unlockTime;
    }

    function deposit() public payable {}

    function withdraw() public {
    require(block.timestamp >= unlockTime, "Funds locked");
    require(msg.sender == owner, "Not owner");

    (bool success, ) = payable(owner).call{value: address(this).balance}("");
    require(success, "Withdrawal failed");
}
}