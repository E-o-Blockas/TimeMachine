// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./base/Level.sol";
import "./TimeMachine.sol";

contract TimeMachineFactory {
    mapping(address => address) public instances; 

    event InstanceCreated(address indexed player, address instance); 

    
    function createInstance() public {
        TimeMachine newTimeMachine = new TimeMachine();
        instances[msg.sender] = address(newTimeMachine);
        emit InstanceCreated(msg.sender, address(newTimeMachine));
    }

    
    function validateInstance(address _player) public view returns (bool) {
        TimeMachine instance = TimeMachine(instances[_player]);
        return instance.checkReward(_player);
    }
}