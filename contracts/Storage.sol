// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Storage {
    mapping (string => uint256) _uintStorage;
    mapping (string => address) _addressStorage;
    mapping (string => bool) _boolStorage;
    mapping (string => string) _StringStorage;
    mapping (string => bytes4) _bytes4Storage;
    address public owner;
    bool public _initialized;
}
