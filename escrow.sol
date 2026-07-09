// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Escrow {

    address public buyer;
    address public seller;
    uint public amount;

    bool public isDeposited;
    bool public isReleased;

    constructor(address _seller) {
        buyer = msg.sender;
        seller = _seller;
    }

    function deposit() public payable {
        require(msg.sender == buyer, "Only buyer");
        require(!isDeposited, "Already deposited");

        amount = msg.value;
        isDeposited = true;
    }

    function confirmDelivery() public {
    require(msg.sender == buyer, "Only buyer");
    require(isDeposited, "No deposit");
    require(!isReleased, "Already released");

    isReleased = true;

    (bool success, ) = payable(seller).call{value: amount}("");
    require(success, "Payment failed");
}
}