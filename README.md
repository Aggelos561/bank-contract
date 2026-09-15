# Bank Contract Experiments

Small experimental Solidity contracts and Foundry tests. This repository is for learning and testing smart-contract ideas, not for production use or real funds.

## Project layout

The Foundry project lives in [`forge_project`](forge_project/).

- `src/` contains the example contracts.
- `test/` contains Foundry tests.
- `script/` contains deployment and experiment scripts.
- `lib/forge-std/` contains the Foundry standard library.

The main examples include:

- `Angel.sol`: a small token-style contract.
- `AngelBank.sol`: a simple Ether deposit and withdrawal example.
- `script/AngelBank.s.sol`: an experimental reentrancy demonstration.
- `Counter.sol` and `MyExample.sol`: basic Foundry learning examples.

## Requirements

- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- Git, including submodule support

## Setup

Clone the repository and initialize the Foundry standard library:

```sh
git clone <repository-url>
cd bank-contract/forge_project
git submodule update --init --recursive
```

## Common commands

Run these commands from `forge_project/`:

```sh
# Compile contracts
forge build

# Run tests
forge test

# Check formatting
forge fmt --check

# Format Solidity files
forge fmt
```

To run a script against a local Anvil node, start Anvil in one terminal and provide deployment configuration through your local shell environment. Never commit private keys, seed phrases, API keys, or `.env` files.

```sh
anvil
forge script script/Counter.s.sol:CounterScript \
	--rpc-url http://127.0.0.1:8545 \
	--private-key <local-anvil-private-key> \
	--broadcast
```

## Disclaimer

The contracts and scripts are experimental examples. Review and test them thoroughly before using any contract with real assets.
