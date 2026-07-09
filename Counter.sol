// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {

    int public count = 0;

    // Increase count by 1
    function increment() public {
        count += 1;
    }

    // Decrease count by 1
    function decrement() public {
        count -= 1;
    }

    // Reset count to zero
    function reset() public {
        count = 0;
    }

    // View current count
    function getCount() public view returns (int) {
        return count;
    }
}
