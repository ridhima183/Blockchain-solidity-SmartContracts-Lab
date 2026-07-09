// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Factorial {

    // Returns the factorial of a number (iterative)
    function getFactorial(uint _number) public pure returns (uint) {
        uint result = 1;
        for (uint i = 2; i <= _number; i++) {
            result *= i;
        }
        return result;
    }
}
