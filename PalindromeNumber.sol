// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PalindromeNumber {

    // Returns true if the number reads the same forwards and backwards
    function isPalindrome(uint _number) public pure returns (bool) {
        uint original = _number;
        uint reversed = 0;

        while (_number > 0) {
            uint digit = _number % 10;
            reversed = reversed * 10 + digit;
            _number /= 10;
        }

        return reversed == original;
    }
}
