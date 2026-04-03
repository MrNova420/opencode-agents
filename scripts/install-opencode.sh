#!/bin/bash

# =============================================================================
# install-opencode.sh - Install opencode
# =============================================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║           opencode-agents - Install opencode               ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check if already installed
if command -v opencode &> /dev/null; then
    echo -e "${GREEN}✓${NC} opencode already installed"
    opencode --version 2>/dev/null || true
    echo ""
    read -p "Reinstall? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 0
    fi
fi

echo "Installing opencode..."
echo ""

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected: macOS"
    echo ""
    echo "Choose installation method:"
    echo "  1) Homebrew (recommended)"
    echo "  2) npm"
    echo "  3) Direct install script"
    echo ""
    read -p "Choice (1-3): " choice
    
    case $choice in
        1)
            echo ""
            echo "Running: brew install anomalyco/tap/opencode"
            brew install anomalyco/tap/opencode
            ;;
        2)
            echo ""
            echo "Running: npm install -g opencode-ai"
            npm install -g opencode-ai
            ;;
        3)
            echo ""
            curl -fsSL https://opencode.ai/install | bash
            ;;
    esac
    
elif [[ "$OSTYPE" == "linux-gnu"* ]] || [[ "$OSTYPE" == "linux-gnu."* ]]; then
    echo "Detected: Linux"
    echo ""
    echo "Installing via official script..."
    curl -fsSL https://opencode.ai/install | bash
else
    echo -e "${YELLOW}⚠${NC} Unknown OS: $OSTYPE"
    echo ""
    echo "Falling back to npm..."
    npm install -g opencode-ai
fi

echo ""
if command -v opencode &> /dev/null; then
    echo -e "${GREEN}✓${NC} opencode installed successfully!"
    opencode --version 2>/dev/null || true
else
    echo -e "${RED}✗${NC} Installation may have failed. Try manual install:"
    echo "  curl -fsSL https://opencode.ai/install | bash"
fi
