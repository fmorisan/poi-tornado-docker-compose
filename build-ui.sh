#!/usr/bin/env zsh
set -e
source ~/.zshrc

if [[ -z $(which nvm) ]] then
    echo need nvm to build the UI, install it and try again
    exit 1
fi

nvm use 14
cd poi-tornado

if [[ ! -z $(uname -a | grep -i darwin) ]] then
    echo detected macos, running with arch -x86_64
    arch -x86_64 zsh -c "yarn && PROOF_REGISTRY_ADDRESS=0x510E4E569e847dFA537Fd24406e6dc52331C2aCa yarn generate"
else
    yarn
    yarn generate
fi
