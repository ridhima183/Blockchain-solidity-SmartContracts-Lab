// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fibonacci {

    // Returns the n-th Fibonacci number (0-indexed)
    function getFibonacci(uint _n) public pure returns (uint) {
        if (_n == 0) return 0;
        if (_n == 1) return 1;

        uint a = 0;
        uint b = 1;
        uint c;

        for (uint i = 2; i <= _n; i++) {
            c = a + b;
            a = b;
            b = c;
        }
        return b;
    }

    // Returns the first n Fibonacci numbers as an array
    function getFibonacciSeries(uint _n) public pure returns (uint[] memory) {
        uint[] memory series = new uint[](_n);
        for (uint i = 0; i < _n; i++) {
            series[i] = getFibonacci(i);
        }
        return series;
    }
}
