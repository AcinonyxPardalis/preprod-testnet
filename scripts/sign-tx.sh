#!/bin/bash
NAME=$1

cardano-cli conway transaction sign \
  --tx-body-file ~/preprod/scripts/tx-temp-files/tx.raw \
  --signing-key-file ~/preprod/keys/$NAME/$NAME-signing.skey \
  --testnet-magic 1 \
  --out-file ~/preprod/scripts/tx-temp-files/tx.signed