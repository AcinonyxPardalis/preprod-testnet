#!/bin/bash

SENDER=$1
AMOUNT=$2
RECEIVER=$3
TTL=$4
DRAFT=$5

TX_IN=$($HOME/preprod/scripts/query-utxo-address.sh $SENDER | jq -r 'keys[0]')
TX_AMOUNT=$($HOME/preprod/scripts/query-utxo-address.sh $SENDER | jq -r '.[keys[0]].value.lovelace')
FEE=$($HOME/preprod/scripts/build-raw/calculate-fee.sh $DRAFT)


cardano-cli conway transaction build-raw \
    --tx-in $TX_IN \
    --tx-out $(cat ~/preprod/keys/$RECEIVER/$RECEIVER-address.addr)+$AMOUNT \
    --tx-out $(cat ~/preprod/keys/$SENDER/$SENDER-address.addr)+$((TX_AMOUNT - AMOUNT - FEE)) \
    --invalid-hereafter $($HOME/preprod/scripts/build-raw/time-to-live.sh $TTL) \
    --fee $FEE \
    --out-file ~/preprod/scripts/tx-temp-files/tx.raw