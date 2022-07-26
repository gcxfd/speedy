#!/usr/bin/env bash

if ! hash cargo-clippy 2>/dev/null; then
  rustup component add clippy
fi

git add -u && git commit -m'.' || true
cargo +nightly clippy --all --fix -Z unstable-options -- -A clippy::uninit_assumed_init
cargo fmt
