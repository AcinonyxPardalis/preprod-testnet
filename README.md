# preprod-testnet
Cardano Preprod Testnet Node Setup

# Cardano Preprod Node Setup

This repository contains configuration files and helper scripts
for running a Cardano node connected to the **Preprod testnet**.

## What this repository is
- Preprod network configuration files
- Genesis files
- Node startup and CLI helper scripts

## What this repository is NOT
- It does NOT contain `cardano-node` or `cardano-cli`
- It does NOT contain blockchain data
- It does NOT contain private keys

## Requirements
- cardano-node and cardano-cli installed locally
- Linux or macOS
- Disk space (~30–40 GB for preprod)

## Running the node
```bash
./scripts/start-node.sh