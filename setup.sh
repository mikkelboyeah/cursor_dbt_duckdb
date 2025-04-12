#!/bin/bash
# Script to set up the dbt DuckDB project environment without global installations

# Create a temporary directory for uv
mkdir -p .tools

# Download uv binary to the project (platform specific)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    curl -LsSf https://github.com/astral-sh/uv/releases/latest/download/uv-x86_64-unknown-linux-gnu.tar.gz | tar -xzf - -C .tools
elif [[ "$OSTYPE" == "darwin"* ]]; then
    curl -LsSf https://github.com/astral-sh/uv/releases/latest/download/uv-x86_64-apple-darwin.tar.gz | tar -xzf - -C .tools
elif [[ "$OSTYPE" == "msys"* ]] || [[ "$OSTYPE" == "win32" ]]; then
    # For Windows using git bash 
    mkdir -p .tools/uv
    curl -LsSf https://github.com/astral-sh/uv/releases/latest/download/uv-x86_64-pc-windows-msvc.zip -o .tools/uv.zip
    unzip -o .tools/uv.zip -d .tools
    rm .tools/uv.zip
    
    # Use the correct path to uv.exe on Windows
    UV_CMD=".tools/uv.exe"
else
    echo "Unsupported OS. Please install uv manually or use pip instead."
    exit 1
fi

# Set default UV_CMD for non-Windows platforms
if [ -z "$UV_CMD" ]; then
    UV_CMD=".tools/uv"
fi

# Create a project-local virtual environment using the downloaded uv
$UV_CMD venv .venv

# Install dependencies using uv
$UV_CMD pip install -r requirements.txt

# Create data directory for DuckDB
mkdir -p dbt_project/data

echo ""
echo "✅ Setup complete! Run the following to activate the environment:"
echo ""
echo "   source .venv/bin/activate  # On Windows: .venv\\Scripts\\activate"
echo ""
echo "Then cd into the dbt project:"
echo ""
echo "   cd dbt_project"
echo "   dbt run"
echo "" 