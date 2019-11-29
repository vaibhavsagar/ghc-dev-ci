#!/usr/bin/env nix-shell
#! nix-shell -i bash
#! nix-shell -p cabal-install haskellPackages.ghcid nix

set -euxo pipefail

git clone --recursive https://gitlab.haskell.org/ghc/ghc/
cd ghc
git clone https://github.com/alpmestan/ghc.nix
cabal update
nix-shell ghc.nix --run './boot && ./configure && ghcid --run=":q" -o output.txt' || true
tail -n2 output.txt | head -n1 | grep 'All good'
