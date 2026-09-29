#!/bin/bash
NAME=$1
cardano-cli query utxo --address $(cat ~/preprod/keys/$NAME/$NAME-address.addr) --testnet-magic 1