#!/bin/bash

TTL_SLOTS=$1
CURRENT_SLOT=$(cardano-cli query tip --testnet-magic 1 | jq .slot)

echo $((CURRENT_SLOT + TTL_SLOTS))