// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {AngelBank} from "../src/AngelBank.sol";

contract AngelBankTest is Test {
    AngelBank tokenContract;
    address owner;
    address user;

    function setUp() public {
        tokenContract = new AngelBank();
        owner = address(this);
        user = address(0x123);
    }

    function testInitialState() public {       
        assertEq(tokenContract.totalSupply(), 0);
    }

    function testDeposit() public {
        uint256 depositAmount = 1 ether;

        vm.deal(user, depositAmount);
        vm.prank(user);
        tokenContract.deposit{value: depositAmount}();
        assertEq(tokenContract.totalSupply(), depositAmount);
    }

    function testWithdraw() public {
        uint256 depositAmount = 1 ether;
        uint256 withdrawAmount = 0.5 ether;

        vm.deal(user, depositAmount);
        vm.prank(user);
        tokenContract.deposit{value: depositAmount}();

        vm.prank(user);

        assertEq(tokenContract.totalSupply(), depositAmount - withdrawAmount);
    }
}
