// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title ChainLoom: Modular Smart Contract Infrastructure
contract ChainLoom {
    address public owner;
    mapping(bytes32 => address) public modules;

    event ModuleRegistered(bytes32 indexed name, address indexed moduleAddress);
    event ModuleUpdated(bytes32 indexed name, address indexed newModuleAddress);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function registerModule(bytes32 name, address moduleAddress) external onlyOwner {
        require(modules[name] == address(0), "Module already exists");
        modules[name] = moduleAddress;
        emit ModuleRegistered(name, moduleAddress);
    }

    function updateModule(bytes32 name, address newModuleAddress) external onlyOwner {
        require(modules[name] != address(0), "Module doesn't exist");
        modules[name] = newModuleAddress;
        emit ModuleUpdated(name, newModuleAddress);
    }


    function getModule(bytes32 name) external view returns (address) {
        return modules[name];
    }
}


