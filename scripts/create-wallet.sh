#!/bin/bash
WALLET_NAME=$1
mkdir ~/preprod/keys/$WALLET_NAME
cardano-cli address key-gen --verification-key-file ~/preprod/keys/$WALLET_NAME/$WALLET_NAME-verification.vkey --signing-key-file ~/preprod/keys/$WALLET_NAME/$WALLET_NAME-signing.skey
cardano-cli address build --payment-verification-key-file ~/preprod/keys/$WALLET_NAME/$WALLET_NAME-verification.vkey --testnet-magic 1 --out-file ~/preprod/keys/$WALLET_NAME/$WALLET_NAME-address.addr