# Dev Container Dotfiles

## Dynamic username and home directory workaround

We don't know the username of the vscode dev container ahead of time, and the
username may be different depending on the project configuration and base image.
We are specifying user name and user home directory within `.flake-var-*` files
with default values committed into these files. During dotfiles installation the
values are overriden based on the environment variables specified within the
shell that executes the `install.sh` script.
