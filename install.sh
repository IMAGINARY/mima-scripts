#!/bin/bash
# Sync scripts into this repo into users home directory

SCRIPTNAME=$(basename "$0")

# Change to directory where the install script resides
cd "$(dirname "$0")"

# Sync files via rsync
rsync -a --info=ALL --exclude=".git" --exclude="$SCRIPTNAME" "$PWD/" ~/
