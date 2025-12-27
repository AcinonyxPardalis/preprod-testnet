#!/usr/bin/env bash

TX_IN=$1
TX_COL=$2
POLICY_ID=$3
ASSET_NAME_HEX=$4
NAME=$5

cardano-cli conway transaction build \
  --testnet-magic 1 \
  --script-valid \
  --tx-in $TX_IN \
  --tx-in-collateral $TX_COL \
  --tx-out "$(cat ~/preprod/keys/$NAME/$NAME-address.addr)+2000000 + 1 $POLICY_ID.$ASSET_NAME_HEX" \
  --change-address $(cat ~/preprod/keys/$NAME/$NAME-address.addr) \
  --mint "1 $POLICY_ID.$ASSET_NAME_HEX" \
  --mint-script-file ~/my-plinth-project/on-chain/scripts/minting-policy.plutus \
  --mint-redeemer-file ~/my-plinth-project/on-chain/unit-redeemer.json \
  --required-signer-hash $(cat ~/preprod/keys/$NAME/$NAME-pkh.txt) \
  --out-file tx-raw-files/tx.raw
