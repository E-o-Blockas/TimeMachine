const TimeMachineFactory = artifacts.require('./TimeMachineFactory.sol');
const TimeMachine = artifacts.require('./TimeMachine.sol');
const TimeMachineAttack = artifacts.require('./TimeMachineAttack.sol');

const Ethernaut = artifacts.require('./Ethernaut.sol');
const { expectRevert } = require('@openzeppelin/test-helpers');

contract('TimeMachine', function(accounts) {
  let ethernaut;
  let level;
  let player = accounts[0];

  before(async function() {
    ethernaut = await Ethernaut.new();
    level = await TimeMachineFactory.new();
    await ethernaut.registerLevel(level.address);
  });

  it('should allow the player to solve the level', async function() {
    let instance = await level.createInstance(player, { from: player });
    let timeMachineInstance = await TimeMachine.at(instance);
    let attacker = await TimeMachineAttack.new(instance);

    await attacker.exploit({ from: player });

    // Verificação da solução
    let completed = await level.validateInstance(instance, player);
    assert.equal(completed, true, 'should allow the player to solve the level');
  });
});