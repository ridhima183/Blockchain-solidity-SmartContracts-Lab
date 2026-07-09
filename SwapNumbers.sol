// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SwapNumbers {

    // Swaps two numbers using a temporary variable and returns both
    function swap(uint _a, uint _b) public pure returns (uint, uint) {
        uint temp = _a;
        _a = _b;
        _b = temp;
        return (_a, _b);
    }

    // Swaps without a temporary variable (arithmetic trick)
    function swapWithoutTemp(uint _a, uint _b) public pure returns (uint, uint) {
        _a = _a + _b;
        _b = _a - _b;
        _a = _a - _b;
        return (_a, _b);
    }
}
