// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;

import "./Storage.sol";

contract Proxy is Storage{
    address currentAddress;

    constructor(address _currentAddress) {
        currentAddress = _currentAddress;
    }

    function upgrade(address _newAddress) public {
        currentAddress = _newAddress;
    }
    

   function processCallData(bytes memory data) internal returns (bytes memory) {
    require(currentAddress != address(0));
    address implementation = currentAddress;

    assembly {
        let result := delegatecall(gas(), implementation, add(data, 0x20), mload(data), 0, 0)
        let size := returndatasize()
        let ptr := mload(0x40)
        returndatacopy(ptr, 0, size)
        switch result
        case 0 { revert(ptr, size) }
        default { return (ptr, size) }
    }
  }

fallback() external  {
        // Forward all calls to the target contract
        address _impl = currentAddress;
        assembly {
            calldatacopy(0, 0, calldatasize())
            let result := delegatecall(gas(), _impl, 0, calldatasize(), 0, 0)
            returndatacopy(0, 0, returndatasize())
            switch result
                case 0 { revert(0, returndatasize()) }
                default { return(0, returndatasize()) }
        }
    }
}