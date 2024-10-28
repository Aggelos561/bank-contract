// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MyExample} from "../src/MyExample.sol";

contract MyExampleTest is Test {

    MyExample example;

    function setUp() public {
        example = new MyExample(10);
    }

    function testGetCount() public {
        int value = example.getNumber();
        assertEq(value, 10);
        emit log_named_int("The value is: ", value);
    }

    function testIncrementCounter() public {
        example.increment();

        int value = example.getNumber();

        assertEq(value, 11);
    
        emit log_named_int("The value is: ", value);
    }

    function testUsersBalance() public {

        address user1 = address(1);
        address user2 = address(2);

        vm.deal(user1, 1 ether);
        vm.deal(user2, 2 ether);

        vm.prank(user1);
        example.getUserID{value: 1 ether}();
        
        vm.prank(user2);
        example.getUserID{value: 2 ether}();

        console.log("User1 balance: ", user1.balance);
        console.log("User2 balance: ", user2.balance);
    }
}
