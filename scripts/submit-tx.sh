#!/bin/bash
SIGNED=$1

cardano-cli conway transaction submit \
  --tx-file $SIGNED \
  --testnet-magic 1