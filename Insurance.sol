// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Insurance {

    address public insurer;
    uint public premium = 1 ether;
    uint public payoutAmount = 2 ether;

    struct Policy {
        address holder;
        bool active;
        bool claimed;
    }

    mapping(address => Policy) public policies;

    constructor() {
        insurer = msg.sender;
    }

    // Buy insurance policy
    function buyPolicy() public payable {
        require(msg.value == premium, "Incorrect premium");

        policies[msg.sender] = Policy({
            holder: msg.sender,
            active: true,
            claimed: false
        });
    }

    // Simulate condition (e.g., accident verified)
    function triggerClaim(address user) public {
        require(msg.sender == insurer, "Only insurer can trigger");
        require(policies[user].active, "No active policy");
        require(!policies[user].claimed, "Already claimed");

        policies[user].claimed = true;
        policies[user].active = false;

        // Auto payout using call()
        (bool success, ) = payable(user).call{value: payoutAmount}("");
        require(success, "Payout failed");
    }

    // Fund contract (insurer deposits money)
    function fundContract() public payable {
        require(msg.sender == insurer, "Only insurer");
    }

    // Check contract balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}