#!/bin/bash

SENDER=$1
AMOUNT=$2
RECEIVER=$3
TTL=$4 #time in seconds (roughly) I want the transaction to be valid

TX_IN=$($HOME/preprod/scripts/query-utxo-address.sh $SENDER | jq -r 'keys[0]') #takes the first utxo of the sender
TX_AMOUNT=$($HOME/preprod/scripts/query-utxo-address.sh $SENDER | jq -r '.[keys[0]].value.lovelace') #takes the value of the first utxo of the sender

$HOME/preprod/scripts/build-raw/create-draft.sh $SENDER $AMOUNT $RECEIVER
DRAFT=$HOME/preprod/scripts/tx-temp-files/tx.draft

$HOME/preprod/scripts/build-raw/create-raw.sh $SENDER $AMOUNT $RECEIVER $TTL $DRAFT
RAW=$HOME/preprod/scripts/tx-temp-files/tx.raw

$HOME/preprod/scripts/build-raw/create-raw.sh $SENDER $AMOUNT $RECEIVER $TTL $RAW
RAW=$HOME/preprod/scripts/tx-temp-files/tx.raw

$HOME/preprod/scripts/sign-tx.sh $SENDER $RAW
SIGNED=$HOME/preprod/scripts/tx-temp-files/tx.signed

$HOME/preprod/scripts/submit-tx.sh $SIGNED