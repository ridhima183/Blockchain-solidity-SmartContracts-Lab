// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OddEven {

    // Returns true if the number is even, false if odd
    function isEven(uint _number) public pure returns (bool) {
        return _number % 2 == 0;
    }

    // Returns a readable string result
    function checkNumber(uint _number) public pure returns (string memory) {
        if (_number % 2 == 0) {
            return "Even";
        } else {
            return "Odd";
        }
    }
}
