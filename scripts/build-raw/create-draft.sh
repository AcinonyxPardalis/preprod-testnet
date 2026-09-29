#!/bin/bash
SENDER=$1
AMOUNT=$2
RECEIVER=$3

TX_IN=$($HOME/preprod/scripts/query-utxo-address.sh $SENDER | jq -r 'keys[0]')
TX_AMOUNT=$($HOME/preprod/scripts/query-utxo-address.sh $SENDER | jq -r '.[keys[0]].value.lovelace')


cardano-cli conway transaction build-raw \
    --tx-in $TX_IN \
    --tx-out $(cat ~/preprod/keys/$RECEIVER/$RECEIVER-address.addr)+$AMOUNT \
    --tx-out $(cat ~/preprod/keys/$RECEIVER/$RECEIVER-address.addr)+$((TX_AMOUNT - AMOUNT)) \
    --invalid-hereafter 0 \
    --fee 0 \
    --out-file ~/preprod/scripts/tx-temp-files/tx.draft