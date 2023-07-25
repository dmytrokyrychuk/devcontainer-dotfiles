#!/bin/bash
dir=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
cd -P "$dir"
set -e

echo $HOME > ./.flake-var-home
echo $USER > ./.flake-var-user

set -x
nix run . -- switch --flake .#vscode
