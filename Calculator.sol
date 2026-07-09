// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculator {

    // Basic arithmetic operations
    function add(int a, int b) public pure returns (int) {
        return a + b;
    }

    function subtract(int a, int b) public pure returns (int) {
        return a - b;
    }

    function multiply(int a, int b) public pure returns (int) {
        return a * b;
    }

    function divide(int a, int b) public pure returns (int) {
        require(b != 0, "Cannot divide by zero");
        return a / b;
    }

    function modulus(int a, int b) public pure returns (int) {
        require(b != 0, "Cannot divide by zero");
        return a % b;
    }
}
