// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Script} from 'forge-std/Script.sol';
import {IERC20} from 'forge-std/interfaces/IERC20.sol';

import {ProofRegistry} from 'contracts/ProofRegistry.sol';

contract Deploy is Script {
  function run() public {
    vm.startBroadcast();
    // new Greeter(_params.greeting, _params.token);
    ProofRegistry impl = new ProofRegistry();
    address owner = vm.envAddress("DEPLOYER_ADDRESS");

    // first account from foundry test test...junk seed
    impl.initialize(owner, 0);
    impl.updatePostman(owner, true);

    vm.stopBroadcast();
  }
}
