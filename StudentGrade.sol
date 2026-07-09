// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentGrade {

    // Calculates grade based on marks (out of 100)
    function getGrade(uint _marks) public pure returns (string memory) {
        require(_marks <= 100, "Marks cannot exceed 100");

        if (_marks >= 90) {
            return "A+";
        } else if (_marks >= 80) {
            return "A";
        } else if (_marks >= 70) {
            return "B";
        } else if (_marks >= 60) {
            return "C";
        } else if (_marks >= 40) {
            return "D";
        } else {
            return "Fail";
        }
    }

    // Calculates average of an array of marks
    function getAverage(uint[] memory _marks) public pure returns (uint) {
        require(_marks.length > 0, "No marks provided");
        uint total = 0;
        for (uint i = 0; i < _marks.length; i++) {
            total += _marks[i];
        }
        return total / _marks.length;
    }
}
