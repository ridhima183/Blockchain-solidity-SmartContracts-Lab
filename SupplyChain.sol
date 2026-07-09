// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChain {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Roles
    mapping(address => bool) public isSupplier;
    mapping(address => bool) public isDistributor;
    mapping(address => bool) public isRetailer;

    // Product structure
    struct Product {
        uint id;
        string name;
        address currentOwner;
        string status;
    }

    mapping(uint => Product) public products;

    // Modifiers
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier onlySupplier() {
        require(isSupplier[msg.sender], "Not supplier");
        _;
    }

    modifier onlyDistributor() {
        require(isDistributor[msg.sender], "Not distributor");
        _;
    }

    modifier onlyRetailer() {
        require(isRetailer[msg.sender], "Not retailer");
        _;
    }

    // Assign roles
    function addSupplier(address addr) public onlyOwner {
        isSupplier[addr] = true;
    }

    function addDistributor(address addr) public onlyOwner {
        isDistributor[addr] = true;
    }

    function addRetailer(address addr) public onlyOwner {
        isRetailer[addr] = true;
    }

    // Create product (by supplier)
    function createProduct(uint _id, string memory _name) public onlySupplier {
        products[_id] = Product(_id, _name, msg.sender, "Created");
    }

    // Move to distributor
    function shipToDistributor(uint _id, address distributor) public onlySupplier {
        require(products[_id].currentOwner == msg.sender, "Not owner");
        require(isDistributor[distributor], "Invalid distributor");

        products[_id].currentOwner = distributor;
        products[_id].status = "Shipped to Distributor";
    }

    // Move to retailer
    function shipToRetailer(uint _id, address retailer) public onlyDistributor {
        require(products[_id].currentOwner == msg.sender, "Not owner");
        require(isRetailer[retailer], "Invalid retailer");

        products[_id].currentOwner = retailer;
        products[_id].status = "Shipped to Retailer";
    }

    // Sold to customer
    function sellProduct(uint _id) public onlyRetailer {
        require(products[_id].currentOwner == msg.sender, "Not owner");

        products[_id].status = "Sold";
    }

    // View product
    function getProduct(uint _id) public view returns (
        uint, string memory, address, string memory
    ) {
        Product memory p = products[_id];
        return (p.id, p.name, p.currentOwner, p.status);
    }
}