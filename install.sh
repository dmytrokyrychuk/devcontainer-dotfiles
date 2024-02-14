#!/bin/bash
dir=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
cd -P "$dir"
set -e

echo "user = '$USER'" > ./flake-vars.toml
echo "home = '$HOME'" >> ./flake-vars.toml

if ! command -v nix &> /dev/null
then
    set -x
    sh +x <(curl -L https://nixos.org/nix/install) --no-daemon
    set +x
    source $HOME/.nix-profile/etc/profile.d/nix.sh

    USER_NIX_CONF=$HOME/.config/nix/nix.conf
    mkdir -p $(dirname $USER_NIX_CONF)
    echo extra-experimental-features = nix-command flakes >> $USER_NIX_CONF
fi

set -x
nix run . -- switch --flake .#vscode
