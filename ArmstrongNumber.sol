// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// An Armstrong number equals the sum of its own digits,
// each raised to the power of the number of digits.
// Example: 153 = 1^3 + 5^3 + 3^3
contract ArmstrongNumber {

    function isArmstrong(uint _number) public pure returns (bool) {
        uint original = _number;
        uint digitCount = countDigits(_number);
        uint sum = 0;

        while (_number > 0) {
            uint digit = _number % 10;
            sum += power(digit, digitCount);
            _number /= 10;
        }

        return sum == original;
    }

    function countDigits(uint _number) internal pure returns (uint) {
        uint count = 0;
        while (_number > 0) {
            count++;
            _number /= 10;
        }
        return count;
    }

    function power(uint _base, uint _exp) internal pure returns (uint) {
        uint result = 1;
        for (uint i = 0; i < _exp; i++) {
            result *= _base;
        }
        return result;
    }
}
