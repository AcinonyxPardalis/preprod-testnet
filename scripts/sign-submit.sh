#!/usr/bin/env bash
set -euo pipefail

NAME=$1

cardano-cli conway transaction sign \
  --tx-body-file ~/preprod/tx-raw-files/tx.raw \
  --signing-key-file ~/preprod/keys/$NAME/$NAME-signing.skey \
  --testnet-magic 1 \
  --out-file ~/preprod/tx-raw-files/tx.signed

cardano-cli conway transaction submit \
  --tx-file ~/preprod/tx-raw-files/tx.signed \
  --testnet-magic 1