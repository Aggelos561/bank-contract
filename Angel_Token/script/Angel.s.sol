// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Angel} from "../src/Angel.sol";

contract AngelScript is Script {
    Angel public token;

    function setUp() public {
        token = new Angel(1000);
    }

    function run() public {
        vm.startBroadcast();

        vm.stopBroadcast();
    }
}
