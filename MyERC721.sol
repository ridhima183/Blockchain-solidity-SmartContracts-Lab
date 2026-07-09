// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyERC721 {

    string public name = "MyNFT";
    string public symbol = "MNFT";

    mapping(uint => address) public ownerOf;
    mapping(address => uint) public balanceOf;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Access control modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    // Mint NFT (only owner)
    function mint(address to, uint tokenId) public onlyOwner {
        require(ownerOf[tokenId] == address(0), "Already minted");

        ownerOf[tokenId] = to;
        balanceOf[to] += 1;
    }
}