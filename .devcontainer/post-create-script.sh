#!/usr/bin/bash

set -e

rm ~/.gitconfig
git config --global --add safe.directory /workspaces/git-basics-example
git config --global --unset credential.helper
