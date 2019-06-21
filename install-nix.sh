#!/usr/bin/env bash

export NIX_CURL_FLAGS=-sS
wget --retry-connrefused --waitretry=1 -O /tmp/nix-install https://nixos.org/releases/nix/nix-2.2.2/install
yes | sh /tmp/nix-install
source /home/circleci/.nix-profile/etc/profile.d/nix.sh
nix --version
nix-instantiate --eval -E 'with import <nixpkgs> {}; lib.version or lib.nixpkgsVersion'
