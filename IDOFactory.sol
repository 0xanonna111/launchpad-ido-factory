// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./IDOPool.sol";

contract IDOFactory {
    address[] public allPools;

    event PoolCreated(address indexed token, address poolAddress, uint256 poolIndex);

    function createPool(address _token, uint256 _rate, uint256 _cap) external returns (address pool) {
        pool = address(new IDOPool(_token, _rate, _cap, msg.sender));
        allPools.push(pool);
        emit PoolCreated(_token, pool, allPools.length - 1);
    }

    function getPoolsCount() external view returns (uint256) {
        return allPools.length;
    }
}
