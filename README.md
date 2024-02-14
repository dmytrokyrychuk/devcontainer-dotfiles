# Dev Container Dotfiles

## Prerequisites

In order to use this repository you devcontainer must contain the [Nix package
manager](https://nixos.org/). Nix can be installed as a feature within
`devcontainer.json` like this:

```
"features": {
  "ghcr.io/devcontainers/features/nix:1": {
    "extraNixConfig": "experimental-features = nix-command flakes"
  }
},
```

## How to use

Add the following to your **user** settings in VSCode:

```
"dotfiles.repository": "dmytrokyrychuk/devcontainer-dotfiles"
```

When you build a devcontainer, VSCode will automatically clone the repository
specified in the settings into the devcontainer, and run the `install.sh` script.
