#!/bin/bash
yarn server &
yarn priceWatcher &
yarn treeWatcher &
yarn worker &
yarn healthWatcher &

wait -n
exit $?
