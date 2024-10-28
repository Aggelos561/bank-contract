// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console} from "forge-std/Script.sol";

contract Angel {
    uint256 _totalSupply;
    
    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowed;

    constructor (uint256 _initialSupply) {
        _totalSupply = _initialSupply;
        _balances[msg.sender] = _initialSupply;
    }

    function name() public pure returns (string memory) {
        return "Angel";
    }

    function symbol() public pure returns (string memory) {
        return "$";
    }

    function decimals() public pure returns (uint8) {
        return 8;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        balance = _balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        _balances[msg.sender] -= _value;
        _balances[_to] += _value;

        success = true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        _allowed[msg.sender][_spender] = _value;

        success = true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {

        _balances[_from] -= _value;
        _balances[_to] += _value;

        success = true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        remaining = _allowed[_owner][_spender];
    }

}
