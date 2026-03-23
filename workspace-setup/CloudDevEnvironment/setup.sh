#!/bin/bash

# Install settings.local.json custom overrides
SCRIPT_DIR="$(dirname "$0")"
TARGET_DIR="/workspaces/CloudDevEnvironment/.claude"

mkdir -p "$TARGET_DIR"
cp "$SCRIPT_DIR/settings.local.json" "$TARGET_DIR/settings.local.json"
