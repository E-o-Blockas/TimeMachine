// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract TimeMachine {
    mapping(address => uint256) public points; 
    uint256 public constant REWARD_THRESHOLD = 1000; 

    
    constructor() {
        points[msg.sender] = 100; 
    }

    
    function addPoints(uint256 _amount) public {
        points[msg.sender] += _amount;
    }

    
    function subtractPoints(uint256 _amount) public {
        points[msg.sender] -= _amount;
    }

    
    function checkReward(address _player) public view returns (bool) {
        return points[_player] >= REWARD_THRESHOLD;
    }
}