#!/bin/bash

# =============================================================================
# Quick Start Script - One command setup
# 
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/opencode-agents/main/quickstart.sh | bash
# =============================================================================

set -e

# Check if git is available
if ! command -v git &> /dev/null; then
    echo "Error: git is required"
    echo "Install git first: https://git-scm.com/downloads"
    exit 1
fi

# Clone or update repo
TARGET_DIR="${HOME}/opencode-agents"

if [ -d "${TARGET_DIR}/.git" ]; then
    echo "Updating opencode-agents..."
    cd "${TARGET_DIR}"
    git pull
else
    echo "Cloning opencode-agents..."
    git clone https://github.com/YOUR_USERNAME/opencode-agents.git "${TARGET_DIR}"
    cd "${TARGET_DIR}"
fi

# Run setup
echo ""
echo "Running setup..."
echo ""

chmod +x setup.sh
./setup.sh
