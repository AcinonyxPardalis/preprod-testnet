#!/usr/bin/env bash
set -euo pipefail

WALLET_NAME=$1
mkdir ~/preprod/keys/$WALLET_NAME
cardano-cli address key-gen --verification-key-file ~/preprod/keys/$WALLET_NAME/$WALLET_NAME-verification.vkey --signing-key-file ~/preprod/keys/$WALLET_NAME/$WALLET_NAME-signing.skey
cardano-cli address build --payment-verification-key-file ~/preprod/keys/$WALLET_NAME/$WALLET_NAME-verification.vkey --testnet-magic 1 --out-file ~/preprod/keys/$WALLET_NAME/$WALLET_NAME-address.addr
cardano-cli address key-hash --payment-verification-key-file keys/$WALLET_NAME/$WALLET_NAME-verification.vkey --out-file ~/preprod/keys/$WALLET_NAME/$WALLET_NAME-pkh.txt