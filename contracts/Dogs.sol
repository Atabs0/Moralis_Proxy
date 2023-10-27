// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;
import "./Storage.sol";


contract Dog is Storage {
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    constructor() {
        owner = msg.sender;
    }

   function getNumberOfDogs() public view  returns (uint256){
    return _uintStorage["Dogs"];
   }

   function setNumberOfDogs(uint256 toSet)public {
    _uintStorage["Dogs"]=toSet;
   }

}