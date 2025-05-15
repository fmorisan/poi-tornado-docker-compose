#!/usr/bin/env zsh
set -e
source ~/.zshrc

if [[ -z $(which nvm) ]]; then
    echo need nvm to build the UI, install it and try again
    exit 1
fi

nvm use 14
cd poi-tornado

if [[ ! -z $(uname -a | grep -i darwin) ]]; then
    echo detected macos, running with arch -x86_64
    arch -x86_64 zsh -c "yarn && PROOF_REGISTRY_ADDRESS=0x99aa73da6309b8ec484ef2c95e96c131c1bbf7a0 yarn generate"
else
    yarn
    yarn generate
fi
