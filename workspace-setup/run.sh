#!/bin/bash

# Run workspace-specific setup scripts based on detected /workspaces/ directories
for dir in /workspaces/*/; do
    dir_name=$(basename "$dir")
    setup_script="$(dirname "$0")/${dir_name}/setup.sh"
    if [ -f "$setup_script" ]; then
        echo "Running workspace setup for ${dir_name}..."
        bash "$setup_script"
    fi
done
