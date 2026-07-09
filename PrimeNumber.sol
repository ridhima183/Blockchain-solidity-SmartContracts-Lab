// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PrimeNumber {

    // Returns true if the number is prime
    function isPrime(uint _number) public pure returns (bool) {
        if (_number < 2) {
            return false;
        }
        for (uint i = 2; i * i <= _number; i++) {
            if (_number % i == 0) {
                return false;
            }
        }
        return true;
    }
}
