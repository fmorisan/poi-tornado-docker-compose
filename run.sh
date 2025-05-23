#!/usr/bin/env bash

DOCKER=""

if [[ -f $(which docker) ]]; then
    DOCKER=docker
elif [[ -f $(which podman) ]]; then
    DOCKER=podman
fi

if [[ -z $DOCKER ]]; then
    echo 'Docker or Podman not found.'
    exit 1
fi

echo "Building UI"
./build-ui.sh

function ctrlc() {
    echo Shutting down gracefully...
    $DOCKER compose stop
    $DOCKER compose down
}

trap ctrlc INT

echo "Setting up your containers... This may take a while."
$DOCKER compose up --build
