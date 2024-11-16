// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console} from "forge-std/Script.sol";

contract Angel {
    
    uint256 _totalSupply;
    
    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowed;

    constructor (uint256 _initialSupply) {
        require(_initialSupply > 0, "Initial supply must be greater than zero");
        _totalSupply = _initialSupply;
        _balances[msg.sender] = _initialSupply;
    }

    function name() external pure returns (string memory) {
        return "Angel";
    }

    function symbol() external pure returns (string memory) {
        return "$";
    }

    function decimals() external pure returns (uint8) {
        return 8;
    }

    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner) external view returns (uint256 balance) {
        balance = _balances[_owner];
    }

    function transfer(address _to, uint256 _value) external returns (bool) {
        _balances[msg.sender] -= _value;
        _balances[_to] += _value;

        return true;
    }

    function increaseAllowance(address spender, uint256 value) external returns (bool) {
        _allowed[msg.sender][spender] += value;
        return true;
    }

    function decreaseAllowance(address spender, uint256 value) external returns (bool) {
        _allowed[msg.sender][spender] -= value;
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) external returns (bool) {
        require(_balances[_from] >= _value, "Not enough Sepolia ETH");
        require(_allowed[_from][msg.sender] >= _value);

        _balances[_from] -= _value;
        _balances[_to] += _value;
        _allowed[_from][msg.sender] -= _value;

        return true;
    }

    function allowance(address _owner, address _spender) external view returns (uint256 remaining) {
        remaining = _allowed[_owner][_spender];
    }

}
