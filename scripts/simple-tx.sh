#!/bin/bash
SENDER=$1
TX_IN=$2
RECEIVER=$3
AMOUNT=$4

cardano-cli conway transaction build \
  --testnet-magic 1 \
  --tx-in $TX_IN \
  --tx-out "$(cat ~/preprod/keys/$RECEIVER/$RECEIVER-address.addr)+5000000" \
  --change-address $(cat ~/preprod/keys/$SENDER/$SENDER-address.addr) \
  --out-file ~/preprod/tx-raw-files/tx.raw