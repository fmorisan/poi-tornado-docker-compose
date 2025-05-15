#!/bin/bash

echo "Creating contracts on anvil testnet..."
echo -n "Block Number: "
/root/.foundry/bin/cast block-number --rpc-url $RPC_URL

DEPLOYER_ADDRESS=$(/root/.foundry/bin/cast wallet address --private-key $PRIVATE_KEY)
DEPLOYER_ADDRESS=$DEPLOYER_ADDRESS /root/.foundry/bin/forge script script/Deploy.sol --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast
/root/.foundry/bin/cast send $PROOF_REGISTRY_ADDRESS 'updateRoot(uint256,bytes32)' 0x0f3254cbd51d47fe65ec1bec168d2f689f1eda6d2c8464ef3456bf2a7386b7c8 $(/root/.foundry/bin/cast to-bytes32 1) --rpc-url $RPC_URL --private-key $PRIVATE_KEY
/root/.foundry/bin/cast send $PROOF_REGISTRY_ADDRESS 'updateFees(uint256)' 77 $(/root/.foundry/bin/cast to-bytes32 1) --rpc-url $RPC_URL --private-key $PRIVATE_KEY
