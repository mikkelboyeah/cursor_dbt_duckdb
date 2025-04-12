#!/bin/bash

# Get the absolute path to the .venv/Scripts directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_SCRIPTS_DIR="$(cd "$SCRIPT_DIR/../.venv/Scripts" && pwd)"

# Add .venv/Scripts to PATH
export PATH="$VENV_SCRIPTS_DIR:$PATH"

# Print confirmation message
echo "DBT environment activated!"
echo "You can now use 'dbt' commands directly."
echo "Run 'dbt --version' to verify." 