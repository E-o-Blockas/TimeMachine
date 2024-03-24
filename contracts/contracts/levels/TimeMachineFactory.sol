// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./base/Level.sol";
import "./TimeMachine.sol";

// Esta é a definição correta do contrato, herdando de Level
contract TimeMachineFactory is Level {

    // Método para criar uma instância de TimeMachine
    function createInstance(address _player) override public payable returns (address) {
        _player; // Esta linha parece não ter efeito. Se deseja evitar warnings, considere outra abordagem.
        TimeMachine instance = new TimeMachine();
        return address(instance);
    }

    // Método para validar uma instância de TimeMachine
    function validateInstance(address payable _instance, address _player) override public view returns (bool) {
        TimeMachine instance = TimeMachine(_instance);
        return instance.owner() == _player;
    }
}
//     mapping(address => address) public instances; 

//     event InstanceCreated(address indexed player, address instance); 

    
//     function createInstance() public {
//         TimeMachine newTimeMachine = new TimeMachine();
//         instances[msg.sender] = address(newTimeMachine);
//         emit InstanceCreated(msg.sender, address(newTimeMachine));
//     }

    
//     function validateInstance(address _player) public view returns (bool) {
//         TimeMachine instance = TimeMachine(instances[_player]);
//         return instance.checkReward(_player);
//     }
// }
