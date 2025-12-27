#!/bin/bash
NAME=$1
cardano-cli address key-hash \
  --payment-verification-key-file ~/preprod/keys/$NAME/$NAME-verification.vkey
