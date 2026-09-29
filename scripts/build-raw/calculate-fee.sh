#!/bin/bash

RAW_FILE=$1

cardano-cli conway transaction calculate-min-fee \
    --tx-body-file $RAW_FILE \
    --witness-count 1 \
    --byron-witness-count 0 \
    --protocol-params-file ~/preprod/config\ files/protocol.json \
    | jq -r '.fee'

#--tx-in-count 1 \
    #--tx-out-count 2 \--testnet-magic 1 \
    