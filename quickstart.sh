#!/bin/bash

# =============================================================================
# Quick Start Script - One command setup
# 
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/MrNova420/opencode-agents/main/quickstart.sh | bash
# =============================================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║           opencode-agents Quick Setup                    ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Check if git is available
if ! command -v git &> /dev/null; then
    echo -e "${RED}Error: git is required${NC}"
    echo "Install git first: https://git-scm.com/downloads"
    exit 1
fi

# Install OpenCode CLI if not present
if ! command -v opencode &> /dev/null; then
    echo ""
    echo -e "${YELLOW}Installing OpenCode CLI...${NC}"
    curl -fsSL https://opencode.ai/install | sh
    source ~/.bashrc 2>/dev/null || true
fi

# Clone or update repo
TARGET_DIR="${HOME}/opencode-agents"

if [ -d "${TARGET_DIR}/.git" ]; then
    echo ""
    echo "Updating opencode-agents..."
    cd "${TARGET_DIR}"
    git pull
else
    echo ""
    echo "Cloning opencode-agents..."
    git clone https://github.com/MrNova420/opencode-agents.git "${TARGET_DIR}"
    cd "${TARGET_DIR}"
fi

# Run setup
echo ""
echo "Running setup..."
echo ""

chmod +x setup.sh
./setup.sh
