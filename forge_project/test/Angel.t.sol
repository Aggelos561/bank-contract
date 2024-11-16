// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Angel} from "../src/Angel.sol";

contract AngelTest is Test {
    Angel public token;
    address user1;
    address user2;

    function setUp() public {
        user1 = address(1);
        user2 = address(2);

        vm.prank(user1);
        token = new Angel(100);
    }

    function testSymbols() view public {
        assertEq(token.name(), "Angel");
        assertEq(token.symbol(), "$");
        assertEq(token.decimals(), 8);

    }

    function testInitBalance() public {
        vm.prank(user1);
        uint256 myBalance = token.balanceOf(user1);
        
        console.log("User 1 balance is: ", myBalance);
        assertEq(myBalance, 100);
    }

    function testTotalSupply() view public {     
        assertEq(token.totalSupply(), 100);
    }

    function testTransfer() public {
        vm.prank(user1);
        token.transfer(user2, 100);

        uint256 user1Balance = token.balanceOf(user1);
        uint256 user2Balance = token.balanceOf(user2);

        console.log("User 1 balance is: ", user1Balance);
        console.log("User 2 balance is: ", user2Balance);

        assertEq(user1Balance, 0);
        assertEq(user2Balance, 100);
    }

    function testApprove() public {
        vm.prank(user1);
        token.increaseAllowance(user2, 100);
        uint256 allowance = token.allowance(user1, user2);

        console.log("Allowance from user 1 to user 2 is: ", allowance);
        assertEq(allowance, 100);

        vm.prank(user2);
        token.increaseAllowance(user1, 100);
        allowance = token.allowance(user2, user1);

        console.log("Allowance from user 2 to user 1 is: ", allowance);
        assertEq(allowance, 100);

        vm.prank(user2);
        token.transferFrom(user1, user2, 100);
        allowance = token.allowance(user1, user2);
        assertEq(allowance, 0);
        
    }
}
