// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayMaxMin {

    // Finds the largest number in an array
    function findMax(uint[] memory _numbers) public pure returns (uint) {
        require(_numbers.length > 0, "Array is empty");
        uint max = _numbers[0];
        for (uint i = 1; i < _numbers.length; i++) {
            if (_numbers[i] > max) {
                max = _numbers[i];
            }
        }
        return max;
    }

    // Finds the smallest number in an array
    function findMin(uint[] memory _numbers) public pure returns (uint) {
        require(_numbers.length > 0, "Array is empty");
        uint min = _numbers[0];
        for (uint i = 1; i < _numbers.length; i++) {
            if (_numbers[i] < min) {
                min = _numbers[i];
            }
        }
        return min;
    }

    // Returns the sum of all numbers in an array
    function findSum(uint[] memory _numbers) public pure returns (uint) {
        uint sum = 0;
        for (uint i = 0; i < _numbers.length; i++) {
            sum += _numbers[i];
        }
        return sum;
    }
}
