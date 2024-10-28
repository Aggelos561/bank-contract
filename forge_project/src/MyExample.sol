// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

contract MyExample {

    int private number;

    constructor (int _number) {
        number = _number;
    }

    function increment() public {
        number += 1;
    }

    function decrement() public {
        number -= 1;
    }

    function getNumber() public view returns (int) {
        return number;
    }
}