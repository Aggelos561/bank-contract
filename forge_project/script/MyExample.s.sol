// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {MyExample} from "../src/MyExample.sol";

contract MyExampleScript is Script {

    function setUp() public {
        
    }

    function run() public {
        vm.startBroadcast();

        new MyExample(10);

        vm.stopBroadcast();
    }
}