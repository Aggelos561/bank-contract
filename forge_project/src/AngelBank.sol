// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console} from "forge-std/Script.sol";

/* 
-- REENTRANCY ATTACKS --
--> Use reentrancy guards in solidity
--> Checks effects / interaction pattern
*/

contract AngelBank {
    mapping(address => uint256) private balances;
    uint256 public totalSupply;

    bool internal locked;

    modifier noReentrant() {
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false; // Executes after `withdraw` function has finished.
    }

    function deposit() external payable {
        balances[msg.sender] += msg.value;
        totalSupply += msg.value;
    }

    function withdraw() external /* noReentrant */ {
        uint256 balance = getUserBalance(msg.sender);

        require(balance > 0, "Insufficient balance");
        
        totalSupply -= balance;

        console.log("Hello from withdraw");

        // balances[msg.sender] = 0; EFFECTS PATTERN HERE

        (bool success, ) = msg.sender.call{value: balance}("");
        require(success, "Failed to send Ether");
        
        balances[msg.sender] = 0;
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function getUserBalance(address _user) public view returns (uint256) {
        return balances[_user];
    }

    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }
}
