all: run

# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-z0-9A-Z_-]+:.*?## / {printf "\033[36m%-45s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

setup:
	brew update
	brew install openssl

	cargo install cargo-contract --vers ^0.15 --force --locked
	
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	source ~/.cargo/env
	rustup default stable
	rustup update
	rustup update nightly
	rustup target add wasm32-unknown-unknown --toolchain nightly
	rustup component add rust-src --toolchain nightly
	rustup target add wasm32-unknown-unknown --toolchain nightly

install-substrate-node:
	cargo install contracts-node --git https://github.com/paritytech/substrate-contracts-node.git --tag v0.1.0 --force --locked

test:
	cargo +nightly test

build:
	cargo +nightly contract build

run-node:
	substrate-contracts-node --dev --tmp


.PHONY: setup install-substrate-node test build run-node

