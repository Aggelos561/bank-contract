// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import {console} from "forge-std/Script.sol";

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

    function getUserID() public payable  {
        require(msg.value > 1, "Give me at least 1 Ether");
        console.log("Called by ", msg.sender);
    }
}