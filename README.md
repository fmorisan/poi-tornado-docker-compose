# PoI Tornado - Docker Compose setup

This repository contains dockerfiles to run all the PoI suite.

## Downloading
This repository uses submodules. When cloning, use
```
git clone --recursive git@github.com:fmorisan/poi-tornado-docker-compose.git
```

## Running
The included run.sh script should bring everything online.
```bash
./run.sh
```

## Setup
The UI is built outside docker, and thus requires `zsh` and `nvm` installed. There is an alternative `Dockerfile.ui` which tries building the UI within Docker, but it hangs on my machine.  
When running the UI, set the RPC to `http://localhost:8545` both on your wallet and the UI. You may also point the UI's custom relayer to `http://localhost:8000`
