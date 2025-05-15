#!/bin/bash

echo "Creating contracts on anvil testnet..."
echo -n "Block Number: "
/root/.foundry/bin/cast block-number --rpc-url $RPC_URL

DEPLOYER_ADDRESS=$(/root/.foundry/bin/cast wallet address --private-key $PRIVATE_KEY)
DEPLOYER_ADDRESS=$DEPLOYER_ADDRESS /root/.foundry/bin/forge script script/Deploy.sol --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast
/root/.foundry/bin/cast send 0x510E4E569e847dFA537Fd24406e6dc52331C2aCa 'updateRoot(uint256,bytes32)' 6873620323993782603944420351984586107457721017538294381362105471703919802312 $(/root/.foundry/bin/cast to-bytes32 1) --rpc-url $RPC_URL --private-key $PRIVATE_KEY
/root/.foundry/bin/cast send 0x510E4E569e847dFA537Fd24406e6dc52331C2aCa 'updateFees(uint256)' 77 $(/root/.foundry/bin/cast to-bytes32 1) --rpc-url $RPC_URL --private-key $PRIVATE_KEY
