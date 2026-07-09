// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOPool {

    // Liquidity tracking
    mapping(address => uint) public liquidity;
    uint public totalLiquidity;

    // DAO structure
    struct Proposal {
        string description;
        uint votes;
        bool executed;
    }

    Proposal[] public proposals;
    mapping(address => mapping(uint => bool)) public voted;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // 🔹 Add liquidity
    function deposit() public payable {
        require(msg.value > 0, "Send ETH");

        liquidity[msg.sender] += msg.value;
        totalLiquidity += msg.value;
    }

    // 🔹 Withdraw liquidity
    function withdraw(uint amount) public {
    require(liquidity[msg.sender] >= amount, "Not enough balance");

    liquidity[msg.sender] -= amount;
    totalLiquidity -= amount;

    (bool success, ) = payable(msg.sender).call{value: amount}("");
    require(success, "Transfer failed");
}

    // 🔹 Create proposal (only liquidity providers)
    function createProposal(string memory desc) public {
        require(liquidity[msg.sender] > 0, "Only members");

        proposals.push(Proposal({
            description: desc,
            votes: 0,
            executed: false
        }));
    }

    // 🔹 Vote on proposal
    function vote(uint proposalId) public {
        require(liquidity[msg.sender] > 0, "Only members");
        require(!voted[msg.sender][proposalId], "Already voted");

        proposals[proposalId].votes += liquidity[msg.sender];
        voted[msg.sender][proposalId] = true;
    }

    // 🔹 Execute proposal
    function execute(uint proposalId) public {
        Proposal storage p = proposals[proposalId];

        require(!p.executed, "Already executed");
        require(p.votes > totalLiquidity / 2, "Not enough votes");

        p.executed = true;
    }

    // 🔹 View proposals
    function getProposals() public view returns (Proposal[] memory) {
        return proposals;
    }
}